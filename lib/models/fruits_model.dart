import 'package:cloud_firestore/cloud_firestore.dart';

class FruitsModel {
  String? docId;
  String? image;
  String? text;

  FruitsModel({
    this.docId,
    this.image,
    this.text,
  });

  FruitsModel.fromDocumentSnapshot({DocumentSnapshot? documentSnapshot}) {
    docId = documentSnapshot!.id;
    image = documentSnapshot["image"];
    text = documentSnapshot["text"];
  }
}
