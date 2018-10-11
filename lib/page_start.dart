import 'package:flutter/material.dart';
import 'package:appi_ducks/page_lesson.dart';



class PageStart extends StatelessWidget {
  @override



  Widget build(BuildContext context) {
   return  Scaffold(
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





