import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // create user
  Future<bool> createNewUser(
      {required UserModel user, required String name}) async {
    try {
      await _firestore.collection("users").doc(user.id).set({
        "name": name,
        "doc_id": user.id,
        "email": user.email,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Stream<UserModel> getUser({required String uid}) {
    return _firestore.collection("users").doc(uid).snapshots().map(
        (event) => UserModel.fromDocumentSnapshot(documentSnapshot: event));
  }
}