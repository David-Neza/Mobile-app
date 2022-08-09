import 'package:cloud_firestore/cloud_firestore.dart';

class IbisakuzoModel {
  String? id;
  String? question;
  String? answer1;
  String? answer2;
  String? answer3;
  String? correct_answer;

  IbisakuzoModel(
      {this.id,
      this.question,
      this.answer1,
      this.answer2,
      this.answer3,
      this.correct_answer,
      });

 IbisakuzoModel.fromDocumentSnapshot({DocumentSnapshot? documentSnapshot}) {
    id = documentSnapshot!.id;
    question = documentSnapshot["question"];
    answer1 = documentSnapshot["answer_1"];
    answer2 = documentSnapshot["answer_2"];
    answer3 = documentSnapshot["answer_3"];
    correct_answer = documentSnapshot["correct_answer"];
    
  }
}