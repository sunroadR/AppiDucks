import 'package:flutter/material.dart';
import 'package:appi_ducks/page/page_start.dart';
import 'package:appi_ducks/user.dart';

void main() {

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

  static User _user = new User();
  PageStart pageStart = new PageStart(_user);




  @override
  Widget build(BuildContext context) {
    return pageStart;
  }


}
