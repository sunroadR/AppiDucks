import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:appi_ducks/question_category1.dart';

class DBHelper {

  static Database _db;
  
  Future<Database> get db async {
     if(_db != null)
        return _db;
     _db =await initDB();
     return _db;
  }

  initDB() async  {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path,"appiDucks.db");
    var theDB = await openDatabase(path,version:1, onCreate: _onCreate );
    return theDB;
  }

  void _onCreate(Database db, int version)async {
    // crates the table for week 1 questions
    await db.execute(
  "CREATE TABLE weekQuestions(id INTEGER PRIMARY KEY, nr TEXT, question TEXT, answar2 TEXT,answar3 TEXT,"
      "answar4 TEXT,answar5 TEXT,answar6 TEXT, pageWidget TEXT, correctAns TEXT)");
    print("Created tabls");

  }
  /**
// Get a question from the weeksQuestions
Future<QuestionCategory1>  getQuestion(int i) async {
    
    var dbQuestions =await db;
    List<Map> list = await dbQuestions.rawQuery('SELECT * FROM wweekQuestions');

  var questionCategory1= new QuestionCategory1(list[i]["id"],list[i]["question"],list[i]["answer1"],
                                list[i]["answer2"], list[i]["answer3"], list[i]["answer4"],list[i]["answer5"],list[i]["answer6"],
        list[i]["pageWidget"],list[i]["correctAns"]);

   return questionCategory1;

  }

  // reads the questions from a text file save weekQuetsionTable
void saveQuestion(QuestionCategory1 q) async{
    var dbQuestion = await db;
    await dbQuestion.transaction((txn) async {
      return await txn.rawInsert("INSERT INTO weekQuestion(id,question,answar1"
          ' answar2,answar3,answar4,answar5,answar6,pageWidget,correctAns) VALUES(' +
          '\'' +
          q.id.toString() +
          '\'' +
          ',' +
          '\'' +
          q.question +
          '\''+
          ')');



};

// ignore: expected_token
}*/
}