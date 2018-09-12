import 'package:flutter/material.dart';
import 'package:appi_ducks/question_type_a.dart';
import 'package:appi_ducks/question_type_b.dart';
import 'package:appi_ducks/question_category1.dart';
import 'package:appi_ducks/main.dart';

class QuestionEvaluator {

  // method that check if the given answer is corectt
  // and return a boolean value
 bool checkAnswer(QuestionCategory1 question, String answer) {
    // check if it first time this question are answer this lesson
    if(question.getFirstTimeThisLesson()==true)
      question.upDatedFirstTimeThisLesson();// set firstTimeThisLesson false

    // Checks the if the give answer is correct
    if(answer == question.getcorrectAns())
      return true;

    return false;
  }



}