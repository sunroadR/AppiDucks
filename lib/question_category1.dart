import 'package:flutter/material.dart';
import 'package:appi_ducks/main.dart';
import 'package:appi_ducks/question_evaluator.dart';
import 'package:appi_ducks/question_type_A.dart';
import 'package:appi_ducks/question_type_B.dart';

// Object of this class, is a Question of category 1

class QuestionCategory1 {

  int id;
  String question = 'Hva blir (-2)** 4 ?'; //
  String answer1 = '16' ;

  String answer2 = '-16' ;
  String answer3 = '8 ' ;
  String answer4 = '-8' ;
  String answer5='-12';
  String answer6='12';

 StatefulWidget  pageWidget = new QuestionTypeB();



 String corectAns= '16';

 bool firstTimeThisLesson=true; // first time the user answer the the qeuestion

  QuestionCategory1 nextQuestion=null;

 // Constructor
 /**QuestionCategory1(int id, String qeu, String ans1,String ans2,String ans3,
     String ans4, String ans5, String ans6, String corrAns , bool firstTime,
     StatefulWidget pageType ){

           this.question=qeu;
           this.answer1=ans1;
           this.answer2=ans2;
           this.answer3=ans3;
           this.answer4=ans4;
           this.answer5=ans5;
           this.answer6=ans6;

           this.corectAns=corrAns;

           firstTimeThisLesson=firstTime;
           this.pageWidget=pageType;



 }
*/

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

  Widget getPageView(){
   return pageWidget;
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

void setNextQuestion(QuestionCategory1 q){

   this.nextQuestion=q;

}
QuestionCategory1 getNextQuestion(){
   return this.nextQuestion;
}

}