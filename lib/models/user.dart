import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? email;
  String? name;
  bool? isAdmin;

  UserModel({this.id, this.email, this.name, this.isAdmin = false});

  UserModel.fromDocumentSnapshot({DocumentSnapshot? documentSnapshot}) {
    id = documentSnapshot!.id;
    email = documentSnapshot["email"];
    name = documentSnapshot["name"];
    isAdmin = documentSnapshot["is_Admin"];
  }
}

class AppUser {
  final String uid;

  AppUser({required this.uid});
}
