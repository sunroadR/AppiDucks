import 'package:flutter/material.dart';

import 'package:appi_ducks/question_category1.dart';
import 'package:appi_ducks/question_evaluator.dart';
import 'package:appi_ducks/page_question3.dart';


class QuestionTypeB extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuestionTypeB();
  }



}
// A corresponding State class. This class holds the data related to layout
// of question of type B
//
class _QuestionTypeB extends State<StatefulWidget>{

  QuestionCategory1 _questionCategory1 = new QuestionCategory1();
  QuestionEvaluator _questionEvaluator =new QuestionEvaluator();

  String sjekk ='Sjekk';
  String _givenAnswer;
  bool _isRight;

  // Create a text controller. That is used to retrieve  the current answer
  // of the textfield
  final _ansController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _ansController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[

          new Text(

              _questionCategory1.getQuestion(),
              key: Key('QuestionTypeB'),
              style: TextStyle(fontSize: 24.0,
              color: Theme
                  .of(context)
                  .accentColor),
              textAlign: TextAlign.center),

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
            child: new TextField(
              textAlign: TextAlign.center,
              controller: _ansController,
              decoration: new InputDecoration(
                hintText: 'Tast inn svaret',
                hintStyle: TextStyle(color: Theme.of(context).accentColor),
                border: InputBorder.none,
              ),
            ),
          ),
          new Row (
            mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

              // A button for checking the answer
                 new MaterialButton(

                 //style of the button
                 color: Theme
                    .of(context)
                    .buttonColor,

                   child: Text( sjekk , textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0)),

                onPressed: () {

                  // retrive the answer the user has typed  inn
                  if(sjekk=='Sjekk'){
                  setState(() {
                    _givenAnswer = _ansController.text.toString();

                    // sjekker at det er tastet inn et svar
                    if(_givenAnswer.length==0)
                      {
                        // Gir beskjed om at de må skrive inn et svar
                      showMessageNoAnswer();

                      }

                   else {
                      // Kaller metode i _questionElovator og evaluerer avgitt svar
                        _isRight = _questionEvaluator.checkAnswer(
                        _questionCategory1, _givenAnswer);
                    // calls the showMessage with, Gir tilbake melding
                     showMessage(_isRight, _questionCategory1);
                    // Endrer navn på button, til neste og den vil nå ta bruker til neste side
                    sjekk= 'Neste';
                  }});}
                  else{
                    //Navigere til neste side
                   Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> PageQuestion3()));


                  }




                },


              ),
            ],),


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

                Navigator.of(context).pop(new MaterialPageRoute(builder: (context)=>PageQuestion3()));

              })

        ],
      );

      // shows the window
      showDialog(context: context, child:  message);


    }



}