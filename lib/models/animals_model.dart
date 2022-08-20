import 'package:cloud_firestore/cloud_firestore.dart';

class AnimalsModel {
  String? docId;
  String? image;
  String? text;
  String? audio;

  AnimalsModel({
    this.docId,
    this.image,
    this.text,
    this.audio,
  });


  AnimalsModel.fromDocumentSnapshot({DocumentSnapshot? documentSnapshot}) {
    docId = documentSnapshot!.id;
    image = documentSnapshot["image"];
    text = documentSnapshot["text"];
    audio = documentSnapshot["audio"];
  }

}
