import 'package:flutter/material.dart';
import 'dart:math';
import 'package:appi_ducks/matte_uke1.dart';
import 'package:appi_ducks/database/model/question.dart';
// The class create a lesson with 12 question

class StartLesson {

  List<int> questionsLesson =new List();

   var t = new Random();
  int a;

  MatteUke1 matteUke1 =new MatteUke1();

  List<Question> createLesson() {


      a = t.nextInt(32);
      questionsLesson.add(a);

    for (int i = 1; i<12; i++) {
      a = t.nextInt(32);
      while (inList(a)) {
        a = t.nextInt(32);
      }
      questionsLesson.add(a);
    }

    return questionsLesson;
  }


  bool inList(int a){

    for(int i = 0; i<questionsLesson.length; i++){
      if(questionsLesson.isNotEmpty) {
        if (a == questionsLesson.elementAt(i))
          return true;
      }}
    return false;
  }
}