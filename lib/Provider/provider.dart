// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class UserService with ChangeNotifier {
  late User _user;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User get user => _user;

  Future<void> fetchUser(String id) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('Users').doc(id).get();

      print(doc.data());
      _user = User.fromDocument(doc);

      print(_user);
      double caloriasNecesarias;
      if (_user.genero == 'Masculino') {
        caloriasNecesarias = (66 +
                (13.7 * _user.peso) +
                (5 * _user.altura) -
                (6.8 * _user.edad)) *
            _user.nivelActividad;
      } else if (_user.genero == 'Femenino') {
        caloriasNecesarias = (655 +
                (9.6 * _user.peso) +
                (1.8 * _user.altura) -
                (4.7 * _user.edad)) *
            _user.nivelActividad;
      } else {
        throw Exception('Invalid gender: ${_user.genero}');
      }

      print(caloriasNecesarias);
      // Guarda el resultado en Firebase:
      try {
        print("a");
        await _firestore.collection('Users').doc(id).set(
            {'caloriasNecesarias': caloriasNecesarias},
            SetOptions(merge: true));
      } catch (e) {
        print('Error al actualizar el documento: $e');
      }
      notifyListeners();
    } catch (e) {
      print('Error en fetchUser: $e');
    }
  }
}

class User {
  final String genero;
  final double altura; // changed from int to double
  final double nivelActividad;
  final double peso; // changed from int to double
  final double edad; // changed from int to double

  User(
      {required this.genero,
      required this.altura,
      required this.nivelActividad,
      required this.peso,
      required this.edad});

  // Crea un User desde un DocumentSnapshot de Firestore
  factory User.fromDocument(DocumentSnapshot doc) {
    Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
    return User(
      genero: data?['genero'] ?? 'Desconocido',
      altura: data?['altura']?.toDouble() ?? 0, // parse to double
      nivelActividad: data?['nivelActividad'] ?? 0.0,
      peso: data?['peso']?.toDouble() ?? 0, // parse to double
      edad: data?['edad']?.toDouble() ?? 0, // parse to double
    );
  }
}
