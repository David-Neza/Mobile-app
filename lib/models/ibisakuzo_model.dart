import 'package:cloud_firestore/cloud_firestore.dart';

class IbisakuzoModel {
  String? docId;
  String? igisakuzo;
  String? answer;

  IbisakuzoModel(
      {
        this.docId,
        this.igisakuzo,
        this.answer,
      });

 IbisakuzoModel.fromDocumentSnapshot({DocumentSnapshot? documentSnapshot}) {
    docId = documentSnapshot!.id;
    igisakuzo = documentSnapshot["igisakuzo"];
    answer = documentSnapshot["igisakuzo_answer"];
  }
}