import 'package:flutter/material.dart';
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
    // check if it first time this question are answer this lesson
    if (question.firstTime == true)
      question.setFirstTime(); // set firstTimeThisLesson false

    // Checks the if the give answer is correct
    if (answer == question.correctAns) {
      infoLesson.addCorrectAnsInRow(context);

      return true;
    }
    else {
      infoLesson.setAnsInRowZero();
      return false;
    }
  }

}