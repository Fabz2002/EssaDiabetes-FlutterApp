// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app_flutter/Routes/routes.dart';
import 'package:first_app_flutter/services/notification.services.dart';
import 'package:first_app_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

import '../Provider/idprovider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final LocalAuthentication auth;
  final TextEditingController _idController = TextEditingController();

  @override
  void initState() {
    super.initState();
    auth = LocalAuthentication();
  }

  Future<void> _authenticate() async {
    final id = _idController.text.trim();
    if (id.isEmpty || id.length != 8 || id.startsWith('0')) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error de entrada'),
            content: const Text('Ingrese un número de DNI válido (8 dígitos).'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    try {
      Provider.of<IdProvider>(context, listen: false).setId(id);
      final db = FirebaseFirestore.instance;
      final documentRef = db.collection("Users").doc(id);
      bool documentExists =
          await documentRef.get().then((snapshot) => snapshot.exists);

      if (!documentExists) {
        await documentRef.set({});
      }

      bool authenticated = await auth.authenticate(
        localizedReason: "Escane su huella digital para autenticar",
        options:
            const AuthenticationOptions(stickyAuth: true, biometricOnly: true),
      );

      print("Authenticated: $authenticated");

      if (authenticated) {
        showNotifications("Bienvenido a EssaDiabetes",
            "Ingresaste con el dni $id correctamente");

        if (documentExists) {
          Navigator.pushNamed(context, Routes.Homepage, arguments: id);
        } else {
          Navigator.pushNamed(context, Routes.PresettingPage, arguments: id);
        }
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhiteColor,
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Center(
                  child: Text(
                    "EssaDiabetes",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 50.0),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/fingerprint.png",
                        width: 150,
                        color: Colors.lightBlue[400],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Autenticación por Huella",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 15.0),
                        width: 140,
                        child: const Text(
                          "Autenticación usando la huella digital como método de acceso a la aplicación",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            height: 1.5,
                          ),
                        ),
                      ),
                      Container(
                        child: TextField(
                          controller: _idController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(8),
                          ],
                          style: const TextStyle(
                            color: kPrimaryColor,
                          ),
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            labelText: 'Ingrese su DNI',
                            labelStyle: TextStyle(
                              color: Colors.blue,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 15.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue[400],
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
                          child: TextButton(
                            onPressed: _authenticate,
                            child: const Text(
                              "Ingresar",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
