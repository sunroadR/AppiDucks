import 'package:flutter/material.dart';


import './question_type_b.dart';
import './question_type_c.dart';
import './question_type_a.dart';
import './page_lesson.dart';

//
void main() => runApp(
    //MaterielApp is top level widget
    MaterialApp(
      // Define the color through the app
  theme: ThemeData(
    primaryColor: Colors.deepOrangeAccent,
    accentColor: Colors.indigo[900],
    buttonColor: Colors.indigo[100],
  ),
  home: MyApp(),));

// This widget is the root the application.
class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: Text('AppiDucks for Python'),
          // remove the back button in the AppBar
          automaticallyImplyLeading: false,
        ),
         //body: QuestionTypeA(),
         body:  Column( 
           children: <Widget>[
         
         new Padding(
             padding: EdgeInsets.all(8.0),
         ),


           // Button for click the week to start the lesson from
           new RaisedButton(

             //Style of the button
               color: Theme.of(context).buttonColor,
               shape: new CircleBorder(
                 side: BorderSide(color: Colors.lightBlue),

               ),
               child: Text('1',
               style: TextStyle(fontSize: 28.0,
                                color: Colors.deepOrangeAccent),
                                ),
               onPressed: () {

                 // When pushed navigates to the first question of the lesson
                 Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) =>PageLesson ()),
                 );
               }
               )



  ], )




    );


  }


}
