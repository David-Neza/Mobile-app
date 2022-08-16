import 'package:cloud_firestore/cloud_firestore.dart';

class RwandanCeremoniesModel {
  String? docId;
  String? image;
  String? name;
  String? description;

  RwandanCeremoniesModel({
    this.docId,
    this.image,
    this.name,
    this.description,
  });

  RwandanCeremoniesModel.fromDocumentSnapshot({DocumentSnapshot? documentSnapshot}) {
    docId = documentSnapshot!.id;
    image = documentSnapshot["image"];
    name = documentSnapshot["name"];
    description = documentSnapshot["description"];
  }
}
