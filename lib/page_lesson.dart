import 'dart:async';

import 'package:flutter/material.dart';


import 'package:appi_ducks/question_category1.dart';
import 'package:appi_ducks/lesson.dart';
import 'package:appi_ducks/summary_page.dart';
import 'package:appi_ducks/question_type_a.dart';
import 'package:appi_ducks/question_type_b.dart';
import 'package:appi_ducks/question_type_C.dart';

class PageLesson extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _PageLesson();

  }






}


class _PageLesson extends State<PageLesson> {

  QuestionCategory1 _currentQuestion;
   
  Widget _currentView ;
  
 final Lesson  _lesson = new Lesson();

  @override
  void initState() {
    super.initState();
    _currentQuestion = _lesson.first();
    _lesson.setCurrentQuestion(_currentQuestion);
    currentView(_currentQuestion);
    _currentView= getCurrentView();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        title: Text('AppiDucks for  Python'),
        //remove the back button in the AppBar i
        automaticallyImplyLeading: false,
      ),
      body: new Column(
        children: <Widget>[

          // her skal det wære en widget layout som oppdaterer seg

              //padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),

                new Container(
                  margin: EdgeInsets.all(5.0),
                 child: getCurrentView()

                ),
                new MaterialButton(key: Key('answerA1'),
               color: Theme.of(context).buttonColor,
                    child: Text('Neste',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0)),
                     onPressed: () {
                       //currentView(getCurrentQuestion());

                       //oppdater Widget state
                     nextQuestion();

                  }),

              ],


            ),
          );



      // this.setState((){

      // }

      //  );
      //



  }
   QuestionCategory1 getCurrentQuestion(){

    return _currentQuestion;

   }

  void nextQuestion()  {
    setState(() {
      if (_lesson.isEmpty()) {
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new SummaryPage()));
      } else {
        _currentQuestion = _lesson.first();
        _lesson.setCurrentQuestion(_currentQuestion);
        currentView(_currentQuestion);
        _lesson.removeFirstQuestion();

      }
    });
  }
  
  
  void currentView(QuestionCategory1  ques){
    if(ques.getPageView()=="QuestionTypeA"){

      _currentView= QuestionTypeA(_currentQuestion);
      
    }

    if(ques.getPageView()=="QuestionTypeB")
      {
        _currentView =QuestionTypeB(_currentQuestion);
      }

    if(ques.getPageView()=="QuestionTypeC")
    {
      _currentView =QuestionTypeC(_currentQuestion);
    }
  }

 Widget getCurrentView() {
    return _currentView;
 }

}