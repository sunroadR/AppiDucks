import 'package:appi_ducks/database/database_helper.dart';
import 'package:appi_ducks/database/model/question.dart';
//import 'package:appi_ducks/helpefile.dart';
import 'dart:async';

abstract class LessonContract {
  void screenUpdate();
}

/*
* The class holds the information about the lesson through the session
 */

class Lesson {
  LessonContract _view;

  DataBaseHelper dbHelper = new DataBaseHelper();

  Lesson(this._view);

  Future<Question> getQuestion(int t) {
    return dbHelper.getQuestions(t);
  }

  updateScreen() {
    _view.screenUpdate();
  }
// The question shown on the screen

}
