import 'package:first_app_flutter/theme.dart';
import 'package:first_app_flutter/widgets/drawerContainer.widget.dart';
import 'package:first_app_flutter/widgets/header.widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import '../Provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../Routes/routes.dart';

import 'package:firebase_storage/firebase_storage.dart';

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

  bool _isPerGram = true;

  File? selectedImage;
  bool imageSelected = false;
  String imagenCargada = '';

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
        'imagenCargada': datos['imagenCargada'],
      };
    }).toList();

    await documentRef.update({
      'comidas': comidaList,
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

  Future<void> _selectImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
        
    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
        imageSelected = true;
        imagenCargada = pickedImage.name;
      });

      final storageRef = FirebaseStorage.instance.refFromURL(
          'gs://firstproject-99744.appspot.com/comidas/$imagenCargada');

      await storageRef.putFile(selectedImage!);

      // ignore: unused_local_variable
      String imageUrl = await storageRef.getDownloadURL();
      // Guardar la URL de la imagen en la base de datos
      
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Imagen cargada correctamente')),
      );
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
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    autofocus: true,
                    decoration: InputDecoration(
                        icon: const Icon(Icons.lunch_dining),
                        labelText: 'Nombre de la comida',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: kPrimaryColor, width: 2.0))),
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
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Calorías',
                        icon: const Icon(Icons.fastfood),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: kPrimaryColor, width: 2.0))),
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
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: Row(
                    children: [
                      const Text('Cada 100gr'),
                      Switch(
                        value: _isPerGram,
                        onChanged: (value) {
                          setState(() {
                            _isPerGram = value;
                          });
                        },
                      ),
                      const Text('Por unidad'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 5),
                  child: TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                        icon: const Icon(Icons.sms),
                        labelText: 'Descripción',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Colors.lightBlue, width: 2.0))),
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
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        ElevatedButton.icon(
                          onPressed: _selectImage,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                imageSelected ? kPrimaryColor : kDarkGreyColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          icon: const Icon(Icons.camera_alt),
                          label: const Text(
                            'Escoger foto',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        if (imageSelected)
                          Text(
                            'Imagen seleccionada: $imagenCargada',
                            style: const TextStyle(fontSize: 13),
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Map<String, dynamic> comidaData = {
                        'nombre': nombreComida,
                        'descripcion': descripcion,
                        'calorias': calorias,
                        'imagenCargada': imagenCargada,
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                  ),
                  child: const Text('Agregar Comida'),
                ),
                const SizedBox(
                  height: 0,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (datosComida.isNotEmpty) {
                      if (_formKey.currentState!.validate()) {
                        await saveDataToDatabase();
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamed(context, Routes.UserProfilePage,
                            arguments: id);
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('No se han agregado comidas')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                  ),
                  child: const Text('Guardar'),
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
