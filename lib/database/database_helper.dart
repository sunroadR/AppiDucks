import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:appi_ducks/database/model/question.dart';
import 'package:appi_ducks/matte_uke1.dart';
import 'package:appi_ducks/database/model/user';
class DataBaseHelper {

  static final DataBaseHelper _instance = new DataBaseHelper.internal();

  int mathId=20;
  MatteUke1 matteUke1= new MatteUke1();

  factory DataBaseHelper() => _instance;
  static Database _db;

// returns the  database
  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDB();
    return _db;
  }

  DataBaseHelper.internal();

// creates the database
  initDB() async {
    io.Directory directory =
    await getApplicationDocumentsDirectory(); // io.directory (?) for å lagre
    String path = join(directory.path,
        "appiDucks.db"); // android directory for (?) for å lagre
    await deleteDatabase(path);
    var theDB = await openDatabase(path, version: 5, onCreate: _onCreate);
   // await deleteDatabase(path); // denne legger jeg til for å prøve slette data besen
    return theDB;
  }

  // Creates the table with the questions for a lesson
  void _onCreate(Database db, int version) async {
    // crates the table for week 1 questions
    await db.execute(
        "CREATE TABLE Question(id INTEGER PRIMARY KEY, nr TEXT, question TEXT,answer1 TEXT, answer2 TEXT,answer3 TEXT,"
        'answer4 TEXT,answer5 TEXT,answer6 TEXT, correctAns TEXT, pageWidget TEXT)');

    await db.execute(
         "CREATE TABLE USER(id INTEGER PRIMARY KEY, level INTEGER, daysInRow INTEGER)"
    );

    print("Created tables");
  }

// Get a question for the weeksQuestions
  Future<Question> getQuestions(int i) async {

    var dbQuestions = await db;

    if(i==mathId){
      Question question= await matteUke1.division1();
      print('riktig svar');
      print(question.correctAns);
      return question;
    }

    else {
      List<Map> result = await dbQuestions.rawQuery('SELECT * FROM question');
      Question oneQuestion = new Question(
          result[i]["nr"],
          result[i]["question"],
          result[i]["answer1"],
          result[i]["answer2"],
          result[i]["answer3"],
          result[i]["answer4"],
          result[i]["answer5"],
          result[i]["answer6"],
          result[i]["correctAns"],
          result[i]["pageWidget"]);

      return oneQuestion;
    }
  }




  // Gets a question , put the information stored in the question in the table
  void saveQuestion(Question q) async {
    var dbQuestion = await db;
    await dbQuestion.transaction((txn) async {
      return await txn.rawInsert(
          'INSERT INTO Question(nr,question,answer1,answer2,answer3,answer4,answer5,answer6,correctAns,pageWidget) VALUES(?,?,?,?,?,?,?,?,?,?)',
          [
            q.uniqId,
            q.question,
            q.answer1,
            q.answer2,
            q.answer3,
            q.answer4,
            q.answer5,
            q.answer6,
            q.correctAns,
            q.pageWidget
          ]);
    });
  }
/**
  //gets the user, and puts the information in the table
  void saveUser(User user) async {
    var dbUser = await db;
    await dbUser.transaction((txn) async{
      return await txn.rawInsert(
          'INSERT INTO USER(level,daysInRow) VALUES(?,?)',
          [
            user.level,
            user.daysInRow
          ]);
    });
  }

  // Get the user from the table
  Future<User> getUser(int i) async{

    var dbUser = await db;


    List<Map> result = await dbUser.rawQuery('SELECT * FROM user');
    if(result.length == 0)return null;
    User user = new User(
        result[i]['level'],
        result[i]['daysInRow']
    );
    print(user.daysInRow);
    print(user.level);
    return user;
  }
    */

}
