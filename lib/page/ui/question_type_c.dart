import 'package:flutter/material.dart';

import 'package:appi_ducks/question_evaluator.dart';
import 'package:appi_ducks/main.dart';
import 'package:appi_ducks/page/summary_page.dart';
import 'package:appi_ducks/page/ui/question_feedback.dart';
import 'package:appi_ducks/database/model/question.dart';
import 'package:appi_ducks/info_lesson.dart';

// WidgetClass that shows the layout for the screen for the question of type C
//  , but troughthe implemetation it will read the qeustion
// and answer from a table.
//
class QuestionTypeC extends StatefulWidget {
  Question question;
  InfoLesson infoLesson;
  bool _isFirstTime;
  String _givenAnswer='';

  QuestionTypeC(Question q, InfoLesson info) {
    this.question = q;
    this.infoLesson=info;
    _isFirstTime = true;
    _givenAnswer='';

  }

  @override
  State<StatefulWidget> createState() {
    return _QuestionTypeC();
  }
  bool getFirstime(){
    return _isFirstTime;
  }


  void setFirstime(){
    _isFirstTime=false;
  }
}

// A corresponding State class. This class holds the data related to layout
// of question of type C
//

class _QuestionTypeC extends State<QuestionTypeC> {
  final QuestionEvaluator _questionEvaluator = new QuestionEvaluator();
  QuestionFeedback questionFeedback = new QuestionFeedback();

  String _givenAnswer = '';
  String _sjekk = 'Sjekk';
  bool _isRight = false;


  @override
  Widget build(BuildContext context) {
    return ClipRect(
        child: new Column(children: <Widget>[
      new Container(
        width: 300.0,
        height: 200.0,
        margin: EdgeInsets.all(45.0),
        decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.indigo[50],
            border: new Border.all(
                color: Theme.of(context).primaryColor, width: 1.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              widget.question.question,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 16.0, color: Theme.of(context).accentColor),
            ),
            MaterialButton(
                minWidth: 14.0,
                color: Theme.of(context).buttonColor,
                child: Text(widget._givenAnswer),
                onPressed: () {
                  if(widget._isFirstTime==true) {
                    // retrive the answer the user has typed  inn

                    setState(() {

                    });
                  } }),
          ],
        ),
      ),
      new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          MaterialButton(
              minWidth: 50.0,
              color: Theme.of(context).buttonColor,
              child: Text(widget.question.answer1),
              onPressed: () {
    if(widget._isFirstTime==true) {
      // retrive the answer the user has typed  inn

      setState(() {
       widget._givenAnswer = widget.question.answer1;
      });
    }}),
          MaterialButton(
              minWidth: 50.0,
              color: Theme.of(context).buttonColor,
              child: Text(widget.question.answer2),
              onPressed: () {
            if(widget._isFirstTime==true) {
              setState(() {
                widget._givenAnswer = widget.question.answer2;
              });
            }   }),
          MaterialButton(
              minWidth: 50.0,
              color: Theme.of(context).buttonColor,
              child: Text(widget.question.answer3),
              onPressed: () {
    if(widget._isFirstTime==true) {
      // retrive the answer the user has typed  inn
      Text(widget.question.answer3);

      setState(() {
        widget._givenAnswer = widget.question.answer3;
      });
    }   })
        ],
      ),
      new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          MaterialButton(
              minWidth: 50.0,
              color: Theme.of(context).buttonColor,
              child: Text(widget.question.answer4),
              onPressed: () {
    if(widget._isFirstTime==true) {
      // retrive the answer the user has typed  inn
      Text(widget.question.answer4);

      setState(() {
        widget._givenAnswer = widget.question.answer4;

      });
    } }),
          MaterialButton(
              minWidth: 50.0,
              color: Theme.of(context).buttonColor,
              child: Text(widget.question.answer5),
              onPressed: () {
    if(widget._isFirstTime==true) {
      Text(widget.question.answer5);

      setState(() {
        widget._givenAnswer = widget.question.answer5;
      });
    }   }),
          MaterialButton(
              minWidth: 50.0,
              color: Theme.of(context).buttonColor,
              child: Text(widget.question.answer6),
              onPressed: () {
    if(widget._isFirstTime==true) {
      Text(widget.question.answer6);

      setState(() {
        widget._givenAnswer = widget.question.answer6;
      });
    }    }),
        ],
      ),
      new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // A button for checking the answer
          new MaterialButton(
            //style of the button
            color: Theme.of(context).buttonColor,

            child: Text(_sjekk,
                textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0)),

            onPressed: () {
              if(widget._isFirstTime==true) {
              // retrive the answer the user has typed  inn
                setState(() {
                   widget.setFirstime();
                  // Kaller metode i _questionElovator og evaluerer avgitt svar
                  _isRight = _questionEvaluator.checkAnswer(context,
                      widget.question, widget._givenAnswer,widget.infoLesson);
                  // calls the showMessage with, Gir tilbake melding
                  if(_isRight==false) {
                    questionFeedback.showMessageWrongAnswer(
                        context, widget.question);


                    // Endrer navn på button, til neste og den vil nå ta bruker til neste side
                  }

                });
              }
            },
          ),
        ],
      )
    ]));
  }
}
