import 'package:flutter_test/flutter_test.dart';
import 'package:appi_ducks/page/summary_page.dart';


void main(){

  testWidgets('Test if title is ,AppiDucks for Python', (WidgetTester tester) async {

    await tester.pumpWidget(SummaryPage(title: 'AppiDucks for  Python'));
    final titleFinder = find.text('AppiDucks for  Python');

    expect(titleFinder, findsOneWidget);



  }
  );

}