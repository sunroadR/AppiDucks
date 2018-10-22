import 'package:flutter/material.dart';

import 'package:appi_ducks/main.dart';

import 'package:appi_ducks/info_lesson.dart';

class LessonFeedBack extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    return Card();
  }


  // Shows message for 3 på rad
    void showMessageThreeInRow(BuildContext context){

    String _threeInRow = 'Tre rette på rad! Hardt arbeid lønner seg';

    // creates a AlertDialog window
    AlertDialog message = new AlertDialog(
      contentPadding:  EdgeInsets.fromLTRB(12.0, 12.0, 34.0, 23.0),
      // the content that will shows

      content: new RichText(
        text: new TextSpan(children: <TextSpan>[
          // feedback message
          new TextSpan(
            text: _threeInRow,
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


  // Shows message for 5 på rad
  void showMessageFiveInRow(BuildContext context){

    String _threeInRow = 'Fem på rad ! Nå begynner du å bli en mester i dette ';

    // creates a AlertDialog window
    AlertDialog message = new AlertDialog(
      contentPadding:  EdgeInsets.fromLTRB(12.0, 12.0, 34.0, 23.0),
      // the content that will shows

      content: new RichText(
        text: new TextSpan(children: <TextSpan>[
          // feedback message
          new TextSpan(
            text: _threeInRow,
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




    }



