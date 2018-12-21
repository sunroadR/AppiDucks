import 'package:flutter/material.dart';
import 'package:appi_ducks/page/page_lesson.dart';
import 'package:appi_ducks/start_lesson.dart';
import 'package:appi_ducks/read_week.dart';

/*
    The startpage  for the  app where information about the users level,
    which weeks the user can pick lesson from and som information about ....

 */
class PageStart extends StatelessWidget {

  StartLesson startLesson = new StartLesson();
  ReadWeek readweek = new ReadWeek();

  @override
  PageStart() {


  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AppiDucks for Python'),
          // remove the back button in the AppBar
          automaticallyImplyLeading: false,
        ),
        //body: QuestionTypeA(),
        body: Column(
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
                child: Text(
                  '1',
                  style:
                      TextStyle(fontSize: 28.0, color: Colors.deepOrangeAccent),
                ),
                onPressed: () {

                  readweek.loadWeek(2);

                  // When pushed navigates to the first question of the lesson for that week
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => new PageLesson()),
                  );
                })
          ],
        ));
  }
}
