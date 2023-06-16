// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ComidasPlan extends StatefulWidget {
  final String id;

  const ComidasPlan({Key? key, required this.id}) : super(key: key);

  @override
  State<ComidasPlan> createState() => _ComidasPlanState();
}

class _ComidasPlanState extends State<ComidasPlan> {
  late String id;
  String ruta = '';
  List<Map<dynamic, dynamic>> lists = [];

  @override
  void initState() {
    super.initState();
    id = widget.id;

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    DocumentReference userDocRef = firestore.collection('Users').doc(id);

    userDocRef.get().then((DocumentSnapshot userSnapshot) {
      if (userSnapshot.exists) {
        var calories = userSnapshot.get('caloriasNecesarias');
        String mealDoc = '';

        if (calories >= 2000) {
          mealDoc = 'cal2300';
        } else if (calories <= 1999 && calories > 1690) {
          mealDoc = 'cal2000';
        } else if (calories <= 1690 && calories > 1399) {
          mealDoc = 'cal1700';
        } else if (calories <= 1399) {
          mealDoc = 'cal1300';
        }

        firestore
            .collection('Comidas')
            .doc(mealDoc)
            .get()
            .then((DocumentSnapshot mealSnapshot) {
          if (mealSnapshot.exists) {
            Map<String, dynamic> data =
                mealSnapshot.data() as Map<String, dynamic>;
            Map<String, dynamic> meals =
                data['desayuno'] as Map<String, dynamic>;
            setState(() {
              lists = meals.entries
                  .map((e) => {
                        'titulo': e.value['titulo'],
                        'img': e.value['img'],
                        'kcal': e.value['kcal']
                      })
                  .toList();
            });
          } else {
            print('El documento de comidas no existe.');
          }
        }).catchError((error) {
          print('Error al obtener el documento de comidas: $error');
        });
      } else {
        print('El documento del usuario no existe.');
      }
    }).catchError((error) {
      print('Error al obtener el documento del usuario: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: lists.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Row(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(lists.length, (index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 20, top: 20 / 2, bottom: 10 * 2),
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.width * 0.6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.0),
                            color: const Color.fromRGBO(165, 195, 223, 1),
                            image: DecorationImage(
                              image: NetworkImage(lists[index]["img"]),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.3),
                                BlendMode.darken,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  lists[index]["titulo"].toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  // ignore: prefer_interpolation_to_compose_strings
                                  lists[index]["kcal"].toString() + " calorias",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
      ),
    );
  }
}
