/**import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:appi_ducks/question_category1.dart';
import 'package:appi_ducks/question_evaluator.dart';

class MockQuestionCategory1 extends Mock implements Question{



}
/**
void main () {

  Question question1 = new MockQuestionCategory1();
  QuestionEvaluator questionEvaluator= new QuestionEvaluator();


  test('check that checkAnswer return false when wrong is given answer', (){

    //Create a Question object
    Question question1= new MockQuestionCategory1();


    // set the givenAvwer to a wrong answer
    String givenAns=question1.getAnswer1();

    //  sjekk the answer from checkAnswer method
    bool answer= questionEvaluator.checkAnswer(question1, givenAns);

    // check that the answer is false,
   expect(answer ,isFalse);

  });


  test('check that checkAnswer return true when right is given answer', (){

    //Create a Question object
    Question question1 = new MockQuestionCategory1();
    QuestionEvaluator questionEvaluator= new QuestionEvaluator();

    // set the givenAvwer to a right answer
    String givenAns=question1.getAnswer3();

    //  sjekk the answer from checkAnswer method
    bool answer= questionEvaluator.checkAnswer(question1,givenAns);

    // check that the answer is false,
    expect(answer ,isTrue);

  });


  test('checks that the firstTimeInthisLection is true when question is created', () {

    expect(true, question1.getFirstTimeThisLesson());

  });

  test('checks that firstTimeInthisLection become false when question are answered',(){

    question1.upDatedFirstTimeThisLesson();

    expect(false, question1.getFirstTimeThisLesson());


  });



}

