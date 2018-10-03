import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  testWidgets('Test if title is ,AppiDucks for Python', (WidgetTester tester) async {

    await tester.pumpWidget(SymmaryPage(title:'AppiDucks for Python'));



  }
  );

}