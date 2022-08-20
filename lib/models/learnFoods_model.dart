import 'package:cloud_firestore/cloud_firestore.dart';

class LearnFoodsModel {
  String? docId;
  String? image;
  String? text;
  String? audio;

  LearnFoodsModel({
    this.docId,
    this.image,
    this.text,
    this.audio,
  });

  LearnFoodsModel.fromDocumentSnapshot({DocumentSnapshot? documentSnapshot}) {
    docId = documentSnapshot!.id;
    image = documentSnapshot["image"];
    text = documentSnapshot["text"];
    audio = documentSnapshot["audio"];
  }
}
