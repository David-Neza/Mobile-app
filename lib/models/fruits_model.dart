import 'package:cloud_firestore/cloud_firestore.dart';

class FruitsModel {
  String? docId;
  String? image;
  String? text;
  String? audio;

  FruitsModel({
    this.docId,
    this.image,
    this.text,
    this.audio,
  });

  FruitsModel.fromDocumentSnapshot({DocumentSnapshot? documentSnapshot}) {
    docId = documentSnapshot!.id;
    image = documentSnapshot["image"];
    text = documentSnapshot["text"];
    audio = documentSnapshot["audio"];
  }
}
