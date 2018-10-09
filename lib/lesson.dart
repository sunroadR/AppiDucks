import 'package:flutter/material.dart';
import 'package:appi_ducks/question_category1.dart';
import 'package:appi_ducks/question_type_a.dart';
import 'package:appi_ducks/question_type_b.dart';
import 'package:appi_ducks/question_type_c.dart';


class Lesson {

 QuestionCategory1 q =new QuestionCategory1(1,"QA","a1","a2","a3","a4","a5","a6","Ans", true,QuestionTypeA());
 QuestionCategory1 qeu =new QuestionCategory1(1,"QB","b1","b2","b3","b4","b5","b6","BAns", true,QuestionTypeB());
 QuestionCategory1 qeustion =new QuestionCategory1(1,"QC","c1","c2","c3","c4","c5","c6","CAns", true,QuestionTypeC());


 List<QuestionCategory1> _questionList;

 //QustionList newList;

  Lesson(){
       // this.q=  new QuestionCategory1(1,"Q","a1","a2","a3","a4","a5","a6","Ans", true,QuestionTypeA());
        this._questionList= new List();




   leggerTil();

  }


  // oppretter liste
 void leggerTil(){
    addQuestionTooList(q);
    addQuestionTooList(qeu);
    addQuestionTooList(qeustion);
 }

  // puts question to the list
void addQuestionTooList(QuestionCategory1 n){
    _questionList.add(n);

}


// gets the first question in the lesson
QuestionCategory1  first ()
          {

            return _questionList.elementAt(0) ;

          }

// removes the first question from the list
QuestionCategory1 removeFirstQuestion(){

       if(!isEmpty())
          _questionList.removeAt(0);
}

// return true if list is empty
bool isEmpty(){
    return _questionList.isEmpty;
}

QuestionCategory1 startLesson(){
    while (!isEmpty()){

      return removeFirstQuestion();
    }
}

  
}

