

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:appi_ducks/question_evaluator.dart';

import 'package:appi_ducks/question_category1.dart';
import 'package:appi_ducks/page_question2.dart';
import 'package:appi_ducks/main.dart';

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

  @override


  //  String that will take the answer the person give
   String _givenAnswer ='';
   bool _isRight=false;

  bool firstTime=true;
   // the keeps the correctAnswer for question
   String corectAnswer;

  @override
  Widget build(BuildContext context) {

    final QuestionCategory1 question = new QuestionCategory1();
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
      showMessage(_isRight, question);
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

      showMessage(_isRight, question);
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

      showMessage(_isRight, question);
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

      showMessage(_isRight, question);

    }
    else
      Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>PageQuestion2()));

          },


    ),],
    ),

      ],
    );


  }



  // Method that gives the user feedback
  // with an alertWindow

void showMessage(bool _isRight, QuestionCategory1 question){

    // variable that holdes the feedback
    String _feedBackMessage; // if right or wrong message
    // variabl to hold the coorect answer
    String  _correctAnsToShow =question.getcorrectAns()[0].toUpperCase()+question.getcorrectAns().substring(1).toLowerCase();

    // checks if the answer is right
    if(_isRight) {
      //feedback string for correct answer
      _feedBackMessage = ' Det er Riktig ! ';
      _correctAnsToShow = ' '; // this is put to an emty string, since it is not supose to show for an correct given answer
    }
     else {
        //feedback string for  wrong Answer
                _feedBackMessage= 'Feil, riktig er :  ';





     }

          // creates a AlertDialog window
           AlertDialog message = new AlertDialog(

         // the content that will shows

                  content: new RichText(
                     text: new TextSpan(
                        children: <TextSpan>[

                          // feedback message
                          new TextSpan(
                              text: _feedBackMessage,
                              style: new TextStyle(color: Colors.indigo[900],
                              fontSize: 20.0),
                          ),
                           //  The right answer
                           new TextSpan(
                              text: _correctAnsToShow,
                              style: new TextStyle(color: Theme.of(context).primaryColor,
                              fontSize: 28.0 ) ,
                           ),

  ]

  ) ,


  ),

             actions: <Widget>[
           FlatButton(
           child: Text('neste',
               style: new TextStyle(color: Theme.of(context).primaryColor,
               fontSize: 14.0
           ),),
               onPressed: () {

  Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>PageQuestion2()));

  })
                       ],
           );

                    // shows the window
    showDialog(context: context, child:  message);

}


  }





