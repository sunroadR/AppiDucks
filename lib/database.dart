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
  //  await deleteDatabase(path);
    var theDB = await openDatabase(path,version:1, onCreate: _onCreate );
    return theDB;
  }

  void _onCreate(Database db, int version)async {
    // crates the table for week 1 questions
    await db.execute(
  "CREATE TABLE weekQuestions(id INTEGER PRIMARY KEY, nr TEXT, question TEXT,answer1 TEXT, answer2 TEXT,answer3 TEXT,"
      "answer4 TEXT,answer5 TEXT,answer6 TEXT, pageWidget TEXT, correctAns TEXT)");
    print("Created tabls");

  }

// Get a question from the weeksQuestions
Future<List>  getQuestions() async {
    
    var dbQuestions =await db;
    List<Map> result = await dbQuestions.rawQuery('SELECT * FROM weekQuestions');

  List<QuestionCategory1> weekQuestion = new List();
      for(int i=0; i<result.length; i++) {
        weekQuestion.add(new QuestionCategory1(result[i]["id"], result[i]["question"],result[i]["answer1"], result[i]["answer2"],
            result[i]["answer3"], result[i]["answer4"],result[i]["answer5"],result[i]["answer6"],
       result[i]["pageWidget"],result[i]["correctAns"]));
        }


    print(weekQuestion.length);
      print('KOMMER JEG HIT');
   return weekQuestion;

  }

 //  reads the questions from a text file save weekQuetsionTable
void saveQuestion(QuestionCategory1 q) async{

  print('Er jeg her da ?');
    var dbQuestion = await db;
    await dbQuestion.transaction((txn) async {
      return await txn.rawInsert('INSERT INTO weekQuestions(nr,question,answer1,answer2,answer3,answer4,answer5,answer6,pageWidget,correctAns) VALUES(?,?,?,?,?,?,?,?,?,?)',
          [q.getId().toString(),q.getQuestion(),q.getAnswer1(),q.getAnswer2(),
    q.getAnswer3(),q.getAnswer4(),q.getAnswer5(),q.getAnswer6(),q.getPageView(),
    q.getcorrectAns()]);
    });


}

// ignore: expected_token
}
