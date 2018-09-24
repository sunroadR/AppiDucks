import 'package:flutter/material.dart';
import 'package:appi_ducks/main.dart';
import 'package:appi_ducks/question_evaluator.dart';

// Object of this class, is a Question of category 1

class QuestionCategory1 {


//
 final String question = 'Hva blir (-2)** 4 ?';

 final String answer1 = '16' ;

 final String answer2 = '-16' ;
 final String answer3 = '8 ' ;
 final String answer4 = '-8' ;
 final String answer5='-12';
 final String answer6='12';



 final String corectAns= '16';

 bool firstTimeThisLesson;

 QuestionCategory1(){

   firstTimeThisLesson=true;
 }


 // Method thats returns the variable
  String getQuestion (){
    return question;
  }

 String getAnswer1(){
      return answer1;

 }

  String getAnswer2(){
    return answer2;

  }

  String getAnswer3(){
    return answer3;

  }

  String getAnswer4(){
    return answer4;

  }

 String getAnswer5(){
   return answer5;

 }

 String getAnswer6(){
   return answer6;

 }

  String getcorrectAns(){

    return corectAns;

  }


  // Method that returns true if it first time the question is answer
 bool getFirstTimeThisLesson(){
    return firstTimeThisLesson;
 }

 // Method that updated getFirstTimeLesson an set it to false
// when user answer the question
void upDatedFirstTimeThisLesson(){
   firstTimeThisLesson=false;
}



}