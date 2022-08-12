import 'package:cloud_firestore/cloud_firestore.dart';

class AnimalsModel {
  String? docId;
  String? image;
  String? text;

  AnimalsModel({
    this.docId,
    this.image,
    this.text,
  });

  AnimalsModel.fromDocumentSnapshot({DocumentSnapshot? documentSnapshot}) {
    docId = documentSnapshot!.id;
    image = documentSnapshot["image"];
    text = documentSnapshot["text"];
  }
}
