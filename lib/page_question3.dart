import 'package:flutter/material.dart';

import 'package:appi_ducks/question_type_b.dart';
import 'package:appi_ducks/question_type_a.dart';
import 'package:appi_ducks/question_type_c.dart';
import 'package:appi_ducks/main.dart';

class PageQuestion3 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _PageQuestion3();

  }


}

class _PageQuestion3 extends State<PageQuestion3> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('AppiDucks for  Python'),
         // remove the back button in the AppBar i
        automaticallyImplyLeading: false,

      ),

      body: QuestionTypeC(),


    );
  }
}