import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:appi_ducks/question_category1.dart';
import 'package:appi_ducks/question_type_a.dart';
import 'package:appi_ducks/question_type_b.dart';
import 'package:appi_ducks/question_type_c.dart';
import 'package:appi_ducks/question_list.dart';
import 'dart:developer';

class Lesson {

 QuestionCategory1 q ;

 QustionList newList;

  Lesson(){
        this.q=  new QuestionCategory1();
        this.newList= new QustionList();



        addQuestionTooList(q);
        addQuestionTooList(q);

  }

void addQuestionTooList(QuestionCategory1 q){
    newList.addQuestion(q);

}

void setQuestion (temp){
   this.q=temp;
}

 QuestionCategory1 getFirstQuestionFromList() {
   if (newList.getListCounter()!= 0) {
     QuestionCategory1 temp=newList.getQuestion();
     setQuestion(temp);

     return temp;
   }
   return null;

 }

 QuestionCategory1 getQuestion(){
    return this.q;
 }
  
}

