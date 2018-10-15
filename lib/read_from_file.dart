import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'package:appi_ducks/question_category1.dart';
import 'package:appi_ducks/database/database_helper.dart';
import 'package:path/path.dart' as p;

class ReadFromFile {


  void read() {

    var context = new p.Context();
    final File file = new File('res/questionweekone.txt');


   // Stream<List<int>> inpurStream = file.openRead();
    var lines = file.readAsStringSync();
    var var1=lines[0];
    print(var1);
  }

}




