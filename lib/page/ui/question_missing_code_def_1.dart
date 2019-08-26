import 'package:flutter/material.dart';

import 'package:appi_ducks/question.dart';
import 'package:appi_ducks/lesson.dart';
import 'package:appi_ducks/user.dart';

class QuestionTypeD extends StatefulWidget {

  Question question;
  Lesson lesson;

  String _givenAnswer;
  User _user;
  bool _isFirstTime=true;

  QuestionTypeD(Question question, Lesson lesson, User user) {
    this.question = question;
    this.lesson =lesson;
   this._user=user;
   this._user=user;
   _givenAnswer='';



  }



  bool getFirstime() {
    return _isFirstTime;
  }

  void setFirstime() {
    _isFirstTime = false;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _QuestionTypeD();
  }
}

class _QuestionTypeD extends State<QuestionTypeD>{

  //  String that will take the answer the person give


  String queline1;
  String queline2;
  String  queline3;


  @override


  Widget build(BuildContext context) {

     queline1=widget.question.question.split("|").elementAt(0);

     queline2=widget.question.question.split("|").elementAt(1);

     queline3=widget.question.question.split("|").elementAt(2);



     // TODO: implement build
    return ClipRect(
      child: new Column(children: <Widget>[

        new Container(
          padding: EdgeInsets.only( top: 20.0),

          child: Text('Hva mangler her ? ',
          style: TextStyle(
              fontSize: 18.0, color: Theme
              .of(context)
              .accentColor),),
        ),
        new Container(
          width: 400.0,
          height: 150.0,
          margin: EdgeInsets.all(10.0),
          decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.indigo[50],
              border: new Border.all(
                  color: Theme
                      .of(context)
                      .primaryColor, width: 1.0)),





         child:  Column(

          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,

            children: <Widget>[


              new Container(
                padding: EdgeInsets.only(left: 40.0, top: 20.0),

               child: Row(

            children: <Widget>[



        MaterialButton(
               padding: EdgeInsets.only(left:0.0, right:20.0 ),
                  minWidth: 70.0,
                  height: 7.0,
                  color: Theme
                      .of(context)
                      .buttonColor,
                  child: Text(widget._givenAnswer,
                      softWrap: true,
                  textAlign: TextAlign.center),
                  onPressed: () {
                    if (widgetIsFirstTime()) {
                      // retrive the answer the user has typed  inn
                      setState(() {});
                    }
                  }
                  ),

              Text(
                queline1,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 18.0, color: Theme
                    .of(context)
                    .accentColor),
              ),
           ] ,
                 ),
                 ),

          new Container(

            padding: EdgeInsets.only(left:80.0),
            child: Row(

              children: <Widget>[
                Text(
                  queline2,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 16.0, color: Theme
                      .of(context)
                      .accentColor),
                ),
              ] ),
          ),

           new Container(
             padding: EdgeInsets.only(left:80.0),

             child: Row(

                     children: <Widget>[
                       Text(
                         queline3,
                         textAlign: TextAlign.left,
                         style: TextStyle(
                             fontSize: 16.0, color: Theme
                             .of(context)
                             .accentColor),
                       ),
                     ] ),
           ),

            ]
          ),


        ),

        new Row(


          children: <Widget>[
          // Container(
Container(
  padding:EdgeInsets.only(bottom: 10.0,top: 10.0,left:20.0, right:10.0 ),

       child:    Padding(
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

              minWidth: 125.0,


              key: Key('answerA1'),
              color: Theme.of(context).buttonColor,
              child: Text(widget.question.answer1,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: TextStyle(fontSize: 18.0)
              ),
              onPressed: () {

                print('trykket answer alternativ');
                if (widget._isFirstTime== true) {

                  setState(() {
                    widget._givenAnswer =widget.question.answer1;
                  });
                  


                //  answerGiven(context, widget.question.answer1);

                }
              },
            ),

    ),

          ),),

    Padding(
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

    minWidth: 125.0,


    key: Key('answerA1'),
    color: Theme.of(context).buttonColor,
    child: Text(widget.question.answer2,
    textAlign: TextAlign.center,
    softWrap: true,
    style: TextStyle(fontSize: 18.0)
    ),
    onPressed: () {

    if (widget.question.firstTime=='true') {

      setState(() {
        widget._givenAnswer =widget.question.answer2;
      });

    }
    },
    ),
       ),
    ),
        ]
        ),



        new Row(
            children: <Widget>[

   Container (
     padding: EdgeInsets.only(bottom: 10.0,top: 5.0,left:10.0, right:10.0 ),
   child: Padding(
    padding:EdgeInsets.only(bottom: 20.0,top: 10.0,left:20.0, right:20.0 ),
   // padding: EdgeInsets.only(bottom: 10.0,top:20.0,left: 15.0,right: 15.0),
    // mainAxisAlignment : MainAxisAlignment.spaceEvenly,
    //   mainAxisAlignment: MainAxisAlignment.center,

    child:Material(

    color: Theme.of(context).buttonColor,
    shape: RoundedRectangleBorder(side: BorderSide(color: Colors.blueGrey,width: 1.0),
    borderRadius: BorderRadius.circular(12.0)),

    shadowColor: Colors.lightBlueAccent.shade100,


                child: MaterialButton(

                  minWidth: 125.0,
                  height: 30.0,

                  key: Key('answerA1'),
                  color: Theme.of(context).buttonColor,
                  child: Text(widget.question.answer3,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: TextStyle(fontSize: 18.0)
                  ),
                  onPressed: () {

                    if (widget.question.firstTime== 'true') {

                      setState(() {
                        widget._givenAnswer =widget.question.answer3;

                      });

                    }
                  },
                ),
    ),


              ),),

    Padding(
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

                  minWidth: 125.0,


                  key: Key('answerA1'),
                  color: Theme.of(context).buttonColor,
                  child: Text(widget.question.answer4,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: TextStyle(fontSize: 18.0)
                  ),
                  onPressed: () {

                    if (widget.question.firstTime== 'true') {

                      setState(() {
                        widget._givenAnswer = widget.question.answer4;

                      });

                    }
                  },
                ),
    ),
    ),

            ]
        ),

        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            // A button for checking the answer
            new MaterialButton(
              //style of the button
              color: Theme.of(context).buttonColor,

              child: Text('Sjekk',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0)),

              onPressed: () {
                if (widgetIsFirstTime()) {

                  //
                  // retrieve the answer from the button the user has click

                  setState(() {
                    widget.setFirstime(); // oppdaterer at spørsmål er blitt forsøkt besvart

                    // Kaller metode checkAnswer i Question

                    widget.question.checkAnswer(context, widget.question, widget._givenAnswer , widget.lesson,widget._user);


                  });
                }
              },
            ),
          ],
        )

      ]),
    );


  }
  bool widgetIsFirstTime() => widget._isFirstTime == true;

  void answerGiven(BuildContext context, String s) {


    setState(() {
      widget._givenAnswer = s;

      widget.question.checkAnswer(context, widget.question,widget._givenAnswer, widget.lesson,widget._user);
      widget.question.setFirstTime();
      widget._isFirstTime=false;
    });
  }
}