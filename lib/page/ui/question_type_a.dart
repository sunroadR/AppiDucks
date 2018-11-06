import 'package:flutter/material.dart';
import 'package:appi_ducks/question_evaluator.dart';
import 'package:appi_ducks/page/ui/question_feedback.dart';
import 'package:appi_ducks/page/page_lesson.dart';
import 'package:appi_ducks/lesson.dart';
import 'package:appi_ducks/info_lesson.dart';
import 'package:appi_ducks/database/model/question.dart';

// WidgetClass that shows the layout for the screen for the question of type A
//  , but troughthe implemetation it will read the qeustion
// and answer from a table.
//
class QuestionTypeA extends StatefulWidget {
  Question question;
  InfoLesson infoLesson;

  QuestionTypeA(Question ques,InfoLesson info){
    this.question=ques;
    this.infoLesson=info;

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
  bool _isFirstTime=true;

  // the keeps the correctAnswer for question
  String corectAnswer;

  @override
  Widget build(BuildContext context) {
    return  Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        // center the text on the screen

        children: <Widget>[
          // Text with the question
          new Text(

            widget.question.question,

              //question.getQuestion(),
              key: Key('questionA'),
              style: TextStyle(
                  fontSize: 24.0, color: Theme.of(context).accentColor),
              textAlign: TextAlign.center,
            softWrap: true,),

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
                  if (_isFirstTime== true) {
                    print('Tester ');
                    print(widget.question.answer1);
                    answerGiven(context, widget.question.answer1);

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
                  if (_isFirstTime == true) {
                    answerGiven(context,widget.question.answer2);

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
                  if (_isFirstTime==true) {

                    answerGiven(context, widget.question.answer3);


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
                    if (_isFirstTime == true) {
                      answerGiven(context,widget.question.answer4);

                    }
                  }),
            ],
          ),
        ],

    );
  }

  void answerGiven(BuildContext context, String s) {


    setState(() {
      _givenAnswer = s;
      _isRight = questionEvaluator.checkAnswer(context, widget.question, _givenAnswer, widget.infoLesson);
      widget.question.setFirstTime();
      _isFirstTime=false;
    });
    // calls the showMessage with
    if(_isRight==false) {
      questionFeedback.showMessageWrongAnswer(context, widget.question);
      widget.question.setFirstTime();
      _isFirstTime=false;
    }
  }
}
