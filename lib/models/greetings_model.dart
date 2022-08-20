import 'package:cloud_firestore/cloud_firestore.dart';

class GreetingsModel {
  String? docId;
  String? textKinyarwanda;
  String? textEnglish;
  String? audio;

  GreetingsModel({
    this.docId,
    this.textKinyarwanda,
    this.textEnglish,
    this.audio,
  });

  GreetingsModel.fromDocumentSnapshot({DocumentSnapshot? documentSnapshot}) {
    docId = documentSnapshot!.id;
    textKinyarwanda = documentSnapshot["textKinyarwanda"];
    textEnglish = documentSnapshot["textEnglish"];
    audio = documentSnapshot["audio"];
  }
}
