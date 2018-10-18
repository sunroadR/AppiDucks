import 'package:flutter/material.dart';
import 'package:appi_ducks/question_evaluator.dart';
import 'package:appi_ducks/question_feedback.dart';
import 'package:appi_ducks/page/page_lesson.dart';
import 'package:appi_ducks/lesson.dart';

import 'package:appi_ducks/database/model/question.dart';

// WidgetClass that shows the layout for the screen for the question of type A
//  , but troughthe implemetation it will read the qeustion
// and answer from a table.
//
class QuestionTypeA extends StatefulWidget {
  Question question;

  QuestionTypeA(Question q) {
    this.question = q;
  }

  @override
  State<StatefulWidget> createState() {
    return _QuestionTypeA();
  }
}

// Keeps the state for the statefullwidget
class _QuestionTypeA extends State<QuestionTypeA> {
  PageLesson pageLesson = new PageLesson();

  final QuestionEvaluator questionEvaluator = new QuestionEvaluator();

  QuestionFeedback questionFeedback = new QuestionFeedback();

  @override
  //  String that will take the answer the person give
  String _givenAnswer = '';
  bool _isRight = false;


  // the keeps the correctAnswer for question
  String corectAnswer;

  @override
  Widget build(BuildContext context) {
    return  Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        // center the text on the screen

        children: <Widget>[
          // Text with the question
          new Text(widget.question.question,

              //question.getQuestion(),
              key: Key('questionA'),
              style: TextStyle(
                  fontSize: 24.0, color: Theme.of(context).accentColor),
              textAlign: TextAlign.center),

          // The lay out for the four button

          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              new MaterialButton(
                key: Key('answerA1'),
                color: Theme.of(context).buttonColor,
                child: Text(widget.question.answer1,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0)),
                onPressed: () {
                  print(widget.question);
                  if (widget.question.firstTime == true) {
                  print(widget.question.firstTime);
                    answerGiven(widget.question.answer1);
                    widget.question.setFirstTime();
                  }
                },
              ),
            ],
          ),

          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new MaterialButton(
                key: Key('answerA2'),
                color: Theme.of(context).buttonColor,
                child: Text(
                  widget.question.answer2,
                  style: TextStyle(fontSize: 18.0),
                ),
                onPressed: () {
                  if (widget.question.firstTime == true) {
                    answerGiven(widget.question.answer2);
                    widget.question.setFirstTime();
                  }
                },
              ),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new MaterialButton(
                key: Key('answerA3'),
                color: Theme.of(context).buttonColor,
                child: Text(
                  widget.question.answer3,
                  style: TextStyle(fontSize: 16.0),
                ),
                onPressed: () {
                  if (widget.question.firstTime==true) {
                    widget.question.setFirstTime();
                    answerGiven(widget.question.answer3);
                    widget.question.setFirstTime();
                  }
                },
              ),
            ],
          ),

          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                  key: Key('answerA4'),
                  color: Theme.of(context).buttonColor,
                  child: Text(
                    widget.question.answer4,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  onPressed: () {
                    if (widget.question.firstTime == true) {
                      answerGiven(widget.question.answer4);
                       widget.question.setFirstTime();
                    }
                  }),
            ],
          ),
        ],

    );
  }

  void answerGiven(String s) {
    setState(() {
      _givenAnswer = s;
      _isRight = questionEvaluator.checkAnswer(widget.question, _givenAnswer);
      widget.question.setFirstTime();
    });
    // calls the showMessage with
    questionFeedback.showMessage(context, _isRight, widget.question);
  }
}
