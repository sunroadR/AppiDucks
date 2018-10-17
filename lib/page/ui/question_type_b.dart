import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:appi_ducks/database/model/question.dart';
import 'package:appi_ducks/question_evaluator.dart';
import 'package:appi_ducks/page/summary_page.dart';
import 'package:appi_ducks/page/page_lesson.dart';
import 'package:appi_ducks/lesson.dart';
import 'package:appi_ducks/question_feedback.dart';
import 'dart:developer';

// WidgetClass that shows the layout for the screen for the question of type A
// but troughthe implemetation it will read the qeustion
// and answer from a table.
//
class QuestionTypeB extends StatefulWidget {
  Question question;

  QuestionTypeB(Question q) {
    this.question = q;
  }

  @override
  State<StatefulWidget> createState() {
    return _QuestionTypeB();
  }
}

// A corresponding State class. This class holds the data related to layout
// of question of type B
//
class _QuestionTypeB extends State<QuestionTypeB> {
  //static Lesson lesson = new Lesson();
  QuestionFeedback questionFeedback = new QuestionFeedback();
  QuestionEvaluator _questionEvaluator = new QuestionEvaluator();

  String sjekk = 'Sjekk';
  String _givenAnswer;
  bool _isRight;
  bool isFirst = true;

  // Create a text controller. That is used to retrieve  the current answer
  // of the textfield
  final _ansController = TextEditingController();

  @override
  @override
  void dispose() {
    _ansController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Text(widget.question.question,
              key: Key('QuestionTypeB'),
              style: TextStyle(
                  fontSize: 24.0, color: Theme.of(context).accentColor),
              textAlign: TextAlign.center),
          new Container(
            width: 300.0,
            height: 200.0,
            margin: EdgeInsets.all(45.0),
            decoration: new BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.indigo[50],
                border: new Border.all(
                    color: Theme.of(context).primaryColor, width: 1.0)),
            child: new Flexible(
                child: new TextField(
              textAlign: TextAlign.center,
              controller: _ansController,
              decoration: new InputDecoration(
                hintText: 'Tast inn svaret',
                hintStyle: TextStyle(color: Theme.of(context).accentColor),
                border: InputBorder.none,
              ),
            )),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // A button for checking the answer
              new MaterialButton(
                //style of the button
                color: Theme.of(context).buttonColor,

                child: Text(sjekk,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0)),

                onPressed: () {
                  // retrive the answer the user has typed  inn
                  setState(() {
                    _givenAnswer = _ansController.text.toString();

                    // sjekker at det er tastet inn et svar
                    if (_givenAnswer.length == 0) {
                      // Gir beskjed om at de må skrive inn et svar
                      questionFeedback.showMessageNoAnswer(context);
                    } else {
                      // Kaller metode i _questionElovator og evaluerer avgitt svar
                      _isRight = _questionEvaluator.checkAnswer(
                          widget.question, _givenAnswer);
                      // calls the showMessage with, Gir tilbake melding
                      questionFeedback.showMessage(
                          context, _isRight, widget.question);
                      // Endrer navn på button, til neste og den vil nå ta bruker til neste side
                      isFirst = false;
                    }
                  });
                },
              ),
            ],
          ),
        ]);
  }
}
