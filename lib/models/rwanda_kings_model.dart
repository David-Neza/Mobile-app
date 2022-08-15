import 'package:cloud_firestore/cloud_firestore.dart';

class RwandaKingsModel {
  String? docId;
  String? image;
  String? name;
  String? description;

  RwandaKingsModel({
    this.docId,
    this.image,
    this.name,
    this.description,
  });

  RwandaKingsModel.fromDocumentSnapshot({DocumentSnapshot? documentSnapshot}) {
    docId = documentSnapshot!.id;
    image = documentSnapshot["image"];
    name = documentSnapshot["name"];
    description = documentSnapshot["description"];
  }
}
