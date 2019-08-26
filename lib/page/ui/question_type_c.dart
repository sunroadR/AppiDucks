import 'package:flutter/material.dart';

import 'package:appi_ducks/question.dart';
import 'package:appi_ducks/lesson.dart';
import 'package:appi_ducks/user.dart';

// WidgetClass that shows the layout for the screen for the question of type C
//  , but troughthe implemetation it will read the qeustion
// and answer from a table.
//
class QuestionTypeC extends StatefulWidget {
  Question question;
  Lesson lesson;
  bool _isFirstTime=true;
  String _givenAnswer;
  User _user;


  QuestionTypeC(Question q, Lesson lesson, User user) {
    this.question = q;
    this.lesson = lesson;
    _givenAnswer ='';
    this._user= user;
  }

  @override
  State<StatefulWidget> createState() {
    return _QuestionTypeC();
  }

  bool get firstTime => _isFirstTime;


  void setFirstime() {
    _isFirstTime = false;
  }
}

// A corresponding State class. This class holds the data related to layout
// of question of type C
//

class _QuestionTypeC extends State<QuestionTypeC> {



  @override
  Widget build(BuildContext context) {

    return ClipRect(
        child: new Column(children: <Widget>[

      new Container(
        width: 300.0,
        height: 150.0,
        margin: EdgeInsets.all(45.0),
        decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.indigo[50],
            border: new Border.all(
                color: Theme.of(context).primaryColor, width: 1.0)),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              widget.question.question,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 16.0, color: Theme.of(context).accentColor),
            ),


             MaterialButton(
                minWidth: 14.0,
                color: Theme.of(context).buttonColor,
                child: Text(widget._givenAnswer),
                onPressed: () {
                  if (widgetIsFirstTime()) {
                    // retrive the answer the user has typed  inn

                    setState(() {});
                  }
                }
                ),

          ],
        ),
      ),

      new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[

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


      child:  MaterialButton(
              minWidth: 14.0,
              color: Theme.of(context).buttonColor,
              child: Text(widget.question.answer1),
              onPressed: () {
                if (widgetIsFirstTime()) {
                  // retrive the answer the user has typed  inn

                  setState(() {
                    widget._givenAnswer =widget.question.answer1;
                  });
                }
              }),
    ),),

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


    child:   MaterialButton(
              minWidth: 50.0,
              color: Theme.of(context).buttonColor,
              child: Text(widget.question.answer2),
              onPressed: () {
                if (widgetIsFirstTime()) {
                  setState(() {
                    widget._givenAnswer = widget.question.answer2;
                  });
                }
              })
    ),),
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
              minWidth: 50.0,
              color: Theme.of(context).buttonColor,
              child: Text(widget.question.answer3),
              onPressed: () {
                if (widgetIsFirstTime()) {
                  // retrive the answer the user has typed  inn
                  Text(widget.question.answer3);

                  setState(() {
                    widget._givenAnswer = widget.question.answer3;
                  });
                }
              }),
    ),)
        ],
      ),

      new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[

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
              minWidth: 50.0,
              color: Theme.of(context).buttonColor,
              child: Text(widget.question.answer4),
              onPressed: () {
                if (widgetIsFirstTime()) {
                  // retrive the answer the user has typed  inn
                  Text(widget.question.answer4);

                  setState(() {
                    widget._givenAnswer = widget.question.answer4;
                  });
                }
              }),
        ),),


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


    child:MaterialButton(
              minWidth: 50.0,
              color: Theme.of(context).buttonColor,
              child: Text(widget.question.answer5),
              onPressed: () {
                if (widgetIsFirstTime()) {
                  Text(widget.question.answer5);

                  setState(() {
                    widget._givenAnswer = widget.question.answer5;
                  });
                }
              }),
    ),),

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


  child:  MaterialButton(
              minWidth: 50.0,
              color: Theme.of(context).buttonColor,
              child: Text(widget.question.answer6),
              onPressed: () {
                if (widgetIsFirstTime()) {
                  Text(widget.question.answer6);

                  setState(() {
                    widget._givenAnswer = widget.question.answer6;
                  });
                }
              }),
    ),),
        ],
      ),

      new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

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


          // A button for checking the answer
          child: MaterialButton(
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
        ),),
        ],
      )
    ]
        )
    );
  }

  bool widgetIsFirstTime() => widget._isFirstTime == true;
}
