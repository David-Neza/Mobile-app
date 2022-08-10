import 'package:clds/models/artifacts_model.dart';
import 'package:clds/models/ibisakuzo_model.dart';
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


  List<IbisakuzoModel> _ibisakuzoListFromSnaphot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return IbisakuzoModel.fromDocumentSnapshot(documentSnapshot: doc);
    }).toList();
  }

  Future<List<IbisakuzoModel>> getIbisakuzo() async{
    return await _firestore
      .collection("IbisakuzoList")
      .get()
      .then(_ibisakuzoListFromSnaphot);
  }

  List<ArtifactsModel> _artifactsFromSnaphot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return ArtifactsModel.fromDocumentSnapshot(documentSnapshot: doc);
    }).toList();
  }

  Future<List<ArtifactsModel>> getArtifacts() async{
    return await _firestore
      .collection("artifacts")
      .get()
      .then(_artifactsFromSnaphot);
  }

}
