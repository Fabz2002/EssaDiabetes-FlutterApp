// ignore_for_file: avoid_print

import 'package:first_app_flutter/widgets/drawerContainer.widget.dart';
import 'package:first_app_flutter/widgets/foodItem.widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:provider/provider.dart';

import '../Provider/idprovider.dart';
import '../Routes/routes.dart';
import '../theme.dart';

class UserProfileView extends StatefulWidget {
  final String id;
  const UserProfileView({Key? key, required this.id}) : super(key: key);

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Map<String, dynamic>> comidaList = [];
  late String id;

  Future<void> fetchComidaData() async {
    final db = FirebaseFirestore.instance;
    final documentSnapshot = await db.collection('Users').doc(widget.id).get();

    if (documentSnapshot.exists) {
      final data = documentSnapshot.data();
      final comidas = data?['comidas'] as List<dynamic>;

      comidaList = comidas.map((comida) {
        return {
          'nombre': comida['nombre'],
          'descripcion': comida['descripcion'],
          'calorias': comida['calorias'],
          'imagenCargada': comida['imagenCargada'],
        };
      }).toList();

      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    fetchComidaData();
  }

  void borrarComida(int index) async {
  // Obtener la comida que se va a borrar
  final comidaABorrar = comidaList[index];

  // Eliminar la comida de la lista en la UI
  setState(() {
    comidaList.removeAt(index);
  });

  // Acceder a la base de datos
  final db = FirebaseFirestore.instance;

  // Realizar la operación de actualización para eliminar la comida
  await db.collection('Users').doc(widget.id).update({
    'comidas': FieldValue.arrayRemove([comidaABorrar])
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.maxFinite,
                      height: 350,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/world.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 50,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            _scaffoldKey.currentState?.openDrawer();
                          },
                          iconSize: 35.0,
                          color: kWhiteColor,
                          icon: const Icon(Icons.menu),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 230,
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: 25,
                        right: 20,
                        top: 30,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height - 230,
                      decoration: const BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Mis Alimentos",
                                style: TextStyle(
                                  color: kDarkGreyColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: comidaList.map((comida) {
                                  final nombre = comida['nombre'];
                                  final descripcion = comida['descripcion'];
                                  final double calorias = comida['calorias'];
                                  final caloriasString = calorias.toString();
                                  final imagenCargada = comida['imagenCargada'];
                                  final filePath = 'comidas/$imagenCargada';
                                  return FutureBuilder(
                                    future: firebase_storage
                                        .FirebaseStorage.instance
                                        .ref(filePath)
                                        .getDownloadURL(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const CircularProgressIndicator();
                                      } else {
                                        return FoodItem(
                                          title: nombre,
                                          calories: caloriasString,
                                          comments: descripcion,
                                          imagePath: snapshot.data,
                                          onDelete: () {
                                            borrarComida(comidaList.indexOf(comida));
                                          },
                                        );
                                      }
                                    },
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                final idProvider =
                  Provider.of<IdProvider>(context, listen: false);
                Navigator.pushNamed(context, Routes.FoodFormPage,
                  arguments: idProvider.id);
              },
              child: const Icon(Icons.add),
              
            ),
          ),
        ],
      ),
      drawer: DrawerForInfo(
        scaffoldKey: _scaffoldKey,
      ),
    );
  }
}
