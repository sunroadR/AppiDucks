/**import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'package:appi_ducks/lesson.dart';


void main () {


  test('When lesson start, correctAnsInRow ==0', ()
  {
    Lesson infoLesson = new Lesson();

    expect( infoLesson.getCorrectAnsInRow(),0);
  });


  test('When call addCorrectInRow, it increment with one ', ()
  {
    Lesson infoLesson= new Lesson();

   infoLesson.addCorrectAnsInRow();

    expect(infoLesson.getCorrectAnsInRow(),1);
  });

  test('When call correctAnsInRowZero, correctAnsInRow  ', (){

    Lesson infoLesson = new Lesson();
    for(int i= 0; i<12; i++){
    //  infoLesson.addCorrectAnsInRow(Build Conte); Må finne ut av context
    }
    expect(infoLesson.getCorrectAnsInRow(), 12);

  });



}*/