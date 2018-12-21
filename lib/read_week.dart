import'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:appi_ducks/database/model/question.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:appi_ducks/database/database_helper.dart';




//class that take an csv-fil with all the question for a week and
//read them and put them in the Question table for that week in the database

class ReadWeek{

  DataBaseHelper db = new DataBaseHelper();



  void  loadWeek(int weekNr){



    JsonCodec cod = new JsonCodec();

    loadAssets('assets/week2.csv').then((dynamic output) {
      String weekQues = output;
      //List<String> weekQues = output.split("\n");
      //weekQues.removeWhere((s) => !s.contains("uniqID"));

      try {
        //for(String question in weekQues) {
          Map<Question, dynamic> decoded = cod.decode(weekQues, reviver:(k,v){
            if(isQuestion(k))
              return new Question.fromString(v);
            return v;
          });
          print(decoded);
          /*
          String uniq = '${decoded['uniqID']}';
          String ques = '${decoded['que']}';
          String ans1 = '${decoded['ans']}';
          String ans2 = '${decoded['ans']}';
          String ans3 = '${decoded['ans']}';
          String ans4 = '${decoded['ans']}';
          String ans5 = '${decoded['ans']}';
          String ans6 = '${decoded['ans']}';
          String corrAns = '${decoded['correctAns']}';
          String pageType = '${decoded['pageType']}';

          print("read from file: " + uniq + ques + ans1 + ans2 + ans3 + ans4 +
              ans5 + ans6 + corrAns + pageType);
          db.saveQuestion(new Question(
              uniq,
              ques,
              ans1,
              ans2,
              ans3,
              ans4,
              ans5,
              ans6,
              corrAns,
              pageType));*/
      //  }
      } catch (e) {
        print('Error : $e');
      }

    });

  }

  bool isQuestion(Object k) => k.toString().split(".").length == 3;

  Future<String> loadAssets(String path) async{

    return await rootBundle.loadString(path);

  }



}