import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'package:appi_ducks/info_lesson.dart';


void main () {


  test('When lesson start, correctAnsInRow ==0', ()
  {
    InfoLesson infoLesson = new InfoLesson();

    expect( infoLesson.getCorrectAnsInRow(),0);
  });


  test('When call addCorrectInRow, it increment with one ', ()
  {
    InfoLesson infoLesson= new InfoLesson();

   // infoLesson.addCorrectAnsInRow();

    expect(infoLesson.getCorrectAnsInRow(),1);
  });

  test('When call correctAnsInRowZero, correctAnsInRow  ', (){

    InfoLesson infoLesson = new InfoLesson();
    for(int i= 0; i<12; i++){
    //  infoLesson.addCorrectAnsInRow(Build Conte); Må finne ut av context
    }
    expect(infoLesson.getCorrectAnsInRow(), 12);

  });



}