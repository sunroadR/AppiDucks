import 'package:flutter/material.dart';
import 'package:appi_ducks/main.dart';
import 'package:appi_ducks/page/page_start.dart';
import 'package:appi_ducks/start_lesson.dart';


// The page
class SummaryPage extends StatelessWidget {
  final String title;


  const SummaryPage({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    StartLesson startLesson= new StartLesson();
     return new MaterialApp(
       title: 'AppiDucks for  Python',
     home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('AppiDucks for  Python'),
          //remove the back button in the AppBar i
          automaticallyImplyLeading: false,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:<Widget>[

            Container(

              margin: EdgeInsets.only(top: 40.0, bottom: 20.0),

              child: Text('  Du har brukt appen  X dager på rad.\n '
              '\n'
                  'Du er nå på level Y',
                style: TextStyle(
                    fontSize: 24.0, color: Theme.of(context).accentColor),
                textAlign: TextAlign.center,
                softWrap: true,),
            ),
          Container(
          height: 125.0 ,
          width: 250.0,

          decoration : BoxDecoration(

            image: DecorationImage(
          image : ExactAssetImage('assets/picture/and1.png'),
            ),


          ),
          child: Container(

            child:  Text('Level Y',
              style: TextStyle(
                  fontSize: 24.0, color: Theme.of(context).accentColor),
              textAlign: TextAlign.center,

              softWrap: true,),
            alignment: Alignment(0.0, 0.0),
            ),
            alignment: Alignment.center,
        ),
          Container(
            child: MaterialButton
              (
                minWidth: 200.0,
                height: 50.0,

                key: Key('answerA1'),
                color: Colors.deepOrangeAccent,
                child: Text('start ny',
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: TextStyle(fontSize: 18.0)
                ),
                onPressed: () {

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PageStart()));
            }),
          )
        ]),
      ),
    );
  }
}
