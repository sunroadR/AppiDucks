import 'package:flutter/material.dart';

import './question_type_a.dart';
import './question_type_b.dart';
import './question_type_c.dart';

import './question_evaluator.dart';

void main() => runApp(new MyApp());

// This widget is the root the application.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepOrangeAccent,
        accentColor: Colors.indigo[900],
        buttonColor: Colors.indigo[100],

      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('AppiDucks for Python'),
        ),
        body: QuestionTypeC(),
        //QuestionTypeA(),

      ) ,

    );


  }


}
