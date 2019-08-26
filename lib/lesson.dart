import 'package:flutter/material.dart';
import 'dart:math';

import 'package:appi_ducks/question.dart';
import 'package:appi_ducks/page/ui/lesson_feedback.dart';
import 'package:appi_ducks/page/ui/question_feedback.dart';
import 'package:appi_ducks/user.dart';

import 'dart:async';




/// The class holds the information about the lesson through the session


class Lesson {


  Question question;


  LessonFeedBack lessonFeedBack = new LessonFeedBack();
  QuestionFeedback questionFeedback = new QuestionFeedback();

  List<Question> listOfAllQuestions = [];

  List<int> questionChoosen = [];

  var t = new Random();
  int antallGenerelleSpr =44;

  int _questionNr=0;

  int correctAnsInRow = 0;
  int _totalCorrect = 0;

  int _weekNr;


  // antall riktige på rad er null når en lesson starter

  List<Question> listQuestionsLesson = [];

  List<int>  listMedNummer = [];

  Question testQuestion4;

  Question testQuestion =new Question('2.4.1', '', 'sum', 'return', 'function','def','', '', 'def','questionTypeC','true');

 Question testQuestion1 =new Question('2.4.1', '', 'sum', 'return', 'function','def','', '', 'return','','true');

  int get questionNr => _questionNr;

  void upDateQuestionNr(){
    _questionNr =_questionNr+1;
  }




  List<Question> createLessonUke1() {

    Question question;

    _weekNr=1;


    for (int i = 0; i < 12; i++) {
      int a=0;
      if((i==0)||i==4 || i ==10 ) {
        a = randomNumber(antallGenerelleSpr);
        while (inList(a)) {
          a = randomNumber(antallGenerelleSpr);
        }
      }
      if(i==1|| i==6 || i==8 ){
         question = new Question('1.2.$i', 'matteSpr','', '', '','','', '', '','questionTypeB', 'true');
         question.createMathQuestion();
         print(question.pageWidget);
      }
      if(i==2){
        question = new Question('1.3.$i','FloatInt' , 'Int','Float','Variable','Number','', '', '','questionTypeA', 'true');
        question.createType_Int_or_Float_Question();

        print(question.question);
      }
      if(i==3){
        question = new Question('1.4.$i', '(xOpy)Opz', '', '', '','','', '', '','questionTypeC', 'true');
        question.createOperatorPresedens();
      }
      if(i==7){
       question = new Question('1.4.$i', 'xOp(yOpz)', '', '', '','','', '', '','questionTypeC', 'true');
       // question = new Question('1.4.$i', '(xOpy)Opz', '', '', '','','', '', '','questionTypeC', 'true');

        question.createOperatorPresedens();
      }
      if(i==5){
        question = new Question('1.6.$i', 'variablerAsignment', '', '', '','','', '', '','questionTypeA', 'ture');
        question.createQuestion_of_Assignment();

      }
      if(i==9){
       // question = new Question('1.4.$i', '(xOpy)Opz', '', '', '','','', '', '','questionTypeC', 'true');

         question = new Question('1.4.$i', 'xOpyOpz', '', '', '','','', '', '','questionTypeC', 'true');
        question.createOperatorPresedens();

      }
      if(i==11){
        question = new Question('1.7.$i', 'AUGMENTED ASSIGNMENT', '', '', '','','', '', '','questionTypeA', 'true');
        question.createQuestion_of_AugmententedAssignmentInt();

      }


      if((i==0)||i==4  || i ==10) {

        print('I Uke 1 ');
        listMedNummer.add(a);
        listQuestionsLesson.add(listOfAllQuestions[a]);
      }
      else{
        listQuestionsLesson.add(question);
      }
    }


    return listQuestionsLesson;
   }



  List<Question> createLessonUke2() {


     antallGenerelleSpr=13;
    print(antallGenerelleSpr);
    _weekNr =2;

    List<String> tidligereGitteQuelOgriktigeSvar =[];

    for (int i = 0; i < 12; i++) {
      int a =0;
      Question questionA = new Question(
          '3.4.1',
          ' ',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          'questionTypeA',
          'true');
      if (i == 0 || i==9) {

        questionA.question_about_String_length();

        listQuestionsLesson.add(questionA);
       tidligereGitteQuelOgriktigeSvar.add(questionA.correctAns);
      }
      if (i == 1) {

        questionA.konkaterneringsQuestion_med_2_Strenger();
        listQuestionsLesson.add(questionA);
    tidligereGitteQuelOgriktigeSvar.add(questionA.correctAns);

      }
     // if(i==2){
     //   questionA.generelleSprUke4();

     //   listQuestionsLesson.add(questionA);
     //  tidligereGitteQuelOgriktigeSvar.add(questionA.correctAns);
     //  }
       if(i==3){
        questionA.printQestionStrenger();
        listQuestionsLesson.add(questionA);
        tidligereGitteQuelOgriktigeSvar.add(questionA.correctAns);
       }
       if(i==4 || i==10){
        questionA.konkaternering_med_2_heletall();
        while(isQuestionGivenBefor(questionA.correctAns ,tidligereGitteQuelOgriktigeSvar)){
          questionA.konkaternering_med_2_heletall();
        }
        listQuestionsLesson.add(questionA);
        tidligereGitteQuelOgriktigeSvar.add(questionA.correctAns);
       }
       if(i== 2 || i==5){

         for(int j=0; j<listOfAllQuestions.length;j++){
           print(listOfAllQuestions[j].question);
         }

         a = randomNumber(antallGenerelleSpr);
         print(a);
         print(listOfAllQuestions[a]);
         while (inList(a)) {
           a = randomNumber(antallGenerelleSpr);
         }
         listQuestionsLesson.add(listOfAllQuestions[a]);
         tidligereGitteQuelOgriktigeSvar.add(listOfAllQuestions[a].correctAns);

       }
       if(i==6){
         questionA.konkaterneringsQuestion_med_2_Strenger();
        while(isQuestionGivenBefor(questionA.correctAns ,tidligereGitteQuelOgriktigeSvar)){
          questionA.konkaterneringsQuestion_med_2_Strenger();
        }
        listQuestionsLesson.add(questionA);
        tidligereGitteQuelOgriktigeSvar.add(questionA.correctAns);

       }
       if(i==7){
        questionA.printQuestionTall();
         while(isQuestionGivenBefor(questionA.correctAns ,tidligereGitteQuelOgriktigeSvar)){
           questionA.printQuestionTall();
         }
         listQuestionsLesson.add(questionA);
         tidligereGitteQuelOgriktigeSvar.add(questionA.correctAns);
       }
       if(i==8  || i == 11){
        questionA.konkaterneringsQuestion_3_Strenger();
        listQuestionsLesson.add(questionA);
        tidligereGitteQuelOgriktigeSvar.add(questionA.correctAns);
       }

    }

    return listQuestionsLesson;
  }



