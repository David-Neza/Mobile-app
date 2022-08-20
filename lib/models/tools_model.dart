import 'package:cloud_firestore/cloud_firestore.dart';

class ToolsModel {
  String? docId;
  String? image;
  String? text;
  String? audio;

  ToolsModel({
    this.docId,
    this.image,
    this.text,
    this.audio,
  });

  ToolsModel.fromDocumentSnapshot({DocumentSnapshot? documentSnapshot}) {
    docId = documentSnapshot!.id;
    image = documentSnapshot["image"];
    text = documentSnapshot["text"];
    audio = documentSnapshot["audio"];
  }
}
