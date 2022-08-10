import 'package:cloud_firestore/cloud_firestore.dart';

class ArtifactsModel {
  String? id;
  String? question;
  String? answer1;
  String? answer2;
  String? answer3;
  String? answer4;
  String? correctAnswer;

  ArtifactsModel(
      {this.id,
      this.question,
      this.answer1,
      this.answer2,
      this.answer3,
      this.answer4,
      this.correctAnswer,
      });

 ArtifactsModel.fromDocumentSnapshot({DocumentSnapshot? documentSnapshot}) {
    id = documentSnapshot!.id;
    question = documentSnapshot["question"];
    answer1 = documentSnapshot["answer1"];
    answer2 = documentSnapshot["answer2"];
    answer3 = documentSnapshot["answer3"];
    answer4 = documentSnapshot["answer4"];
    correctAnswer = documentSnapshot["correct_answer"];
  }
}