import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirestoreHelper {
  final FirebaseFirestore _firestore;
  FirestoreHelper(this._firestore);
  CollectionReference get commidasCollection =>
      _firestore.collection("Comidas");
  DocumentReference getComidas(String id) => commidasCollection.doc(id);

  CollectionReference get usersCollection => _firestore.collection("Users");
  DocumentReference getUsers(String id) => usersCollection.doc(id);
}
