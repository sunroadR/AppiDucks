class User {



  int _number_Of_Correct_Answer_This_Lesson;

  user(){
    _number_Of_Correct_Answer_This_Lesson=0;
  }


  int get numberOfCorrectAnswerThisLesson => _number_Of_Correct_Answer_This_Lesson;


  void addNumberOfCorrectAnswer() {
    _number_Of_Correct_Answer_This_Lesson += 1;
  }

  void setNumberOfCorrectAnswerToZero() {
    _number_Of_Correct_Answer_This_Lesson = 0;
  }


  }


