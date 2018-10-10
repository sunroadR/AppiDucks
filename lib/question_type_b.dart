import 'package:flutter/material.dart';

import 'package:appi_ducks/question_category1.dart';
import 'package:appi_ducks/question_evaluator.dart';
import 'package:appi_ducks/summary_page.dart';
import 'package:appi_ducks/page_lesson.dart';
import 'package:appi_ducks/lesson.dart';
import 'package:appi_ducks/question_feedback.dart';
import 'dart:developer';

class QuestionTypeB extends StatefulWidget {

  QuestionCategory1 ques;

  QuestionTypeB(QuestionCategory1 q){
    this.ques=q;

  }

  @override
  State<StatefulWidget> createState() {
    return _QuestionTypeB();
  }



}
// A corresponding State class. This class holds the data related to layout
// of question of type B
//
class _QuestionTypeB extends State<QuestionTypeB>{


  //static Lesson lesson = new Lesson();
  QuestionFeedback questionFeedback= new QuestionFeedback();
  QuestionEvaluator _questionEvaluator =new QuestionEvaluator();

  String sjekk ='Sjekk';
  String _givenAnswer;
  bool _isRight;
  bool isFirst = true;

  // Create a text controller. That is used to retrieve  the current answer
  // of the textfield
  final _ansController = TextEditingController();

  @override
  void dispose() {

    _ansController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[

          new Text(
              widget.ques.getQuestion(),
              key: Key('QuestionTypeB'),


              style: TextStyle(fontSize: 24.0,
              color: Theme
                  .of(context)
                  .accentColor),
              textAlign: TextAlign.center),

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
            child: new TextField(
              textAlign: TextAlign.center,
              controller: _ansController,
              decoration: new InputDecoration(
                hintText: 'Tast inn svaret',
                hintStyle: TextStyle(color: Theme.of(context).accentColor),
                border: InputBorder.none,
              ),
            ),
          ),
          new Row (
            mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

              // A button for checking the answer
                 new MaterialButton(

                 //style of the button
                 color: Theme
                    .of(context)
                    .buttonColor,

                   child: Text( sjekk , textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0)),

                onPressed: () {

                  // retrive the answer the user has typed  inn
                  setState(() {
                    _givenAnswer = _ansController.text.toString();

                    // sjekker at det er tastet inn et svar
                    if(_givenAnswer.length==0)
                      {
                        // Gir beskjed om at de må skrive inn et svar
                      questionFeedback.showMessageNoAnswer(context);

                      }

                   else {
                      // Kaller metode i _questionElovator og evaluerer avgitt svar
                        _isRight = _questionEvaluator.checkAnswer(
                        widget.ques, _givenAnswer);
                    // calls the showMessage with, Gir tilbake melding
                     questionFeedback.showMessage(context,_isRight, widget.ques);
                    // Endrer navn på button, til neste og den vil nå ta bruker til neste side
                       isFirst=false;
                  }});





                },


              ),
            ],),


        ]
    );
  }







}