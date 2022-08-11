import 'package:cloud_firestore/cloud_firestore.dart';

class LearnFoodsModel {
  String? docId;
  String? image;
  String? text;

  LearnFoodsModel({
    this.docId,
    this.image,
    this.text,
  });

  LearnFoodsModel.fromDocumentSnapshot({DocumentSnapshot? documentSnapshot}) {
    docId = documentSnapshot!.id;
    image = documentSnapshot["image"];
    text = documentSnapshot["text"];
  }
}
