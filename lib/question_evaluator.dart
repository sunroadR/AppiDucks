import 'package:flutter/material.dart';
import 'package:quiver/strings.dart';

import 'package:appi_ducks/page/ui/question_type_a.dart';
import 'package:appi_ducks/page/ui/question_type_b.dart';

import 'package:appi_ducks/main.dart';
import 'package:appi_ducks/database/model/question.dart';
import 'package:appi_ducks/info_lesson.dart';
/*
Class that evaluates the answer given
 */
class QuestionEvaluator {


  // method that check if the given answer is corectt
  // and return a boolean value
  bool checkAnswer(BuildContext context, Question question, String answer,
      InfoLesson infoLesson) {

    // Fjerner whitespace i Strengene for riktig svar og avgitt svar
   //var _correct = question.correctAns.replaceAll(new RegExp(r"\s+\b|\b\s"), "");
    //print(_correct, );
    //print('over er riktig ');
     // var  _givenAns=answer.replaceAll(new RegExp(r"\s+\b|\b\s"), "");
    //print(_givenAns);
    // check if it first time this question are answer this lesson
    if (question.firstTime == true)
      question.setFirstTime(); // set firstTimeThisLesson false

    // Checks the if the give answer is correct
  //  if (_givenAns.toString() == _correct.toString()) {
    if(answer==question.correctAns){
      infoLesson.addCorrectAnsInRow(context);
      return true;
    }
    else {
      infoLesson.setAnsInRowZero();
      return false;
    }
  }

}