import'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:appi_ducks/database/model/question.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:appi_ducks/database/database_helper.dart';

/**
class that take an csv-fil with all the question for a week and
read them and put them in the Question table for that week in the database
 */

class ReadWeek{

  DataBaseHelper db = new DataBaseHelper();



  void  loadWeek(int weekNr){

    JsonCodec cod = new JsonCodec();

    loadAssets('assets/week2.csv').then((dynamic output) {
      String weekQues = output;



      try {
        Map<String, dynamic> decoded = cod.decode(weekQues);

        for(int a=1; a<33  ; a++) {
          String uniq = '${decoded['uniqID$a']}';
          String ques = '${decoded['que$a']}';
          String ans1 = '${decoded['ans1$a']}';
          String ans2 = '${decoded['ans2$a']}';
          String ans3 = '${decoded['ans3$a']}';
          String ans4 = '${decoded['ans4$a']}';
          String ans5 = '${decoded['ans5$a']}';
          String ans6 = '${decoded['ans6$a']}';
          String corrAns = '${decoded['correctAns$a']}';
          String pageType = '${decoded['pageType$a']}';


          db.saveQuestion(new Question(uniq,ques,ans1,ans2,ans3,ans4,ans5,ans6,corrAns,pageType));


        }

      } catch (e) {
        print('Error : $e');
      }

    });

  }

  Future<String> loadAssets(String path) async{

    return await rootBundle.loadString(path);

  }



}