
import 'package:flutter/material.dart';


import 'package:appi_ducks/lesson.dart';
import 'package:appi_ducks/page/summary_page.dart';
import 'package:appi_ducks/page/ui/question_type_a.dart';
import 'package:appi_ducks/page/ui/question_type_b.dart';
import 'package:appi_ducks/page/ui/question_type_c.dart';
import 'package:appi_ducks/database/model/question.dart';
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



  //HelpeFile helpeFile = new HelpeFile();

  Lesson lesson;
  int t = 0;
  bool _notAnswered=false;

  @override
  void initState() {
    super.initState();
    lesson = new Lesson(this);
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


                    return snapshot.hasData
                        ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: currentView(ques)),
                    )
                        : new Center(child: new CircularProgressIndicator());
                  },
                )),
            new MaterialButton(

                minWidth: 300.0,
                height: 50.0,
                color: Theme
                    .of(context)
                    .primaryColor,
                child: Text('Neste',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0,
                    color: Colors.white)),
                onPressed: () {
                  if(t>=33){
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
      return new QuestionTypeA(ques,infoLesson);
    }

    if (ques.pageWidget == "QuestionTypeB") {
      return new QuestionTypeB(ques,infoLesson);
    }

    if (ques.pageWidget == "QuestionTypeC") {
      return new QuestionTypeC(ques,infoLesson);
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

