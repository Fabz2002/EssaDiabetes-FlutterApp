import 'package:flutter/material.dart';

class IdProvider with ChangeNotifier {
  late String _id;

  String get id => _id;

  void setId(String value) {
    _id = value;
    notifyListeners();
  }
}
