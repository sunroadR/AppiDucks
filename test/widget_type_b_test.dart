
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/widgets.dart';


// Widget test for the layout of widget QuestiontypeB

void main() {
  testWidgets(' See if it is a Text widget   ', (WidgetTester tester) async {
    testWidgets(' See if it is a Text widget   ', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Text('QuestTypeB'))
      );

      expect(find.text('QuestTypeB'), findsOneWidget);
    });

    testWidgets(' See if it colomn widget   ', (WidgetTester tester) async {

    });
  });
}