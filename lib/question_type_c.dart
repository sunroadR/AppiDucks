import 'package:flutter/material.dart';
import 'package:appi_ducks/question_category1.dart';


class QuestionTypeC extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _QuestionTypeC();

  }


}

class _QuestionTypeC extends State<QuestionTypeC>{

  QuestionCategory1 _questionCategory1 = new QuestionCategory1();
  String _givenAns='';


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

      child: Row (
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[

        Text(_questionCategory1.getQuestion(),

    textAlign: TextAlign.left,
      style: TextStyle(fontSize: 16.0, color: Theme.of(context).accentColor),

    ),
        MaterialButton(
          minWidth: 14.0,
          color: Theme.of(context).buttonColor,
          child:
          Text( _givenAns),
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
       minWidth:100.0,
       color: Theme.of(context).buttonColor,
    child:  Text(_questionCategory1.getAnswer1()),
         onPressed: () {
           // retrive the answer the user has typed  inn
           Text(_questionCategory1.getAnswer1());

           setState(() {
             _givenAns = _questionCategory1.getAnswer1();

           });
         }

     ),
     MaterialButton(
       minWidth: 50.0,
       color: Theme.of(context).buttonColor,
         child:   Text(_questionCategory1.getAnswer2()),

         onPressed: () {



           setState(() {
             _givenAns = _questionCategory1.getAnswer2();

           });
         }



     ),
     MaterialButton(
       minWidth: 50.0,
       color: Theme.of(context).buttonColor,
         onPressed: () {
           // retrive the answer the user has typed  inn
           Text(_questionCategory1.getAnswer3());

           setState(() {
             _givenAns = _questionCategory1.getAnswer3();

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
                color: Theme.of(context).buttonColor,
                  onPressed: () {
                    // retrive the answer the user has typed  inn
                    Text(_questionCategory1.getAnswer4());

                    setState(() {
                      _givenAns = _questionCategory1.getAnswer4();

                    });
                  }



              ),
              MaterialButton(
                minWidth: 50.0,
                color: Theme.of(context).buttonColor,
                  onPressed: () {
                    // retrive the answer the user has typed  inn
                  //  Text(_questionCategory1.getAnswer5());

                    setState(() {
                //      _givenAns = _questionCategory1.getAnswer5();

                    });
                  }



              ),
              MaterialButton(
                minWidth: 50.0,
                color: Theme.of(context).buttonColor,
                  onPressed: () {
                    // retrive the answer the user has typed  inn
                  //  Text(_questionCategory1.getAnswer1());

                    setState(() {
                   //   _givenAns = _questionCategory1.getAnswer1();

                    });
                  }



              ),

            ],
          )
    ],
    );
  }


}