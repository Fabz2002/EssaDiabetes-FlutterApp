import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app_flutter/core/data/fields/commida.dart';
import 'package:first_app_flutter/core/helper/firestore_helper.dart';
import 'package:injectable/injectable.dart';

import 'bastract_firestore.dart';

@lazySingleton
class CommidaFirestore extends AbstractFirestore {
  CommidaFirestore(FirestoreHelper helper) : super(helper);
  @override
  CollectionReference<Object?> get collection => helper.commidasCollection;

  @override
  DocumentReference<Object?> getDocument(String id) => collection.doc(id);

  @override
  void checkField(String field, value) {
    switch (field) {
      case Commida.desayuno:
        if (value is List<Map<String, dynamic>>) {
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
