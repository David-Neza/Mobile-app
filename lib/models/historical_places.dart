import 'package:cloud_firestore/cloud_firestore.dart';

class HistoricalPlacesModel {
  String? docId;
  String? image;
  String? text;

  HistoricalPlacesModel({
    this.docId,
    this.image,
    this.text,
  });

  HistoricalPlacesModel.fromDocumentSnapshot({DocumentSnapshot? documentSnapshot}) {
    docId = documentSnapshot!.id;
    image = documentSnapshot["image"];
    text = documentSnapshot["text"];
  }
}
