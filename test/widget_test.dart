// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.


import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';

import 'package:appi_ducks/main.dart';
import 'package:appi_ducks/question_category1.dart';

class MockQuestionA extends Mock implements QuestionCategory1{

}

void main() {


  testWidgets('Test that shows the text for question ', (WidgetTester tester) async {

    MockQuestionA questionCat1=MockQuestionA();

    when( questionCat1.getQuestion()).thenReturn("Hva er en variabele ?");

    // Build our app and trigger a frame
    await tester.pumpWidget(new MyApp());


    // Verify that question is on the screen
    expect(find.text(questionCat1.getQuestion()), findsOneWidget);


  });


  testWidgets('Test that shows the text for all the Answer alternative ', (WidgetTester tester) async {

    MockQuestionA questionCat1=MockQuestionA();


    when( questionCat1.getAnswer1()).thenReturn(" Å GI NOE EN VERDI ");
    when( questionCat1.getAnswer2()).thenReturn(" EN STATEMENT ");
    when( questionCat1.getAnswer3()).thenReturn(" ET NAVN SOM REFERERE TIL EN VERDI");
    when( questionCat1.getAnswer4()).thenReturn(" ET TALL ");


    // Build our app and trigger a frame
    await tester.pumpWidget(new MyApp());


    // Verify that all the answer is on the screen

    expect(find.text(questionCat1.getAnswer1()), findsOneWidget);
    expect(find.text(questionCat1.getAnswer2()), findsOneWidget);
    expect(find.text(questionCat1.getAnswer3()), findsOneWidget);
    expect(find.text(questionCat1.getAnswer4()), findsOneWidget);
    });

  testWidgets('Test that shows the text for all the Answer alternative ', (WidgetTester tester) async {

    MockQuestionA questionCat1=MockQuestionA();
    await tester.pumpWidget(new MyApp());




  });



}
