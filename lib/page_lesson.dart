
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';



import 'package:appi_ducks/lesson.dart';
import 'package:appi_ducks/summary_page.dart';
import 'package:appi_ducks/question_type_a.dart';
import 'package:appi_ducks/question_type_b.dart';
import 'package:appi_ducks/question_type_C.dart';
import 'package:appi_ducks/database/database_helper.dart';
import 'package:appi_ducks/database/question.dart';
import 'package:appi_ducks/helpefile.dart';

// The page which shows the question in a lessonsession
class PageLesson extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
print('Og jeg kommer til å få til!!!');
     return _PageLesson();

  }


}


class _PageLesson extends State<PageLesson> implements LessonContract{



 Question currentQuestion;
   
  Widget _currentView ;
  HelpeFile helpeFile=new HelpeFile();

   Lesson lesson;
   int t=0;


  @override
  void initState() {
    super.initState();
    print('Jeg klarer jo ingen ting!');
    lesson =new Lesson(this);
    helpeFile.leggNyeSpr();


  }
  displayRecord(){
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

        return Scaffold(
                   appBar: AppBar(
                          backgroundColor: Theme.of(context).primaryColor,
                   title: Text('AppiDucks for  Python'),

                     //remove the back button in the AppBar i
                        automaticallyImplyLeading: false,
                   ),

          body: new ListView(
               children: <Widget>[

                new Container(

                              margin: EdgeInsets.all(0.0),
                              child:  new  FutureBuilder<Question>(
                                  future:lesson.getQuestion(t),

                                builder: (BuildContext context, AsyncSnapshot snapshot) {
                                    if(snapshot.hasError) print(snapshot.hasError);

                                  Question ques = snapshot.data;
                                  print(ques.pageWidget);
                                  return snapshot.hasData
                                      ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(child: currentView(ques)),
                                      )
                                      : new Center(child: new CircularProgressIndicator());


                                },)



                ),

                new MaterialButton(
               color: Theme.of(context).buttonColor,
                    child: Text('Neste',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0)),
                     onPressed: () {

                       screenUpdate();

                  }),
        ],),



          );


}

   Question getCurrentQuestion(){

    return currentQuestion;

   }

/*  void nextQuestion()  {
    setState(() {
      if (_lesson.isEmpty()) {
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new SummaryPage()));
      } else {
        currentQuestion = _lesson.first();
        _lesson.setCurrentQuestion(currentQuestion);
        currentView(currentQuestion);
       // _lesson.removeFirstQuestion();

      }
    });
  }
 */
  
Widget currentView(Question ques){


    if(ques.pageWidget=="QuestionTypeA"){
       t=t+1;
      return QuestionTypeA(ques);
      
    }

    if(ques.pageWidget=="QuestionTypeB")
      {
        t=t+1;
        return QuestionTypeB(ques);
      }

     if(ques.pageWidget=="QuestionTypeC"){
       t=t+1;
      return QuestionTypeC(ques);}

    return Container();

  }

 Widget getCurrentView() {
    return _currentView;
 }

  @override
  void screenUpdate() {
    setState(() {
      if (t >=3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => new SummaryPage ()),
      );}

      lesson.getQuestion(t);
    } );
  }

}