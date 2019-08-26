import 'package:flutter/material.dart';
import 'package:appi_ducks/page/page_lesson.dart';
import 'package:appi_ducks/read_week.dart';
import 'package:appi_ducks/user.dart';

 //The startpage  for the  app where information about the users level,
 //   which weeks the user can pick lesson from and som information about ....

class PageStart extends StatelessWidget with WidgetsBindingObserver{

  ReadWeek readweek = new ReadWeek();


  User _user;

  @override
  PageStart(
     this._user

  );


  @override
  void initState(){

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

  }


  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AppiDucks for Python'),
          // remove the back button in the AppBar
          automaticallyImplyLeading: false,
        ),
        //body: QuestionTypeA(),
        body: ListView(

          children: <Widget>[

         //  new Padding(
           //   padding: EdgeInsets.all(16.0),
        //    ),


           SizedBox(height:16.0),

            new Row(

                children: <Widget>[
                  new Container(

                    padding: EdgeInsets.only(left: 85.0, right: 100.0,top: 5.0 , bottom: 10.0),

                    child: RaisedButton(

                      //Style of the button
                        color: Theme.of(context).buttonColor,
                        shape: new CircleBorder(
                          side: BorderSide(color: Colors.lightBlue),
                        ),
                        child: Text(
                          '1',
                          style:
                          TextStyle(fontSize: 78.0, color: Colors.deepOrangeAccent),
                        ),

                        onPressed: () {
                          _user.setNumberOfCorrectAnswerToZero();
                          readweek.loadWeek(1);
                          readweek.loadWeek(2);

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>
                            new PageLesson(
                                readweek.getLesson(), _user,1)),
                          );

                        }

                    ),
                  ),
                ] ),



      new Row(

             children: <Widget>[
          new Container(

             padding: EdgeInsets.only(left: 240.0, right: 10.0,top: 50.0, bottom: 30.0),

             child: RaisedButton(

              //Style of the button
                color: Theme.of(context).buttonColor,
                shape: new CircleBorder(
                  side: BorderSide(color: Colors.lightBlue),
                ),
                child: Text(
                  '2',
                  style:
                  TextStyle(fontSize: 68.0, color: Colors.deepOrangeAccent),
                ),

                onPressed: () {
                  _user.setNumberOfCorrectAnswerToZero();
                   readweek.loadWeek(5);
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) =>
                     new PageLesson(
                         readweek.getLesson(), _user,2)),
                   );

                    }

                    ),
            ),
   ] ),

            new Row(

                children: <Widget>[
                  new Container(

                    padding: EdgeInsets.only(left: 40.0, right: 40.0,top: 40),

                    child: RaisedButton(

                      //Style of the button
                        color: Theme.of(context).buttonColor,
                        shape: new CircleBorder(
                          side: BorderSide(color: Colors.lightBlue),
                        ),
                        child: Text(
                          '3',
                          style:
                          TextStyle(fontSize: 78.0, color: Colors.deepOrangeAccent),
                        ),

                        onPressed: () {



                            _user.setNumberOfCorrectAnswerToZero();
                            //   readweek.lesson.listOfAllQuestions=null;

                            readweek.loadWeek(3);

                            readweek.loadWeek(4);
                            // When pushed navigates to the first question of the lesson for that week
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                              new PageLesson(
                                  readweek.getLesson(), _user,3)),
                            );





                        }),
                  ),



                ] ),





          ],
            ),

        );
  }


  User get user => _user;
}
