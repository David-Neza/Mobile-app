import 'package:cloud_firestore/cloud_firestore.dart';

class ArtifactsModel {
  String? docId;
  String? image;
  String? text;
  String? description;
  String? audio;

  ArtifactsModel({
    this.docId,
    this.image,
    this.text,
    this.description,
    this.audio,
  });

  ArtifactsModel.fromDocumentSnapshot({DocumentSnapshot? documentSnapshot}) {
    docId = documentSnapshot!.id;
    image = documentSnapshot["image"];
    text = documentSnapshot["text"];
    description = documentSnapshot["description"];
    audio = documentSnapshot["audio"];
  }
}
