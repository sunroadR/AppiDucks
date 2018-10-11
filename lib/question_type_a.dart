
import 'package:flutter/material.dart';
import 'package:appi_ducks/question_evaluator.dart';
import 'package:appi_ducks/question_feedback.dart';
import 'package:appi_ducks/page_lesson.dart';
import 'package:appi_ducks/lesson.dart';
import 'package:appi_ducks/question_category1.dart';

// WidgetClass that shows the layout for the screen for the question of type A
// So fare it is not static , but troughthe implemetation it will read the qeustion
// and answer from a table.
//
class QuestionTypeA extends StatefulWidget {

        QuestionCategory1 question;

            QuestionTypeA(QuestionCategory1 q){
                      this.question=q;
             }

  @override
  State<StatefulWidget> createState() {

    return _QuestionTypeA();

  }

}


// Keeps the state for the widget
class _QuestionTypeA extends State<QuestionTypeA>{



  PageLesson pageLesson = new PageLesson();

  final QuestionEvaluator questionEvaluator=new QuestionEvaluator();

  

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

        return Column(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      // center the text on the screen


                    children: <Widget>[

                      // Text with the question
                    new Text(
                          widget.question.getQuestion(),

                    //question.getQuestion(),
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


    child: Text(widget.question.getAnswer1(), textAlign: TextAlign.center,
    style: TextStyle(fontSize: 18.0)),
    onPressed: () {
     if(firstTime==true) {
       firstTime=false;
       answerGiven(widget.question.getAnswer1());
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
    child: Text( widget.question.getAnswer2(),
    style: TextStyle(fontSize: 18.0), ),
    onPressed: () {
          if(firstTime==true) {
              firstTime=false;
               answerGiven(widget.question.getAnswer2());
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
    Text(widget.question.getAnswer3(),
    style: TextStyle(fontSize: 16.0), ),
    onPressed: () {
      if (firstTime == true) {
        firstTime = false;
        answerGiven(widget.question.getAnswer3());
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

          child: Text(widget.question.getAnswer4(),
          style: TextStyle(fontSize: 18.0),),
          onPressed: () {
    if(firstTime==true) {
    firstTime=false;
    answerGiven(widget.question.getAnswer4());
    }

    }
    ),],
    ),

      ],
    );


  }

  void answerGiven(String s){
          setState(() {
             _givenAnswer = s;
             _isRight = questionEvaluator.checkAnswer(widget.question, _givenAnswer);
              firstTime=false;

           });
                // calls the showMessage with
          questionFeedback.showMessage(context,_isRight, widget.question);
      }




  }





