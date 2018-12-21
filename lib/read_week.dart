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

      try {
          cod.decode(weekQues, reviver:(k,v){
            if(isQuestion(k))
              db.saveQuestion(Question.fromString(v));
          });
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