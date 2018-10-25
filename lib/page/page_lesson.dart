import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:source_maps/builder.dart';


import 'package:appi_ducks/lesson.dart';
import 'package:appi_ducks/page/summary_page.dart';
import 'package:appi_ducks/page/ui/question_type_a.dart';
import 'package:appi_ducks/page/ui/question_type_b.dart';
import 'package:appi_ducks/page/ui/question_type_c.dart';
import 'package:appi_ducks/database/model/question.dart';
import 'package:appi_ducks/helpefile.dart';
import 'package:appi_ducks/info_lesson.dart';
// The page which shows the question in a lessonsession
class PageLesson extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PageLesson();
  }
}

class _PageLesson extends State<PageLesson> implements LessonContract {
  final controller = new ScrollController();
  final InfoLesson  infoLesson = new InfoLesson();
  OverlayEntry sticky;
  GlobalKey stickyKey = new GlobalKey();

  Question currentQuestion;

  Widget _currentView;

  HelpeFile helpeFile = new HelpeFile();

  Lesson lesson;
  int t = 0;
  bool _notAnswered=false;

  @override
  void initState() {
    super.initState();
    lesson = new Lesson(this);
    helpeFile.leggNyeSpr();
  }

  displayRecord() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .primaryColor,
          title: Text('AppiDucks for  Python'),

          //remove the back button in the AppBar i
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: <Widget>[
            new Container(
                margin: EdgeInsets.all(0.0),
                child: new FutureBuilder<Question>(
                  future: lesson.getQuestion(t),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {

                    if (snapshot.hasError) print(snapshot.hasError);

                    Question ques = snapshot.data;
                    // print(ques.question );
                    return snapshot.hasData
                        ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: currentView(ques)),
                    )
                        : new Center(child: new CircularProgressIndicator());
                  },
                )),
            new MaterialButton(
                color: Theme
                    .of(context)
                    .buttonColor,
                child: Text('Neste',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0)),
                onPressed: () {
                  if(t>3){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=> SummaryPage()));
                  }

                  screenUpdate();
                }),
          ],
        ));
  }
  bool get notAnswered => _notAnswered;
  void setNotAnsweredTrue(){
     _notAnswered=true;
  }

  void setNotAnsweredFalse(){
    _notAnswered=false;
  }

  void setCurrentQuestion(Question q) {
    this.currentQuestion = q;
  }

  Widget currentView(Question ques) {
    if (ques.pageWidget == "QuestionTypeA") {
      return QuestionTypeA(ques,infoLesson);
    }

    if (ques.pageWidget == "QuestionTypeB") {
      return QuestionTypeB(ques,infoLesson);
    }

    if (ques.pageWidget == "QuestionTypeC") {
      return QuestionTypeC(ques,infoLesson);
    }
  }

  @override
  void screenUpdate() {
    setState(() {

        lesson.getQuestion(t);
        t = t + 1;
      


    });
  }
}

