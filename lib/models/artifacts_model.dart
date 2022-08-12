import 'package:cloud_firestore/cloud_firestore.dart';

class ArtifactsModel {
  String? docId;
  String? image;
  String? text;

  ArtifactsModel({
    this.docId,
    this.image,
    this.text,
  });

  ArtifactsModel.fromDocumentSnapshot({DocumentSnapshot? documentSnapshot}) {
    docId = documentSnapshot!.id;
    image = documentSnapshot["image"];
    text = documentSnapshot["text"];
  }
}
