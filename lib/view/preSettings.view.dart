// ignore_for_file: avoid_print

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:first_app_flutter/Routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PreSettingsView extends StatefulWidget {
  final String id;
  const PreSettingsView({Key? key, required this.id}) : super(key: key);

  @override
  State<PreSettingsView> createState() => _PreSettingsViewState();
}

class _PreSettingsViewState extends State<PreSettingsView> {
  late String id;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    id = widget.id;
  }

  int _selectedButtonIndex = 0;
  double selectednivelActividad = 1.2;
  @override
  void initState() {
    super.initState();
    registerDevice();
    // callOnFcmApiSendPushNotifications(
    //     title: 'EssaDiabetes',
    //     body:
    //         'Bienvenido a EssaDiabetes,recuerda que desde ahora tu dni : ${widget.id} será tu identficacion para todo');
  }

  void registerDevice() async {
    String? token = await _firebaseMessaging.getToken();
    if (token != null) {
      print("Token de registro: $token");

      final response = await http.post(
        Uri.parse('http://192.168.18.27:3000/register'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {'token': token},
      );
      print('Código de estado de la respuesta: ${response.statusCode}');
      print('Cuerpo de la respuesta: ${response.body}');
      if (response.statusCode == 200) {
        print('Registrado exitosamente');
      } else {
        print('Error al registrar el dispositivo');
      }
    } else {
      print('No se pudo obtener el token de registro de FCM');
    }
  }

  void _selectButton(int index) {
    double nivelActividad;
    switch (index) {
      case 0:
        nivelActividad = 1.2;
        break;
      case 1:
        nivelActividad = 1.375;
        break;
      case 2:
        nivelActividad = 1.55;
        break;
      case 3:
        nivelActividad = 1.725;
        break;
      case 4:
        nivelActividad = 1.9;
        break;
      default:
        nivelActividad = 1.2;
    }
    setState(() {
      _selectedButtonIndex = index;
      selectednivelActividad = nivelActividad;
    });
  }

  void _submitnivelActividad(double nivelActividad) async {
    final db = FirebaseFirestore.instance;
    final documentRef = db.collection("Users").doc(id);

    await documentRef.update({
      'nivelActividad': nivelActividad,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                'Nivel de Actividad',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                _buildButtonColumn(
                  0,
                  "Poco o ningún ejercicio",
                  const Icon(
                    Icons.directions_walk,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                _buildButtonColumn(
                  1,
                  "Ejercicio ligero (1-3 días)",
                  const Icon(
                    Icons.directions_bike,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                _buildButtonColumn(
                  2,
                  "Ejercicio Moderado(3-5 días)",
                  const Icon(
                    Icons.directions_run,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                _buildButtonColumn(
                  3,
                  "Ejercicio fuerte (6-7 días)",
                  const Icon(
                    Icons.fitness_center,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                _buildButtonColumn(
                  4,
                  "Ejercicio Intenso (2 vcs x día)",
                  const Icon(
                    Icons.accessibility_new,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 18.0),
                  width: MediaQuery.of(context).size.width * .4,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue[500],
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2.0, bottom: 4.0),
                    child: TextButton(
                      onPressed: () {
                        print("Valor seleccionado: $selectednivelActividad");
                        _submitnivelActividad(selectednivelActividad);
                        Navigator.pushNamed(context, Routes.Presetting2Page,
                            arguments: id);
                      },
                      child: const Text(
                        "Acceder",
                        style: TextStyle(
                          color: kDefaultIconLightColor,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonColumn(int index, String text, Icon icon) {
    final isSelected = _selectedButtonIndex == index;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      width: MediaQuery.of(context).size.width * 0.78,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 6),
        child: TextButton(
          onPressed: () {
            _selectButton(index);
          },
          style: TextButton.styleFrom(
            backgroundColor: isSelected ? Colors.blue : Colors.grey[400],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          child: Row(
            children: [
              icon,
              const SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: const TextStyle(
                  color: kDefaultIconLightColor,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
