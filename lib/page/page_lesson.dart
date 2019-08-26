
import 'package:appi_ducks/page/ui/question_missing_code_def_1.dart';
import 'package:appi_ducks/page/ui/question_missing_code_def_2.dart';
import 'package:appi_ducks/page/ui/question_missing_code_return_1.dart';
import 'package:appi_ducks/page/ui/question_missing_code_return_2.dart';
import 'package:appi_ducks/page/ui/question_returnere_code.dart';
import 'package:appi_ducks/page/ui/question_type_print_tall.dart';
import 'package:flutter/material.dart';


import 'package:appi_ducks/lesson.dart';
import 'package:appi_ducks/page/summary_page.dart';
import 'package:appi_ducks/page/ui/question_type_a.dart';
import 'package:appi_ducks/page/ui/question_type_b.dart';
import 'package:appi_ducks/page/ui/question_type_c.dart';
import 'package:appi_ducks/question.dart';
import 'package:appi_ducks/user.dart';

// The page which shows the question in a lesson-session
class PageLesson extends StatefulWidget {

  Lesson lesson;
  User user;

  int uke;

  PageLesson(
      this.lesson,
      this.user,
      this.uke

      );



  @override
  State<StatefulWidget> createState() {
    return _PageLesson();
  }






}

class _PageLesson extends State<PageLesson> with WidgetsBindingObserver{





  int max;
  List<Question> _allQuestion;

  int questionNr=0;

  @override
  void initState() {
    super.initState();


    if (widget.uke == 1) {
      _allQuestion = widget.lesson.createLessonUke1();
    }
    if(widget.uke==2){
      _allQuestion=widget.lesson.createLessonUke2();
    }
    if (widget.uke == 3) {
      _allQuestion = widget.lesson.createLessonUke3();
    }
  }



  /// Hva skjer egentlig her ?
  displayRecord() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // readFromFile.read();
    return new WillPopScope(
        onWillPop: () => Future.value(false),
    child: Scaffold(
      resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .primaryColor,
          title: Text('AppiDucks for  Python'),

          //remove the back button in the AppBar i
          automaticallyImplyLeading: false,
        ),
        body: ListView(

          children: <Widget>[


             new Container(

                margin: EdgeInsets.all(0.0),



                 child: currentView(_allQuestion.elementAt(questionNr)),


             ),


            Padding(
              padding:EdgeInsets.only(bottom: 20.0,top: 10.0,left:20.0, right:20.0 ),
             // padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Material(
              color: Colors.deepOrangeAccent,
              shape: RoundedRectangleBorder(side: BorderSide(color: Colors.blueGrey,width: 1.0),
              borderRadius: BorderRadius.circular(12.0)),
               // borderRadius:BorderRadius.circular(100.0) ,
              shadowColor: Colors.lightBlueAccent.shade100,
            child: MaterialButton(


                color: Theme
                    .of(context)
                    .primaryColor,
                child: Text('Neste',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0,
                    color: Colors.white)),
                onPressed: () {

                    if (questionNr == _allQuestion.length - 1) {
                      // prøver å se om det hjelper å sette listOfAllQuestion = null
                      widget.lesson.listOfAllQuestions = null;

                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) =>
                          SummaryPage(widget.lesson.weekNr, widget.user,
                              widget.user.numberOfCorrectAnswerThisLesson)));
                    }

                    else {
                      screenUpdate();
                    }
                  
                }),
            ),),

              ],
        )
    ),
    );
  }


  Widget currentView(Question ques) {


    if (ques.pageWidget == "questionTypeA") {
      return new QuestionTypeA(ques,widget.lesson,widget.user,widget);
    }

    if (ques.pageWidget == "questionTypeB") {
      return new QuestionTypeB(ques,widget.lesson,widget.user);
    }

    if (ques.pageWidget == "questionTypeC") {
      return new QuestionTypeC(ques,widget.lesson,widget.user);
    }

    if (ques.pageWidget == "questionTypeD") {
      return new QuestionTypeD(ques,widget.lesson,widget.user);
    }
    if (ques.pageWidget == "questionTypeE") {
      return new QuestionTypeE(ques,widget.lesson,widget.user);
    }
    if (ques.pageWidget == "questionTypeD2") {
      return new QuestionTypeD2(ques,widget.lesson,widget.user);
    }
    if (ques.pageWidget == "questionTypeE2") {
      return new QuestionTypeE2(ques,widget.lesson,widget.user);
    }
    if (ques.pageWidget == "questionTypeF") {
      return new QuestionTypeF(ques,widget.lesson,widget.user);
    }
    if (ques.pageWidget == "questionTypePrintTall") {
      return new QuestionTypePrintTall(ques,widget.lesson,widget.user);
    }


  }


  void screenUpdate() {
    setState(() {
     questionNr=questionNr+1;
     if(questionNr==_allQuestion.length){
       // prøver å se om det hjelper å sette listOfAllQuestion = null
       widget.lesson.listOfAllQuestions=null;
       Navigator.push(context, MaterialPageRoute(builder:(context)=> SummaryPage(widget.lesson.weekNr,widget.user,
       widget.user.numberOfCorrectAnswerThisLesson)));
     }
     else {
      widget.lesson.listOfAllQuestions.first;
     }

    });

  }
}