  List<Question> createLessonUke3() {

    _weekNr=3;

    Question question;

    antallGenerelleSpr=29;


    for (int i = 0; i < 12; i++) {
      int a=0;
      if((i==0)||i==4 || i ==10 ) {
        a = randomNumber(antallGenerelleSpr);
        while (inList(a)) {
          a = randomNumber(antallGenerelleSpr);
        }
      }
      if(i==1|| i==6 || i==8 || i==11 ){
        question = new Question('2.2.$i', 'matteSpr','', '', '','','', '', '','questionTypeB', 'true');
        question.inneBygdeFunksjonerQuestion();
      }
      if(i==2){
        question = new Question('2.3.$i','FloatInt' , 'Int','Float','return','def','', '', 'def','questionTypeD', 'true');
        question.missingCodePart();


      }
      if(i==3){
        question = new Question('2.4.$i', 'xOpyOpz', 'scope', 'return', 'Int','def','', '', '','questionTypeC', 'true');
        question.feilmeldingQuestion();
      }
      if(i==9){
        question = new Question('2.4.$i', '(xOpy)Opz', 'return', 'scope', 'Int','def','', 'Int', 'def','questionTypeD', 'true');
        question.missingCodePart();
      }
      if(i==7){
        question = new Question('2.4.$i', 'xOp(yOpz)', '', '', '','','', '', '','questionTypeF', 'true');
        question.hva_returner_kode();

      }
      if(i==5){
        question = new Question('2.6.$i', 'variablerAsignment', '', '', '','','', '', '','questionTypeF', 'true');
        question.hva_returner_kode();

      }



      if((i==0)||i==4  || i ==10) {
        listMedNummer.add(a);
        print('I Uke3 ');
        listQuestionsLesson.add(listOfAllQuestions[a]);
      }
      else{
        listQuestionsLesson.add(question);
      }
    }


    return listQuestionsLesson;
  }








  int randomNumber(int n) {
    return t.nextInt(n);
  }


  bool inList(int nummer) {
    if (listMedNummer.isEmpty) {
      return false;
    }
    else {
      for (int i = 0; i < listMedNummer.length; i++) {
        if (nummer == listMedNummer[i]) {
          return true;
        }
      }
      return false;
    }
  }
  Future<Question> getQuestion(int t) {
    return null;
  }


  // Metode som henter antall på rad
  int getCorrectAnsInRow() {
    return this.correctAnsInRow;
  }

  // Metode som blir kaldt når buker svare riktig, Da oppdater
  // Da oppdateres correctAnsInRow og hvis bruker har
  void addCorrectAnsInRow(BuildContext context,User user ) {
    correctAnsInRow = correctAnsInRow + 1;
    user.addNumberOfCorrectAnswer();

    if (getCorrectAnsInRow() == 3) {
      lessonFeedBack.showMessageThreeInRow(context);
    }
    else if (getCorrectAnsInRow() == 5) {
      lessonFeedBack.showMessageFiveInRow(context);
    }

    else if (getCorrectAnsInRow() == 10) {
      lessonFeedBack.showMessageTenInRow(context);
    }
    else if (getCorrectAnsInRow() == 12) {
      lessonFeedBack.showMessageTwelveInRow(context);
    }
    else {
      questionFeedback.showMessageRightAnswer(context);
    }
  }


  // metoder som setter antall riktige på rad til lik null , når bruker svarer feil
  void setAnsInRowZero(BuildContext context, Question question) {
    this.correctAnsInRow = 0;
    //kaller metoden for å skrive ut beskjed om at svaret var feil
    questionFeedback.showMessageWrongAnswer(context, question);
  }


  void createQuestion(Question q) {
    Question que = new Question(
        q.uniqId,
        q.question,
        q.answer1,
        q.answer2,
        q.answer3,
        q.answer4,
        q.answer5,
        q.answer6,
        q.correctAns,
        q.pageWidget,
        q.firstTime);

    
      listOfAllQuestions.add(que);

  }


  void setWeekNr(int i) {
    this._weekNr = i;
  }

  int get weekNr => _weekNr;

  int get totalCorrect => _totalCorrect;

  bool isQuestionGivenBefor(String correctAns,List<String> liste_med_info_om_tidligerSpr) {

    for(int i=0; i<liste_med_info_om_tidligerSpr.length;i++ ){
      if(correctAns.trim()==liste_med_info_om_tidligerSpr[i].trim()){
        return true;
      }


    }
    return false;



  }
}