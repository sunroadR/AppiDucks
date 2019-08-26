import 'package:flutter/material.dart';



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

  // Shows message for 10 på rad
  void showMessageTenInRow(BuildContext context){

    String _threeInRow = 'Ti rette på rad! Imponerende ! ';
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


  // Shows message for 12 på rad
  void showMessageTwelveInRow(BuildContext context){

    String _threeInRow = 'Tolv rette på rad! Enda mer imponerende ! ';
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








// Metode som gir beskjed om at bruker må skrive inn et svar
  void showMessageNotAnswered(BuildContext context) {
    // variable that holdes the feedback
    String _feedBackMessage = ' Du må besvare spørsmål før du kan gå til neste ';

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



