import 'package:flutter/material.dart';

import 'package:appi_ducks/main.dart';

import 'package:appi_ducks/page/page_lesson.dart';
import 'package:appi_ducks/database/model/question.dart';
/**
 *    A statless widget that keeps the driffent pop up message ,
 *    with feedback to user off the app
 */

class QuestionFeedback extends StatelessWidget {
  final PageLesson pageLesson = new PageLesson();

  @override
  Widget build(BuildContext context) {
    return Card();
  }

  // Method that gives the user feedback
  // with an alertWindow

  void showMessage(BuildContext context, bool _isRight, Question question) {
    // variable that holdes the feedback
    String _feedBackMessage; // if right or wrong message
    // variabl to hold the coorect answer
    
    print(question.question);
    String _correctAnsToShow = question.correctAns[0].toUpperCase() +
        question.correctAns.substring(1).toLowerCase();

    // checks if the answer is right
    if (_isRight) {
      //feedback string for correct answer
      _feedBackMessage = ' Det er Riktig ! ';
      _correctAnsToShow =
          ' '; // this is put to an empty string, since it is not supose to
      // show for an correct given answer
    } else {
      //feedback string for  wrong Answer
      _feedBackMessage = 'Feil, riktig er :  ';
    }

    // creates a AlertDialog window
    AlertDialog message = new AlertDialog(
      // the content that will shows

      content: new RichText(
        text: new TextSpan(children: <TextSpan>[
          // feedback message
          new TextSpan(
            text: _feedBackMessage,
            // in indigo blue
            style: new TextStyle(
                color: Theme.of(context).accentColor, fontSize: 20.0),
          ),
          //  The right answer
          new TextSpan(
            text: _correctAnsToShow,
            // in deepOrangeAccent
            style: new TextStyle(
                color: Theme.of(context).primaryColor, fontSize: 28.0),
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
