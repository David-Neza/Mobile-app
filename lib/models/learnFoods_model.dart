import 'package:cloud_firestore/cloud_firestore.dart';

class LearnFoodsModel {
  String? id;
  String? image;
  String? text;

  LearnFoodsModel (
      {this.id,
      this.image,
      this.text,
      });

 LearnFoodsModel.fromDocumentSnapshot({DocumentSnapshot? documentSnapshot}) {
    id = documentSnapshot!.id;
    image = documentSnapshot["image"];
    text = documentSnapshot["text"];
    
  }
}