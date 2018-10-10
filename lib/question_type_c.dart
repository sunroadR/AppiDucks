import 'package:flutter/material.dart';


import 'package:appi_ducks/question_category1.dart';
import 'package:appi_ducks/question_evaluator.dart';
import 'package:appi_ducks/main.dart';
import 'package:appi_ducks/summary_page.dart';
import 'package:appi_ducks/question_feedback.dart';
import 'package:appi_ducks/lesson.dart';
import 'package:appi_ducks/page_lesson.dart';

class QuestionTypeC extends StatefulWidget{

  QuestionCategory1 question;

  QuestionTypeC (QuestionCategory1 q)
  {
    question=q;
  }
  @override
  State<StatefulWidget> createState() {
    return _QuestionTypeC();

  }


}

class _QuestionTypeC extends State<QuestionTypeC> {

  final QuestionEvaluator _questionEvaluator = new QuestionEvaluator();
  QuestionFeedback questionFeedback = new QuestionFeedback();

  String _givenAnswer = '';
  String _sjekk = 'Sjekk';
  bool _isRight = false;
  bool _isFirst =true;


  @override
  Widget build(BuildContext context) {
    return new Column(
        children: <Widget>[

          new Container(

            width: 300.0,
            height: 200.0,
            margin: EdgeInsets.all(45.0),
            decoration: new BoxDecoration(
                shape: BoxShape.rectangle,

                color: Colors.indigo[50],
                border: new Border.all(
                    color: Theme
                        .of(context)
                        .primaryColor,
                    width: 1.0
                )
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[

                Text(widget.question.getQuestion(),

                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16.0, color: Theme
                      .of(context)
                      .accentColor),

                ),
                MaterialButton(
                    minWidth: 14.0,
                    color: Theme
                        .of(context)
                        .buttonColor,
                    child:
                    Text(_givenAnswer),
                    onPressed: () {
                      // retrive the answer the user has typed  inn
                      // ) Text(_questionCategory1.getAnswer1());

                      setState(() {
                        //   _givenAns = _questionCategory1.getAnswer1();

                      });
                    }


                ),

              ],
            ),


          ),

          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MaterialButton(
                  minWidth: 100.0,
                  color: Theme
                      .of(context)
                      .buttonColor,
                  child: Text(widget.question.getAnswer1()),
                  onPressed: () {
                    // retrive the answer the user has typed  inn
                    Text(widget.question.getAnswer1());

                    setState(() {
                      _givenAnswer = widget.question.getAnswer1();
                    });
                  }

              ),
              MaterialButton(
                  minWidth: 50.0,
                  color: Theme
                      .of(context)
                      .buttonColor,
                  child: Text(widget.question.getAnswer2()),

                  onPressed: () {
                    setState(() {
                      _givenAnswer =widget.question.getAnswer2();
                    });
                  }


              ),
              MaterialButton(
                  minWidth: 50.0,
                  color: Theme
                      .of(context)
                      .buttonColor,
                  child: Text(widget.question.getAnswer3()),
                  onPressed: () {
                    // retrive the answer the user has typed  inn
                    Text(widget.question.getAnswer3());

                    setState(() {
                      _givenAnswer = widget.question.getAnswer3();
                    });
                  }


              ),

            ],
          ),
          new Row(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: <Widget>[
              MaterialButton(
                  minWidth: 50.0,
                  color: Theme
                      .of(context)
                      .buttonColor,
                  child: Text(widget.question.getAnswer4()),
                  onPressed: () {
                    // retrive the answer the user has typed  inn
                    Text(widget.question.getAnswer4());

                    setState(() {
                      _givenAnswer = widget.question.getAnswer4();
                    });
                  }


              ),
              MaterialButton(
                  minWidth: 50.0,
                  color: Theme
                      .of(context)
                      .buttonColor,
                  child: Text(widget.question.getAnswer5()),
                  onPressed: () {
                    Text(widget.question.getAnswer5());

                    setState(() {
                      _givenAnswer = widget.question.getAnswer5();
                    });
                  }


              ),
              MaterialButton(
                  minWidth: 50.0,
                  color: Theme
                      .of(context)
                      .buttonColor,
                  child: Text(widget.question.getAnswer6()),
                  onPressed: () {
                    Text(widget.question.getAnswer6());

                    setState(() {
                      _givenAnswer =widget.question.getAnswer6();
                    });
                  }


              ),
            ],),


          new Row (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              // A button for checking the answer
              new MaterialButton(

                //style of the button
                color: Theme
                    .of(context)
                    .buttonColor,

                child: Text(_sjekk, textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0)),

                onPressed: () {
                  // retrive the answer the user has typed  inn
                  if (_isFirst == true) {
                    setState(() {
    // Kaller metode i _questionElovator og evaluerer avgitt svar
    _isRight = _questionEvaluator.checkAnswer(
    widget.question, _givenAnswer);
    // calls the showMessage with, Gir tilbake melding
    questionFeedback.showMessage(context, _isRight, widget.question);
    _isFirst=false;
    // Endrer navn på button, til neste og den vil nå ta bruker til neste side
    });}
                },
              ),
            ],)
        ]
    );
  }

}
