import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class ExternalModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
  FirebaseFirestore get firestore => FirebaseFirestore.instance;
}
