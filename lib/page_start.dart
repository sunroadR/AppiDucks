import 'package:flutter/material.dart';
import 'package:appi_ducks/page_lesson.dart';
import 'package:appi_ducks/helpefile.dart';
import 'package:appi_ducks/database/database_helper.dart';


/*
    The startpage  for the  app where information about the users level,
    which weeks the user can pick lesson from and som information about ....

 */
class PageStart extends StatelessWidget {
  @override



  PageStart(){

    DataBaseHelper dataBaseHelper = new DataBaseHelper();
    HelpeFile helpeFile= new HelpeFile();
    dataBaseHelper.initDB();

    helpeFile.leggNyeSpr();
  }


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

                 print(' Men jeg jobber masse !!');
                 // When pushed navigates to the first question of the lesson for that week
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => new PageLesson ()),
                 );
               }
           )



         ], )




   );


  }

}





