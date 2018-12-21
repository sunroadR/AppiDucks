import 'package:flutter/material.dart';
import 'dart:math';
import 'package:appi_ducks/database/model/question.dart';
// The class create a lesson with 12 question

class StartLesson {


  int _antallGanger=0;
  List<int> questionsLesson =new List();



   var t = new Random();
  int a;



  List<int> createLesson() {

      a = t.nextInt(3);

      print('før verdien av a ');
      print(a);
      questionsLesson.add(a);


    for (int i = 1; i<3; i++) {
      a = t.nextInt(3);
   //   while (inList(a)) {
        a = t.nextInt(3);
     // }
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