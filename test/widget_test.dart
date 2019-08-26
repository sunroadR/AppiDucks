
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.


import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';

import 'package:appi_ducks/main.dart';
import 'package:appi_ducks/question.dart';
import 'package:flutter/widgets.dart';

class MockQuestionA extends Mock implements Question{

}

void main() {


  testWidgets('Test that shows the text for question ', (WidgetTester tester) async {
    
    // Define a testkey
   final testKey = Key('qestionA');

   //Build a MaterialAppwith the test key
    await tester.pumpWidget(MaterialApp(key: testKey, home:Container()));

    // Find the MaterialApp Widget using the testKey
    expect(find.byKey(testKey), findsOneWidget);


  });


  testWidgets('Test that shows the text for all the Answer 1 alternative ', (WidgetTester tester) async {

    // Define a testkey
    final testKey = Key('qestionA');

    //Build a MaterialAppwith the test key
    await tester.pumpWidget(MaterialApp(key: testKey, home:Container()));

    // Find the MaterialApp Widget using the testKey
    expect(find.byKey(testKey), findsOneWidget);



    // Verify that all the answer is on the screen
  });

  testWidgets('Test that shows the text for all the Answer 2 alternative ', (WidgetTester tester) async {

    // Define a testkey
    final childrenWidget= Column(children: <Widget>[]);

    //Build a MaterialAppwith the test key
    await tester.pumpWidget(childrenWidget);

    // Find the MaterialApp Widget using the testKey
    expect(find.byWidget(childrenWidget), findsOneWidget);



    // Verify that all the answer is on the screen
  });




  testWidgets('Test that shows  that it is child row widget ', (WidgetTester tester) async {

    // Define a testkey
    final childrenWidget= Row( mainAxisAlignment:  MainAxisAlignment.center,);

    //Build a MaterialAppwith the test key
    await tester.pumpWidget(childrenWidget);

    // Find the MaterialApp Widget using the testKey
    expect(find.byWidget(childrenWidget), findsOneWidget);



    // Verify that all the answer is on the screen
  });



}
