import 'package:flutter/material.dart';
import 'package:appi_ducks/main.dart';
import 'package:appi_ducks/question_evaluator.dart';
import 'package:appi_ducks/question_type_A.dart';
import 'package:appi_ducks/question_type_B.dart';

// Object of this class, is a Question of category 1

class Question {

    String id;
    String oneQuestion;
    String answer1;    // = '16' ;

    String answer2;    // = '-16' ;
    String answer3;    // = '8 ' ;
    String answer4;    //  = '-8' ;
    String answer5;    //='-12';
     String answer6;    //='12';

    String  pageWidget; // = new QuestionTypeB();



 String corectAns;   // = '16';

 bool firstTimeThisLesson =true; // first time the user answer the the qeuestion

 // Constructor
 Question(String this.id, String this.oneQuestion, String this.answer1,
     String this.answer2 ,String this.answer3, String this.answer4,
     String this.answer5, String this.answer6, String this.corectAns ,
     String this.pageWidget );




 // Method thats returns the variable

String getQuestion()
{
  return oneQuestion;
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

  String getPageView(){
   return pageWidget;
  }

    String getId(){
      return id;
    }
  // Method that returns true if it first time the question is answer
 bool getFirstTimeThisLesson(){
    return firstTimeThisLesson;
 }

 // Method that updated getFirstTimeLesson an set it to false
// when user answer the question and the answer is put at the end of the list
void upDatedFirstTimeThisLesson(){
   firstTimeThisLesson=false;
}

/**
void setNextQuestion(QuestionCategory1 q){

   this.nextQuestion=q;

}
QuestionCategory1 getNextQuestion(){
   return this.nextQuestion;
}*/

}