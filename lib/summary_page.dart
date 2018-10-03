import 'package:flutter/material.dart';
import 'package:appi_ducks/main.dart';

class SummaryPage extends StatelessWidget {

  final String title;

  const SummaryPage({
    Key key,
    this.title,

  }) : super(key : key);


  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
        //title: 'AppiDucks for  Python',
          home: Scaffold(

        appBar:AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('AppiDucks for  Python'),
    //remove the back button in the AppBar i
    automaticallyImplyLeading: false,
    ),

            


)

    );
    }



}