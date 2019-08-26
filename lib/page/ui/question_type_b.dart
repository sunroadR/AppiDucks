
import 'package:flutter/material.dart';

import 'package:appi_ducks/question.dart';
import 'package:appi_ducks/page/ui/question_feedback.dart';
import 'package:appi_ducks/lesson.dart';
import 'package:appi_ducks/user.dart';
// WidgetClass that shows the layout for the screen for the question of type A
// but trough the implemetation it will read the qeustion
// and answer from a table.
//
class QuestionTypeB extends StatefulWidget {

  Question question;
  Lesson lesson;
  String _givenAnswer = '';
  bool _isFirstTime;
  User _user;

  QuestionTypeB(Question q, Lesson lesson, User user) {
    this.question = q;
    this.lesson = lesson;
    this._isFirstTime = true; // first time question shown in the this widget
    _givenAnswer = '';
    this._user = user;
  }

  @override
  State<StatefulWidget> createState() {
    return _QuestionTypeB();
  }

  bool getFirstime() {
    return _isFirstTime;
  }

  void setFirstime() {
    _isFirstTime = false;
  }
}

// A corresponding State class. This class holds the data related to layout
// of question of type B
//
class _QuestionTypeB extends State<QuestionTypeB> {
  //static Lesson lesson = new Lesson();
  QuestionFeedback questionFeedback = new QuestionFeedback();

  String _givenAnswer = '';

  // Create a text controller. That is used to retrieve  the current answer
  // of the textfield
  final _ansController = new TextEditingController();

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
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(widget.question.question,
                key: Key('QuestionTypeB'),
                style: TextStyle(
                    fontSize: 18.0, color: Theme.of(context).accentColor),
                textAlign: TextAlign.center),
          ),
          new SingleChildScrollView(
            child: Container(
              width: 350.0,
              height: 200.0,
              margin: EdgeInsets.all(10.0),
              decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.indigo[50],
                  border: new Border.all(
                      color: Theme.of(context).primaryColor, width: 1.0)),

              child: TextField(
                autofocus: true | false,
                textAlign: TextAlign.center,
                controller: _ansController,
                decoration: new InputDecoration(



                  hintText: 'Tast inn svaret',
                  hintStyle: TextStyle(color: Theme.of(context).accentColor),
                  border: InputBorder.none,

                ),

              ),),
            ),


     Container(
       padding: EdgeInsets.only(top:50,bottom: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // A button for checking the answer
              new MaterialButton(
                  //style of the button
                  color: Theme.of(context).buttonColor,
                  child: Text('Sjekk',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.0)),
                  onPressed: () {

                    if (widget.question.firstTime=='true') {

                      // retrive the answer the user has typed  inn
                      setState(() {
                        _givenAnswer = _ansController.text.toString();
                        // sjekker at det er tastet inn et svar

                        if (_givenAnswer.length == 0) {
                          // Gir beskjed om at de må skrive inn et svar
                          questionFeedback.showMessageNoAnswer(context);
                        }
                        else {
                          widget.setFirstime();
                          // Kaller metoden checkAnswer i Question
                          widget.question.checkAnswer(context, widget.question, _givenAnswer, widget.lesson,widget._user);

                        }
                      });
                    }
                  }),
            ],
          ),),
        ]);
  }

  bool firstTimeAnswered() => widget._isFirstTime == true;
}
