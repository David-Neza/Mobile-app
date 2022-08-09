import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? email;
  String? name;

  UserModel({this.id, this.email, this.name});

  UserModel.fromDocumentSnapshot({DocumentSnapshot? documentSnapshot}) {
    id = documentSnapshot!.id;
    email = documentSnapshot["email"];
    name = documentSnapshot["name"];
  }
}

class AppUser {
  final String uid;

  AppUser({required this.uid});
}
