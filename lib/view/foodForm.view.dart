import 'package:first_app_flutter/theme.dart';
import 'package:first_app_flutter/widgets/drawerContainer.widget.dart';
import 'package:first_app_flutter/widgets/header.widget.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class FoodForm extends StatefulWidget {
  const FoodForm({super.key});

  @override
  State<FoodForm> createState() => _FoodFormState();
}

class _FoodFormState extends State<FoodForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isPerGram = true;
  double _calories = 0.0;
  bool _isImageSelected = false;
  // ignore: unused_field
  String _selectedImageName = '';
  // ignore: unused_field
  File? _selectedImage;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Aquí puedes realizar cualquier acción con los datos ingresados
      // ignore: avoid_print
      print('Calorías: $_calories, por gramos: $_isPerGram');
    }
  }

  bool validarNombreComida(String value) {
    final alphaRegex = RegExp(r'^[a-zA-Z ]+$');
    return alphaRegex.hasMatch(value);
  }

  Future<void> _selectImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
        _isImageSelected = true;
        _selectedImageName =
            pickedImage.name; // Obtener el nombre de la imagen seleccionada
      });
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
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    autofocus: true,
                    decoration: InputDecoration(
                        icon: const Icon(Icons.lunch_dining),
                        hintText: 'Nombre de la comida',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Colors.lightBlue, width: 2.0))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingresa el nombre de la comida';
                      }
                      if (!validarNombreComida(value)) {
                        return 'Solo se permiten letras en el nombre de la comida';
                      }
                      return null;
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
                                color: Colors.lightBlue, width: 2.0))),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingresa las calorías';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _calories = double.parse(value!);
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
                  child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                        icon: const Icon(Icons.sms),
                        hintText: 'Anotaciones',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Colors.lightBlue, width: 2.0))),
                  ),
                ),
                const SizedBox(
                  height: 0,
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
                            // ignore: deprecated_member_use
                            primary:
                                _isImageSelected ? Colors.blue : kDarkGreyColor,
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
                        if (_isImageSelected) // Mostrar el nombre de la imagen solo si está seleccionada
                          Text(
                            'Imagen seleccionada: $_selectedImageName',
                            // ignore: prefer_const_constructors
                            style: TextStyle(fontSize: 15),
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      'Guardar',
                      style: TextStyle(fontSize: 25),
                    ),
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
