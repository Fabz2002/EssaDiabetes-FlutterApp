import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app_flutter/core/data/fields/user.dart';

class UserModel {
  UserModel(
      {this.altura,
      this.caloriasNecesarias,
      this.edad,
      this.genero,
      this.nivelActividad,
      this.peso});
  final double? altura;
  final double? caloriasNecesarias;
  final int? edad;
  final String? genero;
  final double? nivelActividad;
  final double? peso;
  factory UserModel.fromSnapShot(DocumentSnapshot snapshot) {
    return UserModel(
        altura: snapshot.get(User.altura) ?? 0,
        caloriasNecesarias: snapshot.get(User.caloriasNecesarias) ?? 0,
        edad: snapshot.get(User.edad) ?? 0,
        genero: snapshot.get(User.genero) ?? "",
        nivelActividad: snapshot.get(User.nivelActividad) ?? 0,
        peso: snapshot.get(User.peso) ?? 0);
  }
}
