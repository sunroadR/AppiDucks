import 'package:flutter/material.dart';
import 'package:appi_ducks/question_type_a.dart';
import 'package:appi_ducks/question_type_b.dart';

import 'package:appi_ducks/main.dart';
import 'package:appi_ducks/database/question.dart';

/*
Class that evaluates the answer given
 */
class QuestionEvaluator {

  // method that check if the given answer is corectt
  // and return a boolean value
 bool checkAnswer(Question question, String answer) {
    // check if it first time this question are answer this lesson
    if(question.firstTime==true)
      question.setFirstTime();// set firstTimeThisLesson false

    // Checks the if the give answer is correct
    if(answer == question.correctAns)
      return true;

    return false;
  }




}