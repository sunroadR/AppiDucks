

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:appi_ducks/question_evaluator.dart';

import 'package:appi_ducks/question_category1.dart';
import 'package:appi_ducks/main.dart';
import 'package:appi_ducks/question_feedback.dart';
import 'package:appi_ducks/page_lesson.dart';
import 'package:appi_ducks/lesson.dart';

// WidgetClass that shows the layout for the screen for the question of type A
// So fare it is not static , but troughthe implemetation it will read the qeustion
// and answer from a table.
//
class QuestionTypeA extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {

    return _QuestionTypeA();

  }

}


// Keeps the state for the widget
class _QuestionTypeA extends State<QuestionTypeA>{



  static Lesson aLesson= new Lesson();
  PageLesson pageLesson = new PageLesson();
  
QuestionCategory1 question = aLesson.first();

  

QuestionFeedback questionFeedback= new QuestionFeedback();







  @override


  //  String that will take the answer the person give
   String _givenAnswer ='';
   bool _isRight=false;

  bool firstTime=true;
   // the keeps the correctAnswer for question
   String corectAnswer;

  @override
  Widget build(BuildContext context) {
    


    final QuestionEvaluator questionEvaluator=new QuestionEvaluator();

    return Column(

      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      // center the text on the screen


      children: <Widget>[


// Text with the question
        new Text(
            question.getQuestion(),
            key: Key('questionA'),
            style: TextStyle(fontSize: 24.0,
                  color: Theme.of(context).accentColor),
            textAlign: TextAlign.center),


        // The lay out for the four button

    new Row (
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[

    new MaterialButton(
    key: Key('answerA1'),
    color: Theme.of(context).buttonColor,


    child: Text(question.getAnswer1(), textAlign: TextAlign.center,
    style: TextStyle(fontSize: 18.0)),
    onPressed: () {
     if(firstTime==true) {
      setState(() {
        _givenAnswer = question.getAnswer1();
        _isRight = questionEvaluator.checkAnswer(question, _givenAnswer);
        firstTime=false;

      });

      // calls the showMessage with
      questionFeedback.showMessage(context,_isRight, question);
    }

    },


    ),
    ], ),

    new Row (
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[

    new MaterialButton(
    key: Key('answerA2'),

    color: Theme
        .of(context)
        .buttonColor,
    child: Text(question.getAnswer2(),
    style: TextStyle(fontSize: 18.0), ),
    onPressed: () {
    if(firstTime==true) {
      setState(() {
        _givenAnswer = question.getAnswer2();
        _isRight = questionEvaluator.checkAnswer(question, _givenAnswer);
       firstTime=false;

      });

     questionFeedback.showMessage(context,_isRight, question);
    }
    },


    ),
    ], ),
    new Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[

    new MaterialButton (
    key: Key('answerA3'),
    color: Theme.of(context).buttonColor,

    child:
    Text(question.getAnswer3(),
    style: TextStyle(fontSize: 16.0), ),
    onPressed: () {
    if(firstTime=true) {
      setState(() {
        _givenAnswer = question.getAnswer3();
        _isRight = questionEvaluator.checkAnswer(question, _givenAnswer);
      firstTime=false;

      });

      questionFeedback.showMessage(context,_isRight, question);
    }

    },

    ),
    ], ),


    new Row(
    mainAxisAlignment: MainAxisAlignment.center,

    children: <Widget>[
        MaterialButton(
          key: Key('answerA4'),
          color: Theme.of(context).buttonColor,

          child: Text(question.getAnswer4(),
          style: TextStyle(fontSize: 18.0),),
          onPressed: () {
    if(firstTime==true) {
      setState(() {
        _givenAnswer = question.getAnswer4();
        _isRight = questionEvaluator.checkAnswer(question, _givenAnswer);
        question.upDatedFirstTimeThisLesson();
        firstTime =false;

      });

      questionFeedback.showMessage(context,_isRight, question);

    }
    else
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new PageLesson()));


          },


    ),],
    ),

      ],
    );


  }








  }





