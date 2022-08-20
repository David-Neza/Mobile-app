import 'package:cloud_firestore/cloud_firestore.dart';

class RwandanHistoricalPlacesModel {
  String? docId;
  String? image;
  String? name;
  String? description;

  RwandanHistoricalPlacesModel({
    this.docId,
    this.image,
    this.name,
    this.description,
  });

  RwandanHistoricalPlacesModel.fromDocumentSnapshot({DocumentSnapshot? documentSnapshot}) {
    docId = documentSnapshot!.id;
    image = documentSnapshot["image"];
    name = documentSnapshot["name"];
    description = documentSnapshot["description"];
  }
}
