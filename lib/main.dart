import 'package:flutter/material.dart';


import 'package:appi_ducks/page_start.dart';

//
void main() => runApp(
    //MaterielApp is top level widget
    MaterialApp(
      // Define the color through the app
  theme: ThemeData(
    primaryColor: Colors.deepOrangeAccent,
    accentColor: Colors.indigo[900],
    buttonColor: Colors.indigo[100],
  ),
  home: MyApp(),));

// This widget is the root the application.
class MyApp extends StatelessWidget {

  PageStart pageStart = new PageStart();

  @override
  Widget build(BuildContext context) {
    return pageStart;
  }
}