import 'package:flutter/material.dart';
import 'package:appi_ducks/page/page_start.dart';
import 'package:appi_ducks/user.dart';
import 'package:flutter/services.dart';

// The page
class SummaryPage extends StatelessWidget {


  // final String title;
   int _totalCorrect;
  int _weekNr;
  User _user;


  bool isbackButtonActivated = false;

  //SummaryPage(int weekNr, User user, int numberOfCorrectAnswerThisLesson);

  SummaryPage (

          this._weekNr,
          this._user,
          this._totalCorrect
      );







  @override
  Widget build(BuildContext context) {

    //
    return new WillPopScope(
        onWillPop: () => Future.value(false),
     child: MaterialApp(
       title: 'AppiDucks for  Python',
     home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('AppiDucks for  Python'),
          //remove the back button in the AppBar i
          automaticallyImplyLeading: false,
        ),
        body: ListView(



          children:<Widget>[


             new Align(

            child: Container(

              margin: EdgeInsets.only(top: 10.0, bottom: 50.0),

              child: Text('  Du klarte ' +_totalCorrect.toString()+' riktige.\n'
              '\n'
                ,
                style: TextStyle(
                    fontSize: 24.0, color: Theme.of(context).accentColor),
                textAlign: TextAlign.center,
                softWrap: true,),

     )

            ),

             new Container(
        height: 125.0 ,
          width: 250.0,
          decoration : BoxDecoration(

           image: DecorationImage(
          image : ExactAssetImage('assets/picture/and1.png'),
            ),

   ),
            child: Container(
            child:  Text(''+_weekNr.toString()+'',
              style: TextStyle(

                  fontSize: 24.0, color: Theme.of(context).accentColor),
              textAlign: TextAlign.center,

              softWrap: true,),




           alignment: Alignment( 0.0, 0.0),
    ),
        alignment: Alignment.center,
    ),

      Padding(
          padding:EdgeInsets.only(bottom: 60.0,top: 40.0,left:20.0, right:40.0 ),
          // padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Material(
            color: Colors.deepOrangeAccent,
            shape: RoundedRectangleBorder(side: BorderSide(color: Colors.blueGrey,width: 1.0),
                borderRadius: BorderRadius.circular(12.0)),
            // borderRadius:BorderRadius.circular(100.0) ,
            shadowColor: Colors.lightBlueAccent.shade100,
            child: MaterialButton(


                key: Key('answerA1'),
                color: Colors.deepOrangeAccent,
                child: Text('start ny',
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: TextStyle(fontSize: 18.0)
                ),
                onPressed: () {



             _user.setNumberOfCorrectAnswerToZero();

              Navigator.pop(context);
            Navigator.pop(context);

            Navigator.push(context, MaterialPageRoute(builder: (context) => PageStart(_user)));


        // SystemChannels.platform.invokeMethod('SystemNavigator.pop');



        //     Navigator.push(context, MaterialPageRoute(builder: (context) => PageStart(_user)));


                }),
          )),

    ]),
    ),
     ),
      );



  }
}
