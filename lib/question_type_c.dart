import 'package:flutter/material.dart';


import 'package:appi_ducks/question_category1.dart';
import 'package:appi_ducks/question_evaluator.dart';
import 'package:appi_ducks/main.dart';

class QuestionTypeC extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _QuestionTypeC();

  }


}

class _QuestionTypeC extends State<QuestionTypeC> {

  QuestionCategory1 _questionCategory1 = new QuestionCategory1();
  final QuestionEvaluator _questionEvaluator = new QuestionEvaluator();


  String _givenAnswer = '';
  String _sjekk = 'Sjekk';
  bool _isRight = false;




  @override
  Widget build(BuildContext context) {
    return new Column(
        children: <Widget>[

          new Container(

            width: 300.0,
            height: 200.0,
            margin: EdgeInsets.all(45.0),
            decoration: new BoxDecoration(
                shape: BoxShape.rectangle,

                color: Colors.indigo[50],
                border: new Border.all(
                    color: Theme
                        .of(context)
                        .primaryColor,
                    width: 1.0
                )
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[

                Text(_questionCategory1.getQuestion(),

                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16.0, color: Theme
                      .of(context)
                      .accentColor),

                ),
                MaterialButton(
                    minWidth: 14.0,
                    color: Theme
                        .of(context)
                        .buttonColor,
                    child:
                    Text(_givenAnswer),
                    onPressed: () {
                      // retrive the answer the user has typed  inn
                      // ) Text(_questionCategory1.getAnswer1());

                      setState(() {
                        //   _givenAns = _questionCategory1.getAnswer1();

                      });
                    }


                ),

              ],
            ),


          ),

          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MaterialButton(
                  minWidth: 100.0,
                  color: Theme
                      .of(context)
                      .buttonColor,
                  child: Text(_questionCategory1.getAnswer1()),
                  onPressed: () {
                    // retrive the answer the user has typed  inn
                    Text(_questionCategory1.getAnswer1());

                    setState(() {
                      _givenAnswer = _questionCategory1.getAnswer1();
                    });
                  }

              ),
              MaterialButton(
                  minWidth: 50.0,
                  color: Theme
                      .of(context)
                      .buttonColor,
                  child: Text(_questionCategory1.getAnswer2()),

                  onPressed: () {
                    setState(() {
                      _givenAnswer = _questionCategory1.getAnswer2();
                    });
                  }


              ),
              MaterialButton(
                  minWidth: 50.0,
                  color: Theme
                      .of(context)
                      .buttonColor,
                  child: Text(_questionCategory1.getAnswer3()),
                  onPressed: () {
                    // retrive the answer the user has typed  inn
                    Text(_questionCategory1.getAnswer3());

                    setState(() {
                      _givenAnswer = _questionCategory1.getAnswer3();
                    });
                  }


              ),

            ],
          ),
          new Row(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: <Widget>[
              MaterialButton(
                  minWidth: 50.0,
                  color: Theme
                      .of(context)
                      .buttonColor,
                  child: Text(_questionCategory1.getAnswer4()),
                  onPressed: () {
                    // retrive the answer the user has typed  inn
                    Text(_questionCategory1.getAnswer4());

                    setState(() {
                      _givenAnswer = _questionCategory1.getAnswer4();
                    });
                  }


              ),
              MaterialButton(
                  minWidth: 50.0,
                  color: Theme
                      .of(context)
                      .buttonColor,
                  child: Text(_questionCategory1.getAnswer5()),
                  onPressed: () {
                    Text(_questionCategory1.getAnswer5());

                    setState(() {
                      _givenAnswer = _questionCategory1.getAnswer5();
                    });
                  }


              ),
              MaterialButton(
                  minWidth: 50.0,
                  color: Theme
                      .of(context)
                      .buttonColor,
                  child: Text(_questionCategory1.getAnswer6()),
                  onPressed: () {
                    Text(_questionCategory1.getAnswer6());

                    setState(() {
                      _givenAnswer = _questionCategory1.getAnswer6();
                    });
                  }


              ),
            ],),


          new Row (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              // A button for checking the answer
              new MaterialButton(

                //style of the button
                color: Theme
                    .of(context)
                    .buttonColor,

                child: Text(_sjekk, textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0)),

                onPressed: () {
                  // retrive the answer the user has typed  inn
                  if (_sjekk == 'Sjekk') {
                    setState(() {
                      // Kaller metode i _questionElovator og evaluerer avgitt svar
                      _isRight = _questionEvaluator.checkAnswer(
                          _questionCategory1, _givenAnswer);
                      // calls the showMessage with, Gir tilbake melding
                      showMessage(_isRight, _questionCategory1);
                      // Endrer navn på button, til neste og den vil nå ta bruker til neste side
                      _sjekk = 'Neste';
                    });
                  }
                  else {
                    //Navigere til neste side
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) => MyApp()));
                  }
                },
              ),
            ],)
        ]
    );
  }

  void showMessage(bool _isRight, QuestionCategory1 question){

    // variable that holdes the feedback
    String _feedBackMessage; // if right or wrong message
    // variabl to hold the coorect answer
    String  _correctAnsToShow =question.getcorrectAns()[0].toUpperCase()+question.getcorrectAns().substring(1).toLowerCase();

    // checks if the answer is right
    if(_isRight) {
      //feedback string for correct answer
      _feedBackMessage = ' Det er Riktig ! ';
      _correctAnsToShow = ' '; // this is put to an emty string, since it is not supose to show for an correct given answer
    }
    else {
      //feedback string for  wrong Answer
      _feedBackMessage= 'Feil, riktig er :  ';





    }

    // creates a AlertDialog window
    AlertDialog message = new AlertDialog(

      // the content that will shows

      content: new RichText(
        text: new TextSpan(
            children: <TextSpan>[

              // feedback message
              new TextSpan(
                text: _feedBackMessage,
                style: new TextStyle(color: Colors.indigo[900],
                    fontSize: 20.0),
              ),
              //  The right answer
              new TextSpan(
                text: _correctAnsToShow,
                style: new TextStyle(color: Theme.of(context).primaryColor,
                  fontSize: 28.0,

                ) ,

              )
            ]
        ) ,


      ),


      actions: <Widget>[
      ],
    );

    // shows the window
    showDialog(context: context, child:  message);

  }

  void showMessageNoAnswer(){

    // variable that holdes the feedback
    String _feedBackMessage = ' Du må skrive inn svar';

    // creates a AlertDialog window
    AlertDialog message = new AlertDialog(

      // the content that will shows

      content: new RichText(
          text: new TextSpan(
              text: _feedBackMessage,
              style: new TextStyle(color: Colors.indigo[900],
                  fontSize: 20.0))
      ),

      actions: <Widget>[
        FlatButton(
            child: Text('neste',
              style: new TextStyle(color: Theme.of(context).primaryColor,
                  fontSize: 14.0
              ),),
            onPressed: () {

              Navigator.of(context).pop(new MaterialPageRoute(builder: (context)=>MyApp()));

            })

      ],
    );

    // shows the window
    showDialog(context: context, child:  message);


  }

}
