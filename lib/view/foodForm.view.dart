import 'package:first_app_flutter/theme.dart';
import 'package:first_app_flutter/widgets/drawerContainer.widget.dart';
import 'package:first_app_flutter/widgets/header.widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import '../Provider/provider.dart';

class FoodForm extends StatefulWidget {
  final String id;
  const FoodForm({Key? key, required this.id}) : super(key: key);

  @override
  State<FoodForm> createState() => _FoodFormState();
}

class _FoodFormState extends State<FoodForm> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  List<Map<String, dynamic>> datosComida = [];
  late String id;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    id = widget.id;
  }

  late String nombreComida;
  late String descripcion;
  late double calorias;

  Future<void> saveDataToDatabase() async {
    UserService userService = Provider.of<UserService>(context, listen: false);
    final db = FirebaseFirestore.instance;
    final documentRef = db.collection("Users").doc(id);

    List<Map<String, dynamic>> comidaList = datosComida.map((datos) {
      return {
        'nombre': datos['nombre'],
        'descripcion': datos['descripcion'],
        'calorias': datos['calorias'],
      };
    }).toList();

    await documentRef.update({
      'Comida': comidaList,
    });

    try {
      await userService.fetchUser(id);
      return;
    } catch (e) {
      if (e is FirebaseException && e.code == 'not-found') {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('El usuario con ID $id no se encuentra.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Header(
                  imgUser: 'assets/images/default.png',
                  scaffoldKey: _scaffoldKey,
                ),
                Container(
                  alignment: Alignment.center,
                  child: const Padding(
                    padding: EdgeInsets.only(top: 14.0, bottom: 10),
                    child: Text(
                      'Registro de Comida',
                      style: TextStyle(
                        fontSize: 29.0,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Nombre de comida',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresa el nombre de la comida';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          nombreComida = value;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Descripción',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresa la descripción';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          descripcion = value;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Calorías',
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresa las calorías';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          calorias = double.tryParse(value) ?? 0;
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Map<String, dynamic> comidaData = {
                              'nombre': nombreComida,
                              'descripcion': descripcion,
                              'calorias': calorias,
                            };
                            datosComida.add(comidaData);
                            setState(() {
                              nombreComida = nombreComida;
                              descripcion = descripcion;
                              calorias = calorias;
                            });

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Comida agregada con éxito')),
                            );
                          }
                        },
                        child: const Text('Agregar Comida'),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          if (datosComida.isNotEmpty) {
                            if (_formKey.currentState!.validate()) {
                              await saveDataToDatabase();
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('No se han agregado comidas')),
                            );
                          }
                        },
                        child: const Text('Guardar'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: DrawerForInfo(scaffoldKey: _scaffoldKey),
    );
  }
}
