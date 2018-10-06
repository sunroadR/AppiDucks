import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:appi_ducks/question_category1.dart';

// Class that keeps the question in a lesson in a list

class QustionList{

  // refeference to the head node
  QuestionCategory1 headQuestion; // first question in list
  int listCounter;
  QuestionCategory1 tailQuestion;

   QustionList(){
     headQuestion=null;
     listCounter=0;
     tailQuestion=headQuestion;
   }

   // get the length of the list
      int getLength(){
         return listCounter;
  }

  // henter antall elementer i i listen
  int getListCounter(){
     return this.listCounter;
  }

  // add question to list
void addQuestion(QuestionCategory1 que){
     if(headQuestion==null){
       headQuestion=que;
       tailQuestion=headQuestion;
       }
     else{
       QuestionCategory1 temp;
       temp = tailQuestion.getNextQuestion();
       temp=que;
       tailQuestion=temp;
                   
     }
       addOneToListCounter();
}

void addOneToListCounter(){
     listCounter= listCounter+1;
   print(listCounter);
}




//get a question from the list
QuestionCategory1 getQuestion(){

     return headQuestion;
}

}