
import 'dart:async';
import 'dart:convert';
import 'package:appi_ducks/question.dart';
import 'package:flutter/services.dart';
import 'package:appi_ducks/lesson.dart';




//class that take an csv-file with all the questions for a week and
//read them and put them in the Question table for that week in the database

class ReadWeek {




// List<Question> listOfAllQuestion = [];
 Lesson lesson = new Lesson();

 Question question;

  void loadWeek(int weekNr) {



    JsonCodec cod = new JsonCodec();

   loadAssets('assets/weektest$weekNr.que').then((dynamic output) {

      String weekQues = output;

      try {
        cod.decode(weekQues, reviver: (k, v) {
          if (isQuestion(k)) {
            lesson.createQuestion(Question.fromString(v));

          }
        });
      } catch (e) {

        print('Error : $e');
      }
    });
    lesson.setWeekNr(weekNr);
  }

  // Sjekker at Question hae uniqID, på formen X.Y.Z
  bool isQuestion(Object k) =>
      k.toString().split(".").length == 3;

  Future<String> loadAssets(String path) async {
    return await rootBundle.loadString(path);
  }

  Lesson getLesson(){
    return lesson;
  }


}