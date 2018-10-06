import 'package:test/test.dart';
import "dart:io";
import 'package:flutter/material.dart';
//import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:appi_ducks/lesson.dart';
import 'package:appi_ducks/question_category1.dart';
import 'package:appi_ducks/question_list.dart';


//class MockLesson extends Mock implements Lesson{



//}

//class MockQuestionCategory extends Mock implements QuestionCategory1{


//}//
void main () {



  test('Checks that list is emty when created ', (){

    QustionList oneList = new QustionList();
    var size =oneList.getListCounter();

     expect(oneList.getLength(),equals(4));




  });


}



