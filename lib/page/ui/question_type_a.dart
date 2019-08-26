import 'package:appi_ducks/page/page_lesson.dart';
import 'package:appi_ducks/page/summary_page.dart';
import 'package:flutter/material.dart';
import 'package:appi_ducks/question.dart';
import 'package:appi_ducks/lesson.dart';
import 'package:appi_ducks/user.dart';

// WidgetClass that shows the layout for the screen for the question of type A
//  , but troughthe implemetation it will read the qeustion
// and answer from a table.
//
class QuestionTypeA extends StatefulWidget {
  Question question;
  Lesson lesson;
  bool _isFirstTime;
  User _user;
  PageLesson _pageLesson;


  QuestionTypeA(Question ques,Lesson lesson, User user,PageLesson pageLesson){
    this.question=ques;
    this.lesson=lesson;
     _isFirstTime=true;
     _user = user;
     this._pageLesson = pageLesson;
  }

  @override
  State<StatefulWidget> createState() {
    return _QuestionTypeA();
  }

  bool getFirstime(){
    return _isFirstTime;
  }


}

// Keeps the state for the statefullwidget
class _QuestionTypeA extends State<QuestionTypeA> {

  //  String that will take the answer the person give
  String _givenAnswer = '';

  @override
  Widget build(BuildContext context) {
    

    return Column(


       mainAxisAlignment: MainAxisAlignment.center,

        // center the text on the screen

        children: <Widget>[

          new Container(
            padding: EdgeInsets.only(left:20.0,right: 20.0,top:5.0,bottom: 5.0) ,
          ),
          // Text with the question
          new Align(
           alignment:Alignment.bottomCenter,
          child: Container(
                 height: 150,
                 width: 350,
            decoration: BoxDecoration(
              border:Border.all(width: 2.0,
                color: Theme.of(context).buttonColor,),
           //   color: Colors.indigo[50],
         ///      color: Color.fromARGB(100, 125, 2, 0), var bra ,på en måte
              color: Color.fromARGB(20, 255,70, 70),
            /**    gradient: RadialGradient(
                  center: const Alignment(-0.5, -0.6),
                   radius: 0.3,
                  colors: <Color>[
                    const Color(0xFFEEEEE3),
                    const Color(0xFf16183),
                  ],
                  stops: <double>[0.9, 1.0],
                ),*/
            ),
            padding: EdgeInsets.only(left:10.0,right: 20.0,top:20.0,bottom: 20.0),

            child: Text(

            widget.question.question,

              style: TextStyle(
                  fontSize: 18.0, color: Theme.of(context).accentColor),
              textAlign: TextAlign.center,
            softWrap: true,),
          ),


          ),






          new Padding(

          padding: EdgeInsets.only(bottom: 10.0,top:20.0,left: 15.0,right: 15.0),
          // mainAxisAlignment : MainAxisAlignment.spaceEvenly,
          //   mainAxisAlignment: MainAxisAlignment.center,

          child:Material(

          color: Theme.of(context).buttonColor,
          shape: RoundedRectangleBorder(side: BorderSide(color: Colors.blueGrey,width: 1.0),
          borderRadius: BorderRadius.circular(12.0)),
          shadowColor: Colors.lightBlueAccent.shade100,

          child: MaterialButton(

                minWidth: 350,

                color: Theme.of(context).buttonColor,
                child: Text(widget.question.answer1,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: TextStyle(fontSize: 16.0)
                    ),
                onPressed: () {

                  if (widget._isFirstTime== true) {

                    answerGiven(context, widget.question.answer1);

                  }
                },
          ),),
          ),



    new Padding(
    padding:EdgeInsets.only(bottom: 10.0,top: 10.0,left:20.0, right:20.0 ),
   // padding: EdgeInsets.only(bottom: 10.0,top:20.0,left: 15.0,right: 15.0),
    // mainAxisAlignment : MainAxisAlignment.spaceEvenly,
    //   mainAxisAlignment: MainAxisAlignment.center,

    child:Material(

    color: Theme.of(context).buttonColor,
    shape: RoundedRectangleBorder(side: BorderSide(color: Colors.blueGrey,width: 1.0),
    borderRadius: BorderRadius.circular(12.0)),
    // borderRadius:BorderRadius.circular(100.0) ,
    shadowColor: Colors.lightBlueAccent.shade100,

    child: MaterialButton(
                minWidth: 350,
                color: Theme.of(context).buttonColor,
                child: Text(
                  widget.question.answer2,
                  softWrap: true,
                  style: TextStyle(fontSize: 16.0,

                  ),
                    textAlign: TextAlign.center
                ),
                onPressed: () {
                  if (widget._isFirstTime == true) {
                    answerGiven(context,widget.question.answer2);

                  }
                },
    ),   ),
),
    new Padding(
    padding:EdgeInsets.only(bottom: 10.0,top: 10.0,left:20.0, right:20.0 ),
   // padding: EdgeInsets.only(bottom: 10.0,top:20.0,left: 15.0,right: 15.0),
    // mainAxisAlignment : MainAxisAlignment.spaceEvenly,
    //   mainAxisAlignment: MainAxisAlignment.center,

    child:Material(

    color: Theme.of(context).buttonColor,
    shape: RoundedRectangleBorder(side: BorderSide(color: Colors.blueGrey,width: 1.0),
    borderRadius: BorderRadius.circular(12.0)),
    // borderRadius:BorderRadius.circular(100.0) ,
    shadowColor: Colors.lightBlueAccent.shade100,


            child: MaterialButton(

            minWidth: 350,

              key: Key('answerA3'),
                color: Theme.of(context).buttonColor,
                child: Text(
                  widget.question.answer3,
                  softWrap: true,
                  style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.center
                ),
                onPressed: () {
                  if (widget._isFirstTime==true) {

                    answerGiven(context, widget.question.answer3);


                  }
                },
            ),  ),
    ),

          new Padding(
            padding:EdgeInsets.only(bottom: 20.0,top: 10.0,left:20.0, right:20.0 ),
            // padding: EdgeInsets.only(bottom: 10.0,top:20.0,left: 15.0,right: 15.0),
            // mainAxisAlignment : MainAxisAlignment.spaceEvenly,
            //   mainAxisAlignment: MainAxisAlignment.center,

            child:Material(

              color: Theme.of(context).buttonColor,
              shape: RoundedRectangleBorder(side: BorderSide(color: Colors.blueGrey,width: 1.0),
                  borderRadius: BorderRadius.circular(12.0)),
              // borderRadius:BorderRadius.circular(100.0) ,
              shadowColor: Colors.lightBlueAccent.shade100,


              child: MaterialButton(


               minWidth: 350.0,

                key: Key('answerA4'),
                  color: Theme.of(context).buttonColor,

                  child: Text(
                    widget.question.answer4,
                    style: TextStyle(fontSize: 16.0),

                    softWrap: true,
                      textAlign: TextAlign.center
                  ),
                  onPressed: () {
                    if (widget._isFirstTime == true) {
                      answerGiven(context,widget.question.answer4);
    }


                  }),),
            ),

           ]
    );











  }


  void answerGiven(BuildContext context, String s) {


    setState(() {
      _givenAnswer = s;

     widget.question.checkAnswer(context, widget.question, _givenAnswer, widget.lesson,widget._user);
      widget.question.setFirstTime();
      widget._isFirstTime=false;

    });
  }


  @override
  void screenUpdate() {
    setState(() {
        widget.lesson.upDateQuestionNr();
      if(widget.lesson.questionNr==12){
        // prøver å se om det hjelper å sette listOfAllQuestion = null
        widget.lesson.listOfAllQuestions=null;
        Navigator.push(context, MaterialPageRoute(builder:(context)=> SummaryPage(widget.lesson.weekNr,widget._user,
            widget._user.numberOfCorrectAnswerThisLesson)));
      }
      else {

        widget.lesson.listOfAllQuestions.first;
      }

    });

  }
}
