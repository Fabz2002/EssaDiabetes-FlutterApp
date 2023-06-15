// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class ComidasPlan extends StatefulWidget {
  final String id;

  const ComidasPlan({Key? key, required this.id}) : super(key: key);

  @override
  State<ComidasPlan> createState() => _ComidasPlanState();
}

class _ComidasPlanState extends State<ComidasPlan> {
  late String id;
  DatabaseReference? dbRef;
  String ruta = '';
  List<Map<dynamic, dynamic>> lists = [];

  @override
  void initState() {
    super.initState();
    id = widget.id;

    // Obtén una instancia de Firestore
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Obtén la referencia del documento que deseas leer
    DocumentReference docRef = firestore.collection('Users').doc(id);

    // Obtiene los datos del documento
    docRef.get().then((DocumentSnapshot snapshot) {
      if (snapshot.exists) {
        var fieldValue = snapshot.get('caloriasNecesarias');
        if (fieldValue >= 2100) {
          setState(() {
            ruta = 'comidas/cal2300/d';
            dbRef = FirebaseDatabase.instance.ref().child(ruta);
          });
        } else {
          setState(() {
            ruta = 'comidas/cal2000/d';
            dbRef = FirebaseDatabase.instance.ref().child(ruta);
          });
        }
        print("el valor $fieldValue");
      } else {
        // El documento no existe
        print('El documento no existe.');
      }
    }).catchError((error) {
      // Error al obtener el documento
      print('Error al obtener el documento: $error');
    });

    dbRef?.onValue.listen((event) {
      var snapshot = event.snapshot;
      var values = snapshot.value as List;
      lists.clear();
      // ignore: avoid_function_literals_in_foreach_calls
      values.forEach((value) {
        if (value != null) {
          Map<dynamic, dynamic> mapValue = value as Map<dynamic, dynamic>;
          lists.add(mapValue);
        }
      });
      setState(() {});
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
