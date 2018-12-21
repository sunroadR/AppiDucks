import 'package:flutter/material.dart';
import 'package:appi_ducks/page/ui/lesson_feedback.dart';
import 'package:appi_ducks/page/ui/question_feedback.dart';
import 'package:appi_ducks/page/page_lesson.dart';

 //The class holds info about status in a lesson
class InfoLesson {

  LessonFeedBack lessonFeedBack = new LessonFeedBack();
  QuestionFeedback questionFeedback =new QuestionFeedback();
  PageLesson _pageLesson = new PageLesson();



  // antall riktige på rad er null når en lesson starter

  int correctAnsInRow =0;


  // Metode som henter antall på rad
  int getCorrectAnsInRow(){
     return this.correctAnsInRow;

  }

  // Metode som blir kaldt når buker svare riktig, Da oppdater
  // Da oppdateres correctAnsInRow og hvis bruker har
  void addCorrectAnsInRow(BuildContext context){


    correctAnsInRow = correctAnsInRow +1;

    if(getCorrectAnsInRow()==3){
      lessonFeedBack.showMessageThreeInRow(context);
    }
    else if(getCorrectAnsInRow()==5){
      lessonFeedBack.showMessageFiveInRow(context);
    }

    else if(getCorrectAnsInRow()==10){
    lessonFeedBack.showMessageTenInRow(context);
    }
    else if(getCorrectAnsInRow()==12){
    lessonFeedBack.showMessageTwelveInRow(context);
    }
    else {
    questionFeedback.showMessageRightAnswer(context);
    }


  }

  // metoder som setter antall riktige på rad til lik null , når bruker svarer feil
  void setAnsInRowZero(){
    this.correctAnsInRow = 0;

  }
}