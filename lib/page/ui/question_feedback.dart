import 'package:flutter/material.dart';

import 'package:appi_ducks/question.dart';

   //  A statless widget that keeps the driffent pop up message ,
   // with feedback to user off the app


class QuestionFeedback extends StatelessWidget {
 // final PageLesson pageLesson = new PageLesson();

  @override
  Widget build(BuildContext context) {
    return Card();
  }

  // Metode som gir tilbake melding om at svaret er riktig
  void showMessageRightAnswer(BuildContext context){

    String _feedbackMessage = 'Det er riktig !';

    // creates a AlertDialog window
    AlertDialog message = new AlertDialog(
      // the content that will shows

      content: new RichText(
        text: new TextSpan(children: <TextSpan>[
          // feedback message
          new TextSpan(
            text: _feedbackMessage,
            // in indigo blue
            style: new TextStyle(
                color: Theme.of(context).accentColor, fontSize: 20.0),
          ),
          //  The right answer

        ]),
      ),


    );

    // shows the window
    showDialog(context: context, child: message);
  }



  // Method that gives the user feedback
  // with an alertWindow

  void showMessageWrongAnswer(BuildContext context, Question question) {
    // variable that holdes the feedback
    String _feedbackMessage = 'Feil, riktig er :  '; // if right or wrong message
    // variabl to hold the coorect answer
    String _correctAnsToShow;

if(question.correctAns.length==0) {
   print('Inne _correctAnsToShow under her skrives riktig svar');
   print(question.correctAns);
  _correctAnsToShow =""+question.correctAns+"";
  print( _correctAnsToShow);
}
else {
  _correctAnsToShow = question.correctAns[0].toUpperCase() +
      question.correctAns.substring(1).toLowerCase();
}
    // creates a AlertDialog window
    AlertDialog message = new AlertDialog(
      // the content that will shows

      content: new RichText(
        text: new TextSpan(children: <TextSpan>[
          // feedback message
          new TextSpan(
            text: _feedbackMessage,
            // in indigo blue
            style: new TextStyle(
                color: Theme.of(context).accentColor, fontSize: 18.0),
          ),
          //  The right answer
          new TextSpan(
            text: _correctAnsToShow,
            // in deepOrangeAccent
            style: new TextStyle(
                color: Theme.of(context).primaryColor, fontSize: 20.0),
          ),
        ]),
      ),


    );

    // shows the window
    showDialog(context: context, child: message);
  }

// Metode som gir beskjed om at bruker må skrive inn et svar
  void showMessageNoAnswer(BuildContext context) {
    // variable that holdes the feedback
    String _feedBackMessage = ' Du må skrive inn svar';

    // creates a AlertDialog window
    AlertDialog message = new AlertDialog(
      // the content that will shows

      content: new RichText(
          text: new TextSpan(
              text: _feedBackMessage,
              style: new TextStyle(color: Colors.indigo[900], fontSize: 20.0))),


    );

    // shows the window
    showDialog(context: context, child: message);
  }
}
