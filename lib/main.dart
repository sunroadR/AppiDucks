import 'package:flutter/material.dart';

import 'package:appi_ducks/page/page_start.dart';
import 'package:appi_ducks/read_week.dart';

void main() {

// oppretter et object av klassen readweek
  ReadWeek readweek = new ReadWeek();

  // kaller metode for lese fra uken fra fil ,
  readweek.loadWeek(1);


runApp(


        //MaterielApp is top level widget
        MaterialApp(
      // Define the color through the app
      theme: ThemeData(
        primaryColor: Colors.deepOrangeAccent,
        accentColor: Colors.indigo[900],
        buttonColor: Colors.indigo[100],
      ),
      home: MyApp(),
    ));
}
// This widget is the root the application.
class MyApp extends StatelessWidget {
//  MyApp({Key key, @required this.readFromFile}) :super(key :key);

  PageStart pageStart = new PageStart();

  @override
  Widget build(BuildContext context) {
    // readFromFile.read();
    return pageStart;
  }
}
