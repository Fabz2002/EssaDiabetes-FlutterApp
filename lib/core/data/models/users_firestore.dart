import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app_flutter/core/helper/firestore_helper.dart';
import 'package:injectable/injectable.dart';

import '../fields/user.dart';
import 'bastract_firestore.dart';

@lazySingleton
class UsersFirestore extends AbstractFirestore {
  UsersFirestore(FirestoreHelper helper) : super(helper);
  @override
  CollectionReference<Object?> get collection => helper.usersCollection;

  @override
  DocumentReference<Object?> getDocument(String id) => collection.doc(id);

  @override
  void checkField(String field, value) {
    switch (field) {
      case User.altura:
        if (value is int) {
          data[field] = value;
        } else {
          throw TypeError();
        }
        break;
      case User.caloriasNecesarias:
        if (value is int) {
          data[field] = value;
        } else {
          throw TypeError();
        }
        break;
      case User.edad:
        if (value is int) {
          data[field] = value;
        } else {
          throw TypeError();
        }
        break;
      case User.genero:
        if (value is String) {
          data[field] = value;
        } else {
          throw TypeError();
        }
        break;
      case User.nivelActividad:
        if (value is int) {
          data[field] = value;
        } else {
          throw TypeError();
        }
        break;
      case User.peso:
        if (value is int) {
          data[field] = value;
        } else {
          throw TypeError();
        }
        break;
      default:
        throw ArgumentError();
    }
  }
}
