import 'package:flutter/material.dart';

import 'package:appi_ducks/question_type_a.dart';
import 'package:appi_ducks/question_type_c.dart';
import 'package:appi_ducks/main.dart';
import 'package:appi_ducks/question_category1.dart';

class PageLesson extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _PageLesson();

  }


}


class _PageLesson extends State<PageLesson> {


QuestionCategory1 question = new QuestionCategory1();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('AppiDucks for  Python'),
        //remove the back button in the AppBar i
        automaticallyImplyLeading: false,
      ),

    body: getQuestion().getPage(),



   );
  }

  void setQuestion(QuestionCategory1 q){

    question =q;
  }

  QuestionCategory1 getQuestion(){
    return question;
  }

}