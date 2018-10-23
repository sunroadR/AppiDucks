import 'package:flutter/material.dart';

import 'package:appi_ducks/main.dart';

import 'package:appi_ducks/info_lesson.dart';

class LessonFeedBack extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    return Card(margin:  EdgeInsets.fromLTRB(17.0, 500.0, 17.0, 25.0),);
  }


  // Shows message for 3 på rad
    void showMessageThreeInRow(BuildContext context){

    String _threeInRow = 'Tre rette på rad! Hardt arbeid lønner seg';

    // creates a AlertDialog window
    AlertDialog message = new AlertDialog(

      // the content that will shows
      content: DecoratedBox(


          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: const Alignment(-0.5, -0.6),
              radius: 0.1,
              colors: <Color>[
                const Color(0xFFEEEEE3),
                const Color(0xFf16183),
              ],
              stops: <double>[0.9, 1.0],
            ),
          ),
        child:new RichText(
          text: new TextSpan(children: <TextSpan>[
            // feedback message
            new TextSpan(
              text: _threeInRow,
              // in indigo blue
              style: new TextStyle(
                color: Theme.of(context).accentColor, fontSize: 25.0,
                decorationColor: Colors.lightBlue,


              ),

            ),
            //  The right answer

          ]),
        ),
    ), );




    // shows the window
    showDialog(context: context, child: message);
    }


  // Shows message for 5 på rad
  void showMessageFiveInRow(BuildContext context){

    String _threeInRow = 'Fem på rad ! Nå begynner du å bli en mester i dette ';
    AlertDialog message = new AlertDialog(

   content: DecoratedBox(


      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: const Alignment(-0.5, -0.6),
          radius: 0.1,
          colors: <Color>[
            const Color(0xFFEEEEE3),
            const Color(0xFf16183),
          ],
          stops: <double>[0.9, 1.0],
        ),
      ),

      child:new RichText(
        text: new TextSpan(children: <TextSpan>[
          // feedback message
          new TextSpan(
            text: _threeInRow,
            // in indigo blue
            style: new TextStyle(
              color: Theme.of(context).accentColor, fontSize: 25.0,
              decorationColor: Colors.lightBlue,


            ),

          ),
          //  The right answer

        ]),
      ),
    ),);
 EdgeInsets.fromLTRB(25.0, 500.0, 25.0, 20.0);

    // shows the window
    showDialog(context: context, child: message);
  }




    }



