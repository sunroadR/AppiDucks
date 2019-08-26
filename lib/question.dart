import 'dart:math';

import 'package:flutter/material.dart';
import 'package:appi_ducks/lesson.dart';
import 'package:appi_ducks/user.dart';

class Question {
  String _uniqId;
  String _question;
  String _answer1;
  String _answer2;
  String _answer3;
  String _answer4;
  String _answer5;
  String _answer6;
  String _correctAns;
  String _firstTime;
  String _pageWidget;

  Question (this._uniqId,
      this._question,
      this._answer1,
      this._answer2,
      this._answer3,
      this._answer4,
      this._answer5,
      this._answer6,
      this._correctAns,
      this._pageWidget,
      this._firstTime);

  Random enRandom = new Random();

  String get uniqId => _uniqId;

  String get question => _question;

  String get answer1 => _answer1;

  String get answer2 => _answer2;

  String get answer3 => _answer3;

  String get answer4 => _answer4;

  String get answer5 => _answer5;

  String get answer6 => _answer6;

  String get pageWidget => _pageWidget;

  String get correctAns => _correctAns;

  String get firstTime => _firstTime;

// Method that update the question
  setQuestion (String newQuestion) {
    this._question = newQuestion;
  }

// Method that update the correctAnswer
  setCorrectAnswer (String newCorrectAnswer) {

    this._correctAns = newCorrectAnswer;
  }

// Metode som lager setter nytt oppdaterer de 6 ulike svaralternativende

  void setFirstTime () {
    this._firstTime = 'false';
  }

  /// takes a parameter on the form
  /// "uniqID:X.Y.Z pageType:<question type> que:<question text> [correctAns:<answer text>]? [ans: <alternative answers>]*"
  ///
  /// example argument "uniqID:1.2.8 pageType:questionTypeC que:% correctAns: ans1: ans2: ans3: ans4: ans5: ans6:"
  /// example argument "uniqID:1.2.8 pageType:questionTypeC que:%"
  Question.fromString(v) {
    List<String> args =
    v.split("|");
    removeEmptyArguments(args);

    Map<String, String> fields = new Map.fromIterable(args,
        key: (item) => item.toString().split(":").elementAt(0),
        value: (item) => item.toString().split(":").elementAt(1));

    if (hasUniqId(fields) && hasQuestion(fields) && hasPageType(fields)) {
      this._uniqId = '${fields['uniqID']}';

      this._question = '${fields['que']}';
      this._answer1 = '${fields['ans1']}';
      this._answer2 = '${fields['ans2']}';
      this._answer3 = '${fields['ans3']}';
      this._answer4 = '${fields['ans4']}';
      this._answer5 = '${fields['ans5']}';
      this._answer6 = '${fields['ans6']}';
      this._correctAns = '${fields['correctAns']}';
      this._pageWidget = '${fields['pageType']}';
      this._firstTime = '${fields['firstTime']}';
    }

    if (uniqId.split(".").elementAt(0) == '1') {
      if (uniqId.split(".").elementAt(1) == '1') {
        permuteAnswer();
      }
      if (uniqId.split(".").elementAt(1) == '2') {
        createMathQuestion();
      }
      if (uniqId.split(".").elementAt(1) == '3') {
        createType_Int_or_Float_Question();
      }

      if (uniqId.split(".").elementAt(1) == '4') {
        createOperatorPresedens();
      }
      if (uniqId.split(".").elementAt(1) == '6') {
        createQuestion_of_Assignment();
      }
      if (uniqId.split(".").elementAt(1) == '7') {


        createQuestion_of_AugmententedAssignmentInt();
      }
      if (uniqId.split(".").elementAt(1) == '8') {
        permuteAnswer();
      }
    }
    if (uniqId.split(".").elementAt(0) == '2') {
      if (uniqId.split(".").elementAt(1) == '7') {
        permuteAnswer();
      }

      if (uniqId.split(".").elementAt(1) == '1') {
        permuteAnswer();
      }
      if (uniqId.split(".").elementAt(1) == '2') {
        inneBygdeFunksjonerQuestion();
      }
      if (uniqId.split(".").elementAt(1) == '3') {
              missingCodePart();
      }

      if (uniqId.split(".").elementAt(1) == '4') {
        createOperatorPresedens();
      }
      if (uniqId.split(".").elementAt(1) == '6') {
        missingCodePart();
      }

      if (uniqId.split(".").elementAt(1) == '8') {
        hva_returner_kode();
      }

    }

    if (uniqId.split(".").elementAt(0) == '3') {
      if (uniqId.split(".").elementAt(1) == '1') {
        permuteAnswer();
      }

      }

    }



  bool hasPageType(Map<String, String> fields) =>
      '${fields['pageType']}' != null;

  bool hasQuestion(Map<String, String> fields) => '${fields['que']}' != null;

  bool hasUniqId(Map<String, String> fields) => '${fields['uniqID']}' != null;

  void removeEmptyArguments(List<String> args) {
    args.removeWhere((s) => (s.length < 1) | !s.contains(":"));
  }




/// Metoder for å bergne tilfeldige tall
  ///
  /// Desimaltall
  double randomDouble(){
    return enRandom.nextDouble();
  }
 /// Heltall
  int randomInt(int n) {
    return enRandom.nextInt(n);
  }



  ///
/// Lager Matte spørsmål for uke 1, 1.2 Matteopersjoner
//
 void createMathQuestion() {

   List<String> operatorlist = ['/','%','**','floor','//'];

 //  List<String> operatorlist =['/'];

   int op = randomInt(operatorlist.length);



    if (operatorlist[op] == '/') {
      divide();
    }
    if (operatorlist[op] == '%') {
      modulo();
    }
    if (operatorlist[op] == '**') {
      exponent();
    }
    if (operatorlist[op] == 'floor') {
      floor();
    }

    // vil denne være rigktig ?
    if (operatorlist[op] == '//') {
         heltallsDivision();
    }

  }


  ///
  /// Spørsmål om type Uke 1, 1.3 Typer

  void createType_Int_or_Float_Question() {

     int type = randomInt(2);

     if (type == 0) {
      setQuestion(' Hvilke type er  ' + (randomInt(150) - 50).toString() + ' ?');
      setCorrectAnswer('Int');
      }
     if (type==1) {
      var  que =randomDouble()+ randomInt(150) - 50;
      setQuestion(' Hvilke type er  ' + que.toStringAsPrecision(3).toString() + ' ?');
     setCorrectAnswer('Float');
    }
  }



  // Lagere 6 tilfeldige alternative
  void setNewAnswer(var answer) {
    List<String> answerList = new List(6);

    int b = randomInt(6);

    answerList[b] = answer
        .toString(); // plasser det riktige svar på en tilfeldig plass i listen

    int ansAlternative;

    for (int i = 0; i < answerList.length; i++) {
      if (i != b) {
        ansAlternative = (randomInt(9) - 5) + answer;
        while (isInAnswerAlternative(ansAlternative, answerList)) {
          ansAlternative = (randomInt(9) - 5) + answer;
        }
        answerList[i] = ansAlternative.toString();
      }
    }

    /* DETTE MÅ GJØRES PÅ EN ANNEN MÅTE ? */
    _answer1 = answerList.elementAt(0);
    _answer2 = answerList.elementAt(1);
    _answer3 = answerList.elementAt(2);
    _answer4 = answerList.elementAt(3);
    _answer5 = answerList.elementAt(4);
    _answer6 = answerList.elementAt(5);
  }

/// Sjekker om svaret
  bool checkAnswer(
      BuildContext context, Question question, String answer, Lesson lesson, User user) {


    setFirstTime();
    /// Checks the if the give answer is correct
    if (answer == question.correctAns) {
      lesson.addCorrectAnsInRow(context,user);
      return true;
    } else {
      lesson.setAnsInRowZero(context, question);
      return false;
    }
  }

  void divide() {
    int n = randomInt(50);
    int d = randomInt(8) + 2; ///passer på at man ikke deler på null

    var ans = n / d;

    setQuestion('Hva blir verdien til x gitt med en desimal ,\n x = '+n.toString()+'/'+d.toString()+'');
    setCorrectAnswer(ans.toStringAsFixed(1));
  }

   void heltallsDivision(){
     int n = randomInt(50);
    int d = randomInt(8) + 2; // passer på at man ikke deler på null

       int ans = n ~/ d;
       setMathQuestion(n, '//', d); 
       setCorrectAnswer(ans.toString());


   }


  //
  void modulo() {
    int n = randomInt(50);
    int d = randomInt(8) + 2; // passer på at tallet ikke blir null

    var ans = n % d;
    setMathQuestion(n, '%', d);
    setCorrectAnswer(ans.toString());
    setNewAnswer(ans);
  }

  void exponent() {
    int t = randomInt(4);
    int e = randomInt(4);

    int ans = pow(-t, e);

    setNewAnswer(ans);
    setMathQuestion(-t, '**', e);
    setCorrectAnswer(ans.toString());
  }

  // Lager matteoppgave spørsmålet
  void setMathQuestion(var x, var op, var y) {
    this._question =
        'Hva blir verdien til x :\n x = ' + x.toString() + ' ' + op + ' ' + y.toString() + '';
  }

  // Lager floor oppgave
  void floor() {
    int t = randomInt(40) - 20;
    int d = randomInt(12) + 1; // passer på ikke er null

    var floor = (t / d);

    var ans = floor.floor().toString();

    String que = floor.toStringAsPrecision(3).toString();

    setQuestion('Hva er verdien til x :\n'
        'import math\n   x = math.floor(' + que + ') ? ');
    setCorrectAnswer(ans);
  }

  // sjekker om svaralternativ c, er i listen av svar alternativ
  bool isInAnswerAlternative(var c, List<String> list) {
    for (int i = 0; i < list.length; i++) {
      if (c.toString() == list[i].toString()) return true;
    }
    return false;
  }

// Stokker om på de 4 svaralternativene
  void permuteAnswer() {
    List<String> answerAlternative = new List(4);

    // plasser de ulike svarene tilfeldig inn i en tabell
    answerAlternative[getPosition(answerAlternative)] = _answer1;
    answerAlternative[getPosition(answerAlternative)] = _answer2;
    answerAlternative[getPosition(answerAlternative)] = _answer3;
    answerAlternative[getPosition(answerAlternative)] = _answer4;

    // oppdataterer svarene
    _answer1 = answerAlternative[0];
    _answer2 = answerAlternative[1];
    _answer3 = answerAlternative[2];
    _answer4 = answerAlternative[3];
  }

// Returner et index b, hvor svar kan lagres
  int getPosition(List<String> answerAlternative) {
    int b = randomInt(4);

    // sjekker om det er noe lagret i index i
    while (answerAlternative[b] != null) {
      b = randomInt(4);
    }
    return b;
  }

  void createOperatorPresedens() {

     List<String> operatorlist = ['+','-','*','//','/'];



    int x = randomInt(20)-5;
    int y = randomInt(10)-2;
    int z = randomInt(6-3);

    int op1 = randomInt(operatorlist.length);
    int op2 = randomInt(operatorlist.length);


   print ( 'op1  :  '+ op1.toString() +'    op2 : '+op2.toString());

    if (question == 'xOpyOpz') {
      presedens2op1(x,y,z,op1,op2,operatorlist);
    }
    if (question == '(xOpy)Opz') {
      presedens2op2(x,y,z,op1,op2,operatorlist);
    }
    if (question == 'xOp(yOpz)') {
      presedens2op3(x,y,z,op1,op2,operatorlist);
    }
  }


  // Oppgave i preseidense på formen :  x op1 y  op2 z
  void presedens2op1(int x,int y, int z, int op1, int op2, List<String> operatorlist) {

    var ans1;

    //første er pluss
    if (operatorlist[op1] == '+') {
      if (operatorlist[op2] == '+') {
        ans1 = x + y + z;


      }
      if (operatorlist[op2] == '-') {
        ans1 = x + y - z;

      }
      if (operatorlist[op2] == '*') {
        ans1 = x + y * z;


      }
      if (operatorlist[op2] == '//') {
             
          // hvis z er lik null , setter man z til et tilfeldig tall mellom 2-10   
             if(z==0) {
               z = randomInt(8) + 2; 
             }
           //  y= finnTallSomErDeleligZ(y, z);

          ans1 =x + (y ~/ z) ;

      }
      if(operatorlist[op2]=='/'){
        
    // hvis z er lik null , setter man z til et tilfeldig tall mellom 2-10   
                  if(z==0){
        z=randomInt(8)+2;
            }
      //  y= finnTallSomErDeleligZ(y, z);

          ans1=( x + (y/z)).toDouble();
         setCorrectAnswer(ans1.toStringAsPrecision(2));

      }
      
    }
      // Første  er minus
      if (operatorlist[op1] == '-') {
        if (operatorlist[op2] == '+') {
          ans1 = x - y + z;
        }
        if (operatorlist[op2] == '-') {
          ans1 = x - y - z;
        }
       if (operatorlist[op2] == '*') {
         ans1 = x - y * z;
          }
        if (operatorlist[op2] == '//') {
           if(z==0){
               z=randomInt(8)+2;
           }
        //y= finnTallSomErDeleligZ(y,z);

        ans1 =x - (y ~/ z) ;

      }
      if (operatorlist[op2] == '/') {
          if(z==0) {
            z = randomInt(8) + 2;
          }
        //  y= finnTallSomErDeleligZ(y,z);

          ans1 =(x - (y / z)).toDouble();

        }


    }

      //først er gange
      if (operatorlist[op1] == '*') {
        if (operatorlist[op2] == '+') {
          ans1 = x * y + z;
        }
        if (operatorlist[op2] == '-') {
          ans1 = x * y - z;
        }
        if (operatorlist[op2] == '*') {
          ans1 = x * y * z;
        }
        if (operatorlist[op2] == '//') {
          if(z==0){
            z=randomInt(7)+2;
          }


          ans1 =x * y ~/ z ;
        }
        if (operatorlist[op2] == '/') {
          if(z==0) {
            z = randomInt(7) + 2;
          }

         // y= finnTallSomErDeleligZ(y,z);

          ans1 =(x * y / z).toDouble() ;
        }



        }
     //først er dele
     if (operatorlist[op1] == '//') {
        if(y==0) {
          y = randomInt(9) + 3;
        }
        //finnerTallDeleligY(x, y);
        if (operatorlist[op2] == '+') {
          
       //   x=finnerTallDeleligY(x, y);
          ans1 =x ~/ y + z ;
        }
        if (operatorlist[op2] == '-') {
          

          ans1 =x ~/ y - z ;
        }
        if (operatorlist[op2] == '*') {
          
          ans1 =x ~/ y * z ;
        }
        if(operatorlist[op2]=='//'){
          
          if(z==0) {
            z = randomInt(4) + 2;
          }
       //   y=finnTallSomErDeleligZ(y, z);
       //    x= finnerTallDeleligY(x,y);

           ans1 =( x ~/ y ~/ z) ;
        }
        if(operatorlist[op2]=='/'){
          
          if(z==0) {
            z = randomInt(6) + 2;
          }
       //   y=finnTallSomErDeleligZ(y, z);
         // x= finnerTallDeleligY(x,y);

          ans1 =( x ~/ y / z).toDouble() ;
        }

      }

    //først er dele
    if (operatorlist[op1] == '/') {
      if(y==0) {
        y = randomInt(9) + 3;
      }
     // finnerTallDeleligY(x, y);
      if (operatorlist[op2] == '+') {
       
         ans1 =(x / y + z).toDouble() ;
      }
      if (operatorlist[op2] == '-') {

       
       // x= finnerTallDeleligY(x,y);

        ans1 =(x / y - z).toDouble() ;
      }
      if (operatorlist[op2] == '*') {
       


        ans1 =(x / y * z ).toDouble();
      }
      if(operatorlist[op2]=='//'){
        
        if(z==0) {
          z = randomInt(7) + 2;
        }
      //  y=finnTallSomErDeleligZ(y, z);
        x= finnerTallDeleligY(x,y);

        ans1 =( x / y ~/ z).toDouble() ;
      }
      if(operatorlist[op2]=='/'){
        
        if(z==0) {
          z = randomInt(4) + 4;
        }
      //  y=finnTallSomErDeleligZ(y, z);
      //  x= finnerTallDeleligY(x,y);

        ans1 =( x / y / z).toDouble() ;
      }

    }


        setPresedensQuestion(x,y , z,op1,op2,operatorlist);

      // setCorrectAnswer(ans1.toString());


       if(operatorlist[op1]=='/'||operatorlist[op2]=='/'){
         makeAnsAlternativeDouble(ans1);

       }
       else {
         setCorrectAnswer(ans1.toString());
         setNewAnswer(ans1);

       }


  }

  // Oppgave i preseidense på formen : ( x op1 y ) op2 z
    void presedens2op2(int x,int y, int z, int op1, int op2, List<String> operatorlist) {

      var ans1;
      // første operator er pluss
      if (operatorlist[op1] == '+') {
        if (operatorlist[op2] == '+') {
          ans1 = (x + y) + z;
          setCorrectAnswer(ans1.toString());


        }
        if (operatorlist[op2] == '-') {
          ans1 = (x + y) - z;
          setCorrectAnswer(ans1.toString());

        }
        if(operatorlist[op2]=='*'){
          ans1 = (x + y) * z;
          setCorrectAnswer(ans1.toString());
        }
        if(operatorlist[op2]=='//'){
        if(z==0) {
          z = randomInt(8) + 2;
        }




          ans1 = (x + y) ~/ z;

        }
        if(operatorlist[op2]=='/'){

          if(z==0){
            z=randomInt(8)+2;
          }
          
          ans1=((x + y)/ z).toDouble();
          setCorrectAnswer(ans1.toStringAsPrecision(2));

        }
      }

      //første operator er minus
      if (operatorlist[op1] == '-') {
        if (operatorlist[op2] == '+') {
          ans1 = (x - y) + z;
        }
        if (operatorlist[op2] == '-') {
          ans1 = (x - y) - z;
        }
          if (operatorlist[op2] == '*') {
          ans1 = (x - y) * z;
         }
        if(operatorlist[op2]=='//'){
          if(z==0) {
            z = randomInt(6) + 3;
          }


          ans1 = (x - y) ~/ z;

        }
        if(operatorlist[op2]=='/'){

          if(z==0) {
            z = randomInt(4) + 3;
          }
          
          ans1=((x - y)/ z).toDouble();



        }

      }

      // første operator er gange
     if (operatorlist[op1] == '*') {
          if (operatorlist[op2] == '+') {
          ans1 = (x * y) + z;
          setCorrectAnswer(ans1.toString());

          }
          if (operatorlist[op2] == '-') {

          ans1 = (x * y) - z;
          setCorrectAnswer(ans1.toString());


          }
          if (operatorlist[op2] == '*') {
          ans1 = x * (y * z);
          setCorrectAnswer(ans1.toString());


          }
         if(operatorlist[op2]=='//'){

            if(z==0){
              z= randomInt(8)+2;
            }

               ans1= (x*y)~/z;

              }

           }

          if(operatorlist[op2]=='/'){

            if(z==0) {
              z = randomInt(8) + 2;
            }
            ans1=((x * y)/ z).toDouble();
            }





      // første operator er dele
      if (operatorlist[op1] == '//') {
          if(y==0) {
            y = randomInt(8) + 2;
          }


          if (operatorlist[op2] == '+') {

         ans1 = (x ~/ y) + z;
          }
        if (operatorlist[op2] == '-') {
          ans1 = (x ~/ y) - z;
        }
        if (operatorlist[op2] == '*') {
          ans1 = (x ~/ y )* z;
        }
        if(operatorlist[op2]=='//'){
          if(z==0) {
            z = randomInt(8) + 2;
          }


           ans1 = (x ~/ y) ~/ z;

        }
          if(operatorlist[op2]=='/'){

            if(z==0) {
              z = randomInt(8) + 2;
            }

            ans1=(x ~/ y)/ z;


          }

      }

      // første operator er dele
      if (operatorlist[op1] == '/') {
        if(y==0) {
          y = randomInt(10) + 2;
        }
        
        if (operatorlist[op2] == '+') {

          ans1 = ((x / y) + z).toDouble();
        }
        if (operatorlist[op2] == '-') {
          ans1 = ((x / y) - z).toDouble();
        }
        if (operatorlist[op2] == '*') {
          ans1 = ((x / y )* z).toDouble();
        }
        if(operatorlist[op2]=='//'){

          if(z==0) {
            z = randomInt(8) + 2;
          }

          ans1 = ((x / y) ~/ z).toDouble();

        }
        if(operatorlist[op2]=='/'){
          if(z==0) {
            z = randomInt(8) + 2;
          }

          ans1=((x / y)/ z).toDouble();





        }

      }

      setQuestion(
          'Hva er resultatet av :\n (' + x.toString() + ' ' + operatorlist[op1] + '  ' +
              y.toString() + ') ' + operatorlist[op2] +
              z.toString() + '  ?');

      if(operatorlist[op1]=='/'||operatorlist[op2]=='/'){
        makeAnsAlternativeDouble(ans1);

      //  setCorrectAnswer(ans1.toString());
      }
      else {
        setCorrectAnswer(ans1.toString());
        setNewAnswer(ans1);

      }

    }

    setWidgetType(String widgetType){
      this._pageWidget = widgetType;
    }

// Oppgave i preseidense på formen : x op1 (y op2 z )
    void presedens2op3(int x,int y, int z, int op1, int op2, List<String> operatorlist) {
      var ans1;

      //første operator er pluss
      if (operatorlist[op1] == '+') {
        if (operatorlist[op2] == '+') {
          ans1 = x + (y + z);
          setCorrectAnswer(ans1.toString());
        }
        if (operatorlist[op2] == '-') {
          ans1 = x + (y - z);
          setCorrectAnswer(ans1.toString());
        }
        if (operatorlist[op2] == '*') {
          ans1 = x + (y * z);
          setCorrectAnswer(ans1.toString());
        }
         if (operatorlist[op2] == '//') {
           if (z == 0) {
             z = randomInt(7) + 2;
           }

           ans1 = x + (y ~/ z);
           setCorrectAnswer(ans1.toString());
         }
        if(operatorlist[op2]=='/'){

          if(z==0){
            z=randomInt(8)+2;
          }
          ans1=x + (y/ z);
          setCorrectAnswer(ans1.toString());

        }

      }

      // første operator er minus
      if (operatorlist[op1] == '-') {
        if (operatorlist[op2] == '+') {
          ans1 = x - (y + z);
          setCorrectAnswer(ans1.toString());
        }
        if (operatorlist[op2] == '-') {
          ans1 = x - (y - z);
          setCorrectAnswer(ans1.toString());
        }
        if (operatorlist[op2] == '*') {
          ans1 = x - (y * z);
          setCorrectAnswer(ans1.toString());
        }
           if (operatorlist[op2] == '//') {
        if (z == 0) {
          z = randomInt(13) + 2;
        }
        ans1 = x - (y ~/ z);
        setCorrectAnswer(ans1.toString());
        }

        if(operatorlist[op2]=='/'){

          if(z==0){
            z=randomInt(10)+2;
          }
          ans1=x - (y/ z);
          setCorrectAnswer(ans1.toStringAsPrecision(2));

        }


      }

      // første operator er gange
      if (operatorlist[op1] == '*') {
        if (operatorlist[op2] == '+') {
          ans1 = x * (y + z);
          setCorrectAnswer(ans1.toString());
        }
        if (operatorlist[op2] == '-') {
          ans1 = x * (y - z);
          setCorrectAnswer(ans1.toString());
        }
        if (operatorlist[op2] == '*') {
          ans1 = x * (y * z);
          setCorrectAnswer(ans1.toString());
        }
        if (operatorlist[op2] == '//') {
          if (z == 0) {
            z = randomInt(15) + 2;
          }
          ans1 = x * (y ~/z);
          setCorrectAnswer(ans1.toString());

        }

        if (operatorlist[op2] == '/') {
          if (z == 0){
            z = randomInt(9) + 2;
          }
          ans1 = x * (y /z);
          setCorrectAnswer(ans1.toString());

        }
      }

         // første operator er dele
            if (operatorlist[op1] == '//') {
               if(y==0) {
              y = randomInt(15) + 2;
              }
                if (operatorlist[op2] == '+') {



              if(y+z==0){
                y= y+3;
              }

            ans1 = x ~/(y+z);
            }
            if (operatorlist[op2] == '-') {


              if(y-z==0){
                y= y+6;
              }

              ans1 = x ~/(y-z);
            }
            if (operatorlist[op2] == '*') {

              if(y*z==0){
                y= randomInt(5)+2;
                z=randomInt(4)+2;
              }

              ans1 = x ~/(y*z);

            }
           if (operatorlist[op2] == '//') {
            if(z==0) {
              z = randomInt(15) + 2;
            }
            if(y==0){
              y=randomInt(15)+2;
            }


            ans1 = x ~/(y~/z);
            }
            if (operatorlist[op2] == '/') {
              if(z==0) {
                z = randomInt(9) + 2;
              }
              if(y==0){
                y=randomInt(6)+3;
              }

              ans1 = (x ~/(y/z)).toDouble();
            }
            }

      // første operator er dele
      if (operatorlist[op1] == '/') {
        if(y==0) {
          y = randomInt(9) + 2;
        }
        if (operatorlist[op2] == '+') {
          if(y+z==0){
            y= randomInt(5)+2;
          }

          ans1 = (x /(y+z)).toDouble();
        }
        if (operatorlist[op2] == '-') {
          if(y-z==0){
            y= y+2;
          }
          ans1 = (x /(y-z)).toDouble();
        }
        if (operatorlist[op2] == '*') {
          if(y*z==0){
            if(y==0){
              y = randomInt(5)+2;
            }
            if(z==0){
              z = randomInt(6)+2;
            }

          }
          ans1 = (x /(y*z)).toDouble();

        }
        if (operatorlist[op2] == '//') {
          if(z==0) {
            z = randomInt(4) + 2;
          }
          if(y==0){
            y=randomInt(6)+3;
          }

          ans1 = (x /(y~/z)).toDouble();
        }
        if (operatorlist[op2] == '/') {
          if(z==0) {
            z = randomInt(16) + 2;
          }
          if(y==0){
            y=randomInt(6)+3;
          }

          ans1 = (x /(y/z)).toDouble();
        }
      }





      setQuestion(
            'Hva er resultatet av :\n ' + x.toString() + ' ' + operatorlist[op1] + '  (' +
                y.toString() + ' ' + operatorlist[op2] +
                z.toString() + ' ) ?');

      if(operatorlist[op1]=='/'||operatorlist[op2]=='/'){
        makeAnsAlternativeDouble(ans1);
        }
      else {
        setCorrectAnswer(ans1.toString());
        setNewAnswer(ans1);

      }


    }


 // Sette parantes rundt negative tall for y op1 y op2 Z
  void setPresedensQuestion(int x, int y, int z,int op1, int op2, List<String> operatorlist) {
    if(x<0){
      setQuestion('Hva er resultatet av :\n (' + x.toString() + ') '+operatorlist[op1]+'  ' + y.toString() + '  '+operatorlist[op2] +
          ' ' + z.toString() + '  ?');}
    if(y<0){
      setQuestion('Hva er resultatet av :\n ' + x.toString() + ' '+operatorlist[op1]+'  (' + y.toString() + ')  '+operatorlist[op2] +
          ' ' + z.toString() + '  ?');
    }
    if(z<0){
      setQuestion('Hva er resultatet av :\n ' + x.toString() + ' '+operatorlist[op1]+'  ' + y.toString() + '  '+operatorlist[op2] +
          ' (' + z.toString() + ')  ?');
    }
    if((x<0)&& y<0){
      setQuestion('Hva er resultatet av :\n (' + x.toString() + ') '+operatorlist[op1]+'  (' + y.toString() + ') '+operatorlist[op2] +
          ' ' + z.toString() + '  ?');}
    if((x<0)&& z<0){
      setQuestion('Hva er resultatet av :\n  (' + x.toString() + ') '+operatorlist[op1]+'  ' + y.toString() + '  '+operatorlist[op2] +
          ' (' + z.toString() + ')  ?');}

    if((x<0)&& y<0){
      setQuestion('Hva er resultatet av :\n (' + x.toString() + ') '+operatorlist[op1]+'  (' + y.toString() + ') '+operatorlist[op2] +
          ' ' + z.toString() + '  ?');}

    if((z<0)&& y<0){
      setQuestion('Hva er resultatet av :\n ' + x.toString() + ' '+operatorlist[op1]+'  (' + y.toString() + ') '+operatorlist[op2] +
          ' (' + z.toString() + ')  ?');}
    if((x<0)&& (y<0) && (z<0) ){
      setQuestion('Hva er resultatet av :\n  (' + x.toString() + ') '+operatorlist[op1]+'  (' + y.toString() + ')  '+operatorlist[op2] +
          ' (' + z.toString() + ')  ?');
    }
    if(x>=0 && y>=0 && z >=0){
      setQuestion('Hva er resultatet av :\n ' + x.toString() + ' '+operatorlist[op1]+'  ' + y.toString() + '  '+operatorlist[op2] +
          ' ' + z.toString() + '  ?');

    }

  }

  /// Hjelpe metode til å finne ut om det skal være heletall eller double
  /// Assignment
  void createQuestion_of_Assignment(){

    int t=randomInt(2);
    if(t==0) {
      createQuestion_of_AssignmentInt();
    }
    createQuestion_of_AssignmentFloat();

  }

  /// Lager assignment med heletall
    void createQuestion_of_AssignmentInt() {

       List<String> operatorList = ['','+','*','-','**'];


      int op1 = randomInt(operatorList.length);

      int konstanst = randomInt(1);

      var ans;
      var tall;
      tall = randomInt(50);

      if (operatorList[op1] == '') {
        ans = tall;
        setQuestion('Hva er resultatet av  x  = ' + tall.toString() + '');
      }
      if (operatorList[op1] == '+') {
        if (konstanst == 0) {
          setQuestion(
              'Hva er resultatet av  x \n'' x = ' + tall.toString() + ' \n   x = x + x ');
          ans = tall + tall;
        }

        if (konstanst == 1) {

          ans = tall + 3;
          setQuestion(
              'Hva er resultatet av  x  = ' + tall.toString() + '');
        }
        if (konstanst == 2) {
          int leggTill= randomInt(5);
          ans = tall + leggTill;
          setQuestion('Hva er resultatet av  x \n  x = ' + tall.toString() +
              '\n ''     y =  x + '+leggTill.toString()+'  \n ');
        }
      }
      if (operatorList[op1] == '*') {
          tall=randomInt(11);
        if (konstanst == 0) {
          setQuestion('Hva er resultatet av  x  \n'' x = '+tall.toString()+' \n   x = x * x ');
          ans = tall * tall;
        }
          if(konstanst==2){
            ans =tall * 3;
            setQuestion('Hva er resultatet av  x  \n  x = ' + tall.toString() + '\n ''     y =  x * 3 ');
          }


      }

      if (operatorList[op1] == '-') {
        if (konstanst == 0) {
          setQuestion(
              'Hva er resultatet av  x  \n'' x = ' + tall.toString() + ' \n   x = x - x ');
          ans = tall - tall;
        }

        if (konstanst == 1) {
          ans = tall - 3;
          setQuestion(
              'Hva er resultatet av  x = ' + tall.toString() + ' - 3 \n ');
        }
        if (konstanst == 2) {
          int trekkFra= randomInt(5);
          ans = tall - trekkFra;


          setQuestion('Hva er resultatet av \n  x = ' + tall.toString() +
              '\n ''     y =  x - '+trekkFra.toString()+' \n ');
        }
      }

      if (operatorList[op1] == '**') {
        tall = randomInt(10);
        if (tall < 4) {
          setQuestion(
              'Hva er resultatet av  \n'' x = ' + tall.toString() + ' \n   x = x ** x ');
          ans = pow(tall, tall);
        }
        else{
          setQuestion('Hva er resultatet av \n'' x = ' + tall.toString() + ' \n   x = x ** 2');
          ans = pow(tall, 2);

        }


      }
      setCorrectAnswer(ans.toString());
      settAnsAlernativeAssigmentInt(ans, 4, 'Int');
    }


  // Assignement med float
  void createQuestion_of_AssignmentFloat() {
    List<String> operatorList = ['','+'];



    int op1 = randomInt(operatorList.length);
    double ans;
    double d;
      if (operatorList[op1] == '') {
        d = randomInt(100).toDouble() + randomDouble();
        setQuestion('Hva blir  x = ' + d.toStringAsPrecision(4) + '');
        ans=d;
        setCorrectAnswer(d.toStringAsPrecision(4));
      }
      if(operatorList[op1]=='+'){
        var leggTil = randomInt(5);
        d = randomInt(100).toDouble() + randomDouble();
        setQuestion('Hva blir  x = ' + d.toStringAsPrecision(4) + ' + '+leggTil.toDouble().toString()+' \n ' '    ');
        ans=d+leggTil.toDouble();
        setCorrectAnswer(ans.toStringAsPrecision(4));
      }
    if(operatorList[op1]=='+'){
      var trekkeFra = randomInt(5);
      d = randomInt(100).toDouble() + randomDouble();
      setQuestion('Hva blir  x = ' + d.toStringAsPrecision(4) + ' - '+trekkeFra.toDouble().toString()+' \n ' '    ');
      ans= d - trekkeFra.toDouble();
      setCorrectAnswer(ans.toStringAsPrecision(4));
    }



    settAnsAlernativeAssigmentDouble(ans, 4,'Float');

  }


/// Lager 4 svar alternativ for AssigmentInt , som permuteres
    void settAnsAlernativeAssigmentInt( var ans,  int y, String type) {

      int ans2 = ans - randomInt(y)-6;
      int ans3 = ans + randomInt(y)+1;


      _answer1 = correctAns;
      _answer2 = ans2.toString();
      _answer3 = ans3.toString();
      _answer4 = type;

      permuteAnswer();
    }

  void settAnsAlernativeAssigmentDouble(double ans, int y, String type) {


    double ans2 = ans - (randomInt(y)+1).toDouble();

    double ans3 = ans + (randomInt(y)-6).toDouble();

    _answer1 = correctAns;
    _answer2 = ans2.toStringAsPrecision(4);
    _answer3 = ans3.toStringAsPrecision(4);
    _answer4 = type;

    permuteAnswer();
  }

  void createQuestion_of_AugmententedAssignmentInt() {

    List<String> operatorList = ['+=','-=','*=','**=','/=','//='];

    int x, x1, x2, op1;

   double doub;

    x1 = randomInt(5)+1;
    x2 = randomInt(17);
    op1 = randomInt(operatorList.length);

    if(operatorList[op1]=='+='){
      x =  x1;
      x += x2;
      }
    if(operatorList[op1]=='-='){
      x =  x1;
      x -= x2;
    }
    if(operatorList[op1]=='*='){
      x =  x1;
      x *= x2;
    }
    if(operatorList[op1]=='**='){

      x2=randomInt(4);

      x =  x1;
      x = pow(x,x2);
    }
    if(operatorList[op1]=='/='){
      if(x2==0){
        x2=randomInt(9)+2;
      }
        x1=finnerTallDeleligY(x1, x2);

         doub= x1/x2;

      }

    if(operatorList[op1]=='//='){
      if(x2==0){
        x2=randomInt(9)+2;}
      x1=finnerTallDeleligY(x1, x2);

      x= x1~/x2;

    }
    if(operatorList[op1]=='%='){
      x1=randomInt(60)-30;
      if(x2==0){
        x2=randomInt(9)+1;}

       x = x1%x2;


    }



/**    if(operatorList[op1]=='%'){
      x =  x1;
      x %= x2;
    }*/
    if(operatorList[op1]=='/'){
      setCorrectAnswer(doub.toStringAsFixed(1));
    }
    else {
      setCorrectAnswer(x.toString());
    }
   setQuestion('Hva blir \n x = '+x1.toString()+'\n'
        'x '+operatorList[op1]+' '+x2.toString()+''
       ) ;

   settAnsAlernativeAugmentAssigmentInt(x, x1, x2,  'Int');

  }





  void settAnsAlernativeAugmentAssigmentInt(int x, int x1, int x2, String s) {

    List<String> answerList = new List(4);

    int b =randomInt(answerList.length);
     answerList[b]= x.toString();
     int ansAlternative;

     for(int i = 0; i<answerList.length;i++){
       if(b!=i){
  ansAlternative = (randomInt(9) - 5) + x;
  while (isInAnswerAlternative(ansAlternative, answerList)) {
  ansAlternative = (randomInt(9) - 5) + x;
  }
  answerList[i] = ansAlternative.toString();
  }


  }


    _answer1= answerList[0];
    _answer2=answerList[1];
    _answer3=answerList[2];
    _answer4=answerList[3];


  }

/// Finner Y  som er delig med Z
  int finnTallSomErDeleligZ(int y, int z) {
    return y * z;//
  }

  /// finner X som er delig med Y
  int finnerTallDeleligY(int x,int y){

       return x*y;

  }



/// Uke 2 spørsmål nedenfor her


  void missingCodePart() {

/// Inneholder en liste med strenger splitettet med | med  informasjon om
    /// funksjons navn,argumenter, retur utrykk, operator navn, operator
   List<String> functionName=[
      'add|||pluss|+','sum|||pluss|+',
      'subtract|||minus|-',
      'multiply|||times|*' ,
      'divide|||divided|/',
      'convert_to_celcius|farenheit|((farenheit -32) * 5/9)||',
      'abs_diff|a,b|abs(a-b)||',
      'quadratic|a, b, c, x|(a*x**2) + (b*x) + c||',
      'km_to_miles|km|km*1.6||',
      'avrage_grades|one, two, three|((one+two+three)/3)||',
      'next|num|(num+1)||',
      'square|num|(num * num)||',
      ];

   print(' missing kode antall :'+functionName.length.toString());

    List<String> missingPart = ['def','return'];


    String function_name, argument, retur_utrykk;
    String operator_text, operator_symbol;

    int func = randomInt(functionName.length);
    int part = randomInt(missingPart.length);

    // leser deler opp strengen
    function_name = functionName[func].split("|").elementAt(0);
    argument = functionName[func].split("|").elementAt(1);
    retur_utrykk = functionName[func].split("|").elementAt(2);
    operator_text = functionName[func].split("|").elementAt(3);
    operator_symbol = functionName[func].split("|").elementAt(4);


  // lager spørsmål
    setMissingCodePartQeustion(
        missingPart[part], function_name, argument, retur_utrykk, operator_text,
        operator_symbol);


   // sjekker hvilke kodedel som manler
    if (missingPart[part] == 'def') {

      //sjekker om spørsmålets layout er på en eller to linjer
      if (argument.isEmpty) {
        // setter lay out på spr
        setWidgetType('questionTypeD');
        setCorrectAnswer('def');
      }
      else {
        //setter layout på spørsmålet
        setWidgetType('questionTypeD2');
        setCorrectAnswer('def');
      }
    }
    // sjekker hvilke kodedel som manler
    if (missingPart[part] =='return') {
      if (argument.isEmpty) {
        //sjekker om spørsmålets layout er på en eller to linjer
        setCorrectAnswer('return');
        setWidgetType('questionTypeE');
      }
     else{
        //setter layout på spørsmålet
        setWidgetType('questionTypeE2');
        setCorrectAnswer('return');


      }
    }
  }


/// Oppretter spørsmål teksten
  void setMissingCodePartQeustion(String part,String function,String argument,returUtrykk, String op1,String op2) {

    String qoute=' " ';

    String que;

    // Spørsmål der def mangler
      if (part == 'def') {
        //
        if (argument.isEmpty) {
          // spørsmål der def mangler på 3-linjer
          que = ' ' + function + '(x, y): '''
              '|   ' "" + qoute + " Return x "" " + op1 + " y  " + qoute +
              ''"|"""
                  '    ' '   return x ' + op2 + ' y ';
        }
        else {
          // spørsmål der def mangler på 2-linjer
            que = ' ' + function + '( ' + argument + ' ): '''
                '| ''return ' + returUtrykk + '';

        }
      }
      /// spørsmål der return mangler
      if (part == 'return') {
        /// spørsmål der retrun mangler på 3-linjer
        if (argument.isEmpty) {
          que = 'def ' + function + '(x, y): '''
              '|   ' "" + qoute + " Return x "" " + op1 + " y  " + qoute + ''"|"
              ' x ' + op2 + ' y ';
        }
        else{
          /// spørsmål der return mangler på 2-linjer
          que = 'def ' + function + '('+argument+ '):'
              '| ' +returUtrykk+'';

        }
      }
     /// setter ny- spørmål tekst
      setQuestion(que);
      permuteAnswer();
  }




void hva_returner_kode(){


  List<String> functionName=['kode1|add|pluss|+','kode2|add|pluss|+',
   'kode3|add|pluss|+','kode4|add|pluss|+','kode1|sum|pluss|+',
 'kode2|sum|pluss|+','kode3|sum|pluss|+','kode4|sum|pluss|+',
 'kode1|subtract|minus|-','kode2|subtract|minus|-',
 'kode3|subtract|minus|-','kode4|subtract|minus|-',
 'kode1|multiply|times|*', 'kode2|multiply|times|*',
 'kode3|multiply|times|*','kode4|multiply|times|*',
 'kode1|divide|divided|/','kode2|divide|divided|/',
 'kode3|divide|divided|/'];

  print('Lengden på returnerer koden spørsmål '+functionName.length.toString());

  String  function_name, operator_text,operator_symbol;

  var ans;
  double ansDouble;
  // Passer på at man ikke deler på null
  int num1 = randomInt(18)-9;
  if(num1==0){
    num1 =num1+1;
  }
  int num2 = randomInt(18)-9;
  if(num2==0){
    num2 =num2+1;
  }

  int num3 = randomInt(18)-9;
  if(num3==0){
    num3 =num3+1;
  }


  int funksjonType =randomInt(functionName.length);



  function_name = functionName[funksjonType].split("|").elementAt(1);
  operator_text  = functionName[funksjonType].split("|").elementAt(2);
  operator_symbol = functionName[funksjonType].split("|").elementAt(3);



  if(functionName[funksjonType].split("|").elementAt(0)=='kode1'){
       if(functionName[funksjonType].split("|").elementAt(3)=='+'){
       ans = (num1+num2);
       setCorrectAnswer(ans.toString());
       setAnswer1(_correctAns);

       }

       if(functionName[funksjonType].split("|").elementAt(3)=='-'){
         ans = (num1-num2);
         setCorrectAnswer(ans.toString());
         setAnswer1(_correctAns);

       }
       if(functionName[funksjonType].split("|").elementAt(3)=='*'){
         ans = (num1*num2);
         setCorrectAnswer(ans.toString());
         setAnswer1(_correctAns);

       }
       if(functionName[funksjonType].split("|").elementAt(3)=='/'){
        //har tidligere sjekket at num2  ikke er lik 0 lengre opp
         num1=num1*num2;
         ansDouble = (num1 / num2);
         setCorrectAnswer(ansDouble.toStringAsPrecision(2));
         setAnswer1(_correctAns);
       }


       returKodeQuetion1(function_name,operator_text,operator_symbol,num1,num2 );
       setAnswer2('TypeError');
       setAnswer3('IndentationError');
       setAnswer4(" x "+operator_symbol+" y");

       permuteAnswer();

  }
  if(functionName[funksjonType].split("|").elementAt(0)=='kode2'){
    if(functionName[funksjonType].split("|").elementAt(3)=='+'){
      ans = (num1+num2);
      }
    if(functionName[funksjonType].split("|").elementAt(3)=='-'){
      ans = (num1-num2);
    }
    if(functionName[funksjonType].split("|").elementAt(3)=='*'){
      ans = (num1*num2);
    }
    if(functionName[funksjonType].split("|").elementAt(3)=='/'){

      if(num2==0){
        num2=randomInt(8) +3;
      }
      num1=num1*num2;
      ans = (num1~/num2);
    }
 

    returKodeQuetion2(function_name,operator_text,operator_symbol,num1,num2 );
    setCorrectAnswer(ans.toString());
    setAnswer1(_correctAns);
    setAnswer2('TypeError');
    setAnswer3('IndentationError');
    setAnswer4(" x "+operator_symbol+" y");

    permuteAnswer();

  }
  if(functionName[funksjonType].split("|").elementAt(0)=='kode3'){

    var c;
    if(functionName[funksjonType].split("|").elementAt(3)=='+'){
      ans = (num3+num2);
      c=num1+num2;
      }
    if(functionName[funksjonType].split("|").elementAt(3)=='-'){
      ans = (num3-num2);
      c= num1-num2;
    }
    if(functionName[funksjonType].split("|").elementAt(3)=='*'){
      ans = (num3*num2);
      c = num1*num2;
    }
    if(functionName[funksjonType].split("|").elementAt(3)=='/'){
      num3=num3*num2;

      if(num2==0){
        num2 =randomInt(9)+1;
      }
      num3=num2*num3;
      num1=num2*num1;
      c=(num1~/num2);
      ans = (num3~/num2);

    }
    setCorrectAnswer(ans.toString());
    returKodeQuetion3(function_name,operator_text,operator_symbol,num1,num2,num3 );
   // setterFireSvarAltenativer(ans,'IndentationError');
    
    if(c==ans) {
      c = c - 1;
    }

      setAnswer1(_correctAns);
      setAnswer2(c.toString());
      setAnswer3('IndentationError');
      setAnswer4(" x "+operator_symbol+" y");
      permuteAnswer();


    
  }



  var b  ;
  if(functionName[funksjonType].split("|").elementAt(0)=='kode4') {
    if (functionName[funksjonType].split("|").elementAt(3) == '+') {
      ans = (num1 + num3);
      b= num1+num2;
    }
    if(functionName[funksjonType].split("|").elementAt(3)=='-'){
      ans = (num1-num3);
      b=num1-num2;
    }
    if(functionName[funksjonType].split("|").elementAt(3)=='*'){
      ans = (num1*num3);
      b = num1*num2;
    }
    if(functionName[funksjonType].split("|").elementAt(3)=='/'){

      if(num3==0) {
        num3=randomInt(10)+1;
      }
      num3=finnerTallDeleligY(num1, num3);
      ans = (num1/num3);
      if(num2==0){
        num2= randomInt(10)+1;
      }
      num2=finnerTallDeleligY(num1, num2);
      b = num1 /num2;
    }
      setCorrectAnswer(ans.toString());
      returKodeQuetion4(function_name,operator_text,operator_symbol,num1,num2,num3 );

    if(b==ans){
      b= b+1;
    }
    setAnswer1(_correctAns);
    setAnswer2(b.toString());
    setAnswer3('IndentationError');
    setAnswer4(" x "+operator_symbol+ " y");


  }



  permuteAnswer();


}

  void returKodeQuetion1(String function_name, String operator_text, String operator_symbol,
      int num1,int num2) {

    String newQuestion;

    String qoute='"" " ';

    if(operator_text=='square'){
      newQuestion ='Hva vil denne koden returnere ?|def ' + function_name + '(num): ''\n'
          '   ' "" + qoute + " Return (num  *  num)  " + qoute + '\n'""
          ''+function_name+'('+num1.toString()+')';
    }
     else {
      newQuestion = 'Hva vil denne koden returnere ?|def ' + function_name + '(x, y): ''\n'
          '   ' "" + qoute + " Return x "" " + operator_text + " y  " +
          qoute + '\n'""
          '          return  x ' + operator_symbol + ' y \n '
          '' + function_name + '(' + num1.toString() + ', ' + num2.toString() +
          ')';
    }
    setQuestion(newQuestion);

  }

  void returKodeQuetion2(String function_name, String operator_text, String operator_symbol,int num1,int num2) {

    String newQuestion;

    String qoute=' """ ';
    if(operator_text=='square'){
      newQuestion = 'Hva vil denne koden returnere ?| x = '+num1.toString()+'\n'' def ' + function_name + '(num): ''\n'
          '   ' "" + qoute + " Return (num  *  num)  " + qoute + '\n'""
          ''+function_name+'('+num2.toString()+')';
    }
    else {
      newQuestion =
          ' Hva vil denne koden returnere ?|x = ' + num1.toString() + '\n y = ' + num2.toString() + '\n'
              'def ' + function_name + '(x, y): ''\n'
              '   ' "" + qoute + " Return x "" " + operator_text + " y  " +
              qoute + '\n'""
              '    return  x ' + operator_symbol + ' y \n '
              '' + function_name + '( x, y)';
    }
      setQuestion(newQuestion);

  }

  void returKodeQuetion3(String function_name, String operator_text, String operator_symbol,int num1,int num2, int num3) {

    String newQuestion;

    String qoute=' """ ';





    newQuestion = 'Hva vil denne koden returnere ?| x = '+num1.toString()+'\n y = '+num2.toString()+'\n'
        'def ' + function_name + '(x, y): ''\n'
        '   ' "" + qoute + " Return x "" " + operator_text + " y  " + qoute + '\n'""
        '    x = '+num3.toString()+'\n'
        '    return  x ' + operator_symbol + ' y \n '
        ''+function_name+'( x, y)';


    setQuestion(newQuestion);

  }
  void returKodeQuetion4(String function_name, String operator_text, String operator_symbol,int num1,int num2, int num3) {

    String newQuestion;

    String qoute=' """ ';




    newQuestion = 'Hva vil denne koden returnere ?| x = '+num1.toString()+'\n y = '+num2.toString()+'\n'
        'def ' + function_name + '(x, y): ''\n'
        '   ' "" + qoute + " Return x "" " + operator_text + " y  " + qoute + '\n'""
        '             y = '+num3.toString()+'\n'
        '             return  x ' + operator_symbol + ' y \n '
        ''+function_name+'( x, y)';


    setQuestion(newQuestion);

  }


  void setterFireSvarAltenativer(int riktigSvar ,String feilmelding) {




    List<String> answerList = new List(4);

    int b =randomInt(answerList.length);
    answerList[b]= _correctAns;

    int ansAlternative;


    for(int i = 0; i<answerList.length;i++){
      if(b!=i){
        ansAlternative = (randomInt(9) - 5) + riktigSvar;
        while (isInAnswerAlternative(ansAlternative, answerList)) {
          ansAlternative = (randomInt(9) - 5) + riktigSvar;
        }
        answerList[i] = ansAlternative.toString();
      }


    }
     b =randomInt(4);

      if(answerList[b]==_correctAns){
        if(b==3){
          b=b-1;
        answerList[b]=feilmelding;
        }

        else {
          b = b + 1;
          answerList[b] = feilmelding;
        }
      }
      else{
        answerList[b]=feilmelding;
      }


     _answer1= answerList[0];
    _answer2=answerList[1];
    _answer3=answerList[2];
    _answer4=answerList[3];




  }

  void feilmeldingQuestion(){

    setWidgetType('questionTypeF');
    List<String> feilmeldingQuestion =['type1|add|+','type1|sum|+','type3|sum|+|x',
     'type3|sum|+|y','type1|subtract|-','type2|subtract|-','type1|multiply|*'];

    print(' antall ulike feilmelding typer '+ feilmeldingQuestion.length.toString());

    int num1, num2;

    num1 = randomInt(20)-10;
    num2 = randomInt(20)-10;

    int typeFeil= randomInt(feilmeldingQuestion.length);

    if(feilmeldingQuestion[typeFeil].split("|").elementAt(0)=='type1') {

      setCorrectAnswer('IndentationError');
      if (feilmeldingQuestion[typeFeil].split("|").elementAt(2) == '+') {
        //settAnsFeilmeldinger((num1 + num2), (num1 + num2 + 1), 'TypeError');
        setAnswer4((num1+num2).toString());
      }
      if (feilmeldingQuestion[typeFeil].split("|").elementAt(2) == '-') {
       // settAnsFeilmeldinger((num1 - num2), (num1 - num2 - 1), 'TypeError');
        setAnswer4((num1-num2).toString());
      }
      if (feilmeldingQuestion[typeFeil].split("|").elementAt(2) == '*') {
       // settAnsFeilmeldinger((num1 * num2), (num1 + num2 ), 'TypeError');
        setAnswer4((num1*num2).toString());
      }
      setQuetionFeilmeldig1(
          feilmeldingQuestion[typeFeil].split("|").elementAt(1),
          feilmeldingQuestion[typeFeil].split("|").elementAt(2), num1, num2);

    }

      if(feilmeldingQuestion[typeFeil].split("|").elementAt(0)=='type2') {
        setQuetionFeilmeldig2(
            feilmeldingQuestion[typeFeil].split("|").elementAt(1),
            feilmeldingQuestion[typeFeil].split("|").elementAt(2), num1, num2);

        setCorrectAnswer('IndentationError');
        if (feilmeldingQuestion[typeFeil].split("|").elementAt(2) == '+') {
          //settAnsFeilmeldinger((num1 + num2), (num1 + num2 + 1), 'TypeError');
          setAnswer4((num1+num2).toString());
        }
        if (feilmeldingQuestion[typeFeil].split("|").elementAt(2) == '-') {
          //settAnsFeilmeldinger((num1 + num2), (num1 + num2 + 1), 'TypeError');
          setAnswer4((num1-num2).toString());
        }
        if (feilmeldingQuestion[typeFeil].split("|").elementAt(2) == '*') {
          //settAnsFeilmeldinger((num1 + num2), (num1 + num2 + 1), 'TypeError');
          setAnswer4((num1*num2).toString());
        }

      }
    setAnswer2('TypeError');
    int num3 = randomInt(20) - 10;

    if(feilmeldingQuestion[typeFeil].split("|").elementAt(0)=='type3') {
      if (feilmeldingQuestion[typeFeil].split("|").elementAt(3) == 'x') {
        setQuetionFeilmeldig3(
            feilmeldingQuestion[typeFeil].split("|").elementAt(1),
            feilmeldingQuestion[typeFeil].split("|").elementAt(2), num1, num2,
            'x',num3);
      }
      if (feilmeldingQuestion[typeFeil].split("|").elementAt(2) == '+'){
           setAnswer4((num1 + num2).toString());
           setAnswer2((num1+num3).toString());
    }
      if (feilmeldingQuestion[typeFeil].split("|").elementAt(2) == '-'){
        setAnswer4((num1 - num2).toString());
        setAnswer2((num1-num3).toString());
      }
      if (feilmeldingQuestion[typeFeil].split("|").elementAt(2) == '*'){
        setAnswer4((num1 * num2).toString());
        setAnswer2((num1 * num3).toString());
      }
      if(feilmeldingQuestion[typeFeil].split("|").elementAt(3)=='y'){
        setQuetionFeilmeldig3(
            feilmeldingQuestion[typeFeil].split("|").elementAt(1),
            feilmeldingQuestion[typeFeil].split("|").elementAt(2), num1, num2,'y',num3);

      }

      if (feilmeldingQuestion[typeFeil].split("|").elementAt(2) == '+'){
        setAnswer4((num1 + num2).toString());
        setAnswer2((num2+num3).toString());
      }
      if (feilmeldingQuestion[typeFeil].split("|").elementAt(2) == '-'){
        setAnswer4((num1 - num2).toString());
        setAnswer2((num2-num3).toString());
      }
      if (feilmeldingQuestion[typeFeil].split("|").elementAt(2) == '*'){
        setAnswer4((num1 * num2).toString());
        setAnswer2((num2 * num3).toString());
      }

      setCorrectAnswer('IndentationError');




    }
     setAnswer1(_correctAns);

     setAnswer3('x '+feilmeldingQuestion[typeFeil].split("|").elementAt(2)+' y');

     permuteAnswer();


  }

  void setQuetionFeilmeldig1(String funksjonsNavn, String operatorSymbol, int num1, int num2) {

    String que;

    que='Hva vil denne koden returnere ?|\n''def  ' +funksjonsNavn+'(x, y):\n'
    'return x '+operatorSymbol+' y '' \n'
    ''+funksjonsNavn+'('+num1.toString()+',' +num2.toString()+')';

    setQuestion(que);

  }

  void settAnsFeilmeldinger(int i, int j, String typeError) {

    _answer1=_correctAns;
    _answer2=i.toString();
    _answer3=j.toString();
    _answer4=typeError;

    permuteAnswer();

  }

  void setQuetionFeilmeldig2(String funksjonsNavn, String operetorSymbol, int num1, int num2) {

    String que;

    que='Hva vil denne koden returnere ?|\n'' x = '+num1.toString()+'\n y = '+num2.toString()+'\n def  ' +funksjonsNavn+'(x, y):\n'
        ' return x '+operetorSymbol+ ' y '' \n'
        ''+funksjonsNavn+'( x, y)';

    setQuestion(que);

  }

  void setQuetionFeilmeldig3(String funksjonsNavn, String operetorSymbol, int num1, int num2, String x,int num3) {

    String temp = 'x = ';
    if (x == 'x') {
      temp = 'x = ';
    }
    else{
      temp= 'y = ';
    }
    String que;


    que = 'Hva vil denne koden returnere ?|\n'' x = ' + num1.toString() + '\n y = ' + num2.toString() +
        '\n def  ' + funksjonsNavn + '(x, y):\n'
        ' ' + temp + '' +num3.toString()+'\n'
    '        return x '+operetorSymbol+' y '' \n'
        ' ' + funksjonsNavn + '( x,y )';

    setQuestion(que);
  }



  void quetsionType1(String funsksjonstype, String operatortype,String x, String y) {

    String newQuestion;

    newQuestion='|def '+funsksjonstype+'(x, y) : \n'
                 '   return '+x+' '+operatortype+' s'+y+'';

    setQuestion(newQuestion);

  }


  void inneBygdeFunksjonerQuestion() {
    setWidgetType("questionTypeB");

    List<String> funksjon = ['abs|Int','pow', 'sum','round'];

   // List<String> funksjon = ['round'];

    int func = randomInt(funksjon.length);


    // om man skal bruke heltall eller float , 0-> heltall, 1--> float


    // heltalls tall
    int x = randomInt(18) - 9;

    // Heltalls svar
    var ansInt;

    // float tall
    double y = randomInt(18) - 9 + randomDouble();
    double ansDouble;


    if (funksjon[func].split("|").elementAt(0) == 'abs') {
      if (funksjon[func].split("|").elementAt(1) == 'Int') {
        ansInt = (x.abs());
        setCorrectAnswer(ansInt.toString());
        setQuestion(' Hva returnerer den innebygde funksjonen \n    abs(' +
            x.toString() + ') ?');
      }
      else {
        ansDouble = (y.abs());
        ansDouble.roundToDouble();
        setCorrectAnswer(ansDouble.toStringAsPrecision(3));
        setQuestion(' Hva returnerer den innebygde funksjonen \n    abs(' +
            y.toStringAsPrecision(3) + ') ?');
      }
    }

    if (funksjon[func] == 'pow') {
      int e = randomInt(3);
      x = randomInt(8) - 4;
      ansInt = pow(x, e);
      setCorrectAnswer(ansInt.toString());
      setQuestion(' Hva returnerer den innebygde funksjonen \n    pow(' +
          x.toString() + ', ' + e.toString() + ' ) ?');
    }
    if (funksjon[func] == 'sum') {
      int x1 = randomInt(9);
      int x2 = randomInt(9);
      int x3 = randomInt(9);

      ansInt = x1 + x2 + x3;
      setCorrectAnswer(ansInt.toString());
      setQuestion(' Hva returnerer den innebygde funksjonen \n  '
          'x = (' + x1.toString() + ', ' + x2.toString() + ', ' +
          x3.toString() + ')\n'
          ' sum( x )  ?');
    }


    if (funksjon[func] == 'round') {
      int nr=randomInt(4);

      ansDouble = (y);

      if (nr == 0) {
        String b = y.toString().split(".").elementAt(1);
         var s=  b.substring(0,1);
         var c = int.tryParse(s);
        String q = y.toString().split(".").elementAt(0);

          var k = int.tryParse(q);
          if (c >= 5) {
              if (y > 0) {
              setCorrectAnswer('' + (k + 1).toString() + '.0');
              }
               else {
                 setCorrectAnswer('' + (k - 1).toString() + '.0');
               }
          }
          else {
              var d = y.toString().split(".").elementAt(0);

            setCorrectAnswer('' +d.toString()+'.0');
    }


        //setCorrectAnswer(ansDouble.toStringAsFixed(0));
        setQuestion(' Hva returnerer den innebygde funksjonen \n x = round(' +
            y.toStringAsPrecision(5) + ', ' + (nr).toString() + ') ?');
      }
      else {
        ansDouble = (y);
        if (ansDouble < 0) {
          setCorrectAnswer(ansDouble.toStringAsPrecision(nr + 2));
        }
        else {
          // ansDouble.roundToDouble();
          setCorrectAnswer(ansDouble.toStringAsPrecision(nr + 2));
        }
        setQuestion(
            ' Hva returnerer den innebygde funksjonen \n x = round(' +
                y.toStringAsPrecision(5) + ', ' + (nr + 1).toString() +
                ') ?');
      }
    }
  }

  ///
  /// Under her kommer spørsmål fra uke 4
 ///



  ///
  /// Metode som lager spørsmål om lengende til en streng,
  /// Inne holder en liste med strenger av ulike lengder
  /// Velger en tilfeldig streng fra listen som man finner lengden til
  ///

  void question_about_String_length(){

    setWidgetType('questionTypeB');

    /// liste med strenger av ulike lengder
    List<String> listMedStrenger =[
      'String','0','Character','sesongen','str()','kino','int()',
      'grønn','float()','apelsin','kan begynne','1','EOL','end of line','sluttspill',
      'hoppetau','3', '123','2',' rød ','en sol','rød','orange','streng',
      'variabler','blå','grønn','blå bil','lys år','en to tre','et hus'
      'grønne','epler','studenthybel','fjelltopp','tannkrem',' 1 ',' 3 ',' 1',' 3',
      'kaffe','kopp','sommer', ' vann','farger','blå ','lys','lomme','boken','gull'
      ,'bar', 'lys','år','år ','liv','båt','lomme','kniv','jul','ferie','grå',
      'sky','regn','tøy','jakke','te','kanne','vann',' vann '];


     print('Skriver antall ord i listen man bruker i len function : '+listMedStrenger.length.toString());
    // finner ut hvilke streng fra listMedstrenger
      int x = randomInt(listMedStrenger.length);


    // henter strengen man skal finne lengeden til fra listen med strenger
    String streng=listMedStrenger[x];




      setQuestion('Hva blir resultatet av kallet \n'

                    'len( "'+streng+'")   ?');
      setCorrectAnswer(streng.length.toString());

  }

  String getStrenger(int antallStrenger){

    int hentStrengNr;

    // Liste med to strenger
    List<String> to_Strenger =[
      'rød|sol','rød|orange','streng|variabler','blå|grønn'
      ,'grønne|epler','student|hybel','fjell|topp','tann|krem',
      'kaffe|kopp','sommer|ferie', 'vann|farger', 'blå|lys','lomme|bok','gull|bar',
       'lys|år', 'liv|båt', 'lomme|kniv','jule|ferie','grå|sky','regn|tøy','regn|jakke',
          'te|pose','te|kanne','te|vann','innebygd|funksjon','tre|topp'];

    print('listen med to ords lengde '+ to_Strenger.length.toString()+'');

    // liste med tre strenger
    List<String>  tre_strenger =['en|svart|hund','1|2|3','blå|gul|rød'
    ,'Hei|på|deg','Hei|og|hopp' ,'Dette|er en|streng'
    ,'tann|+|krem|', 'student|+|hybel','regn|+|jakke','lengden|til|huset'
    'casting|til|streng','end|of|line','A|B|C','brød|og|vann',
    'typen|til|heltall','sol|og|måne','lysår|fra|solen','den|blå|perioden',
    'gul|og|blå'];

    print('listen med tre ords lengde '+ tre_strenger.length.toString()+'');

    if(antallStrenger==2){
      hentStrengNr=randomInt(to_Strenger.length);

      return to_Strenger[hentStrengNr];
    }
    if(antallStrenger==3){
      hentStrengNr=randomInt(tre_strenger.length);

      return tre_strenger[hentStrengNr];
    }
    return '';
    }


    String getKonkaterneringsResultat(){

    int t=0;
      // Liste med ulike former for spørsmål, riktig,typeErro,NameErro,
    List<String>  konkaterneringsResultat = ['NameError','utenMellomRom','medMellomRom','SyntaxError1','SyntaxError2',
      'heleSetningRiktig', 'heleSetningUtenAppostroff','*'];


    print('listen med konkaterneringsResultater '+ konkaterneringsResultat.length.toString()+'');
    t = randomInt(konkaterneringsResultat.length);

    return konkaterneringsResultat[t];

    }



  void konkaterneringsQuestion_3_Strenger(){

    setWidgetType('questionTypeF');

    String heleStrengen = getStrenger(3);
    String ord1 = heleStrengen.split("|").elementAt(0);
    String ord2 = heleStrengen.split("|").elementAt(1);
    String ord3 = heleStrengen.split("|").elementAt(2);


    String konkaterneringsResultat=getKonkaterneringsResultat();

    // Sjekker elementet index 4 er lik 4, dvs det er fire stenger som skal settes sammen

    if (konkaterneringsResultat == '*') {
      // Lager spørsmål strengen
      setQuestion(
          'Konkatenering av strenger| Hva blir resultatet av denne kodelinjen : \n\n tekst = "'
              + ord1 + '"  +   "' + ord2 + '" *  "' + ord3 +
              '" ');

      //setter riktig svar
      setCorrectAnswer("TypeError: can't multiply sequence by non-int of type 'str'");

      setAnswer2('tekst = "' + ord1 + '' + ord2 + '' + ord3 + '"');

      setAnswer3('SyntaxError: EOL while scanning string literal ');


      setAnswer4('tekst = "' + ord1 + ' ' + ord2 + ' ' + ord3 + '" ');
    }

          if (konkaterneringsResultat == 'NameError') {
           // Lager spørsmål strengen
           setQuestion(
               'Konkatenering av strenger| Hva blir resultatet av denne kodelinjen : \n\n tekst = '
                   + ord1 + ' +   ' + ord2 + ' + ' + ord3 +
                   ' ');

           //setter riktig svar
           setCorrectAnswer("NameError: name '" + ord1 + "' is not defined");

           setAnswer2('tekst == "' + ord1 + '' + ord2 + '' + ord3 + '"');

           setAnswer3('SyntaxError: EOL while scanning string literal ');


           setAnswer4('tekst = "' + ord1 + ' ' + ord2 + ' ' + ord3 + '" ');
         }
         if (konkaterneringsResultat == 'utenMellomRom') {
           setQuestion(
               'Konkatenering av strenger| Hva blir resultatet av denne kodelinjen : \n\n tekst =  '
                   '"' + ord1 + '" +  "' + ord2 + '"  +  "' + ord3 +
                   '" ');

           setCorrectAnswer('tekst== "' + ord1 + '' + ord2 + '' + ord3 + '"');

           if(ord2=='+'){
           setAnswer2('tekst == "' + ord1 + '' + ord3 +'" ');
           }
           else{
             setAnswer2('tekst == "' + ord1 + ' ' + ord2 + ' ' + ord3 + '" ');}



           setAnswer3('SyntaxError: EOL while scanning string literal ');
           setAnswer4("NameError: name '" + ord1 + "' is not defined");
         }
         if (konkaterneringsResultat == 'medMellomRom') {
           setQuestion(
               'Konkatenering av strenger| Hva blir resultatet av denne kodelinjen : \n\n tekst =  '
                   ' " '+ ord1 + ' " + " ' + ord2 + ' "  +  " ' + ord3 +
                   ' " ');
           setCorrectAnswer(
               'tekst == " ' + ord1 + ' ' + ord2 + ' ' + ord3 + ' " ');
           if(ord2 =='+'){
             setAnswer2('tekst == "' + ord1 + '' + ord3 +'" ');
           }
             else{
             setAnswer2('tekst == " ' + ord1 + '' + ord2 + '' + ord3 + ' "');
           }
           setAnswer3('SyntaxError: EOL while scanning string literal ');
           setAnswer4("NameError: name '" + ord1 + "' is not defined");
         }
         if (konkaterneringsResultat == 'SyntaxError1') {
           setQuestion(
               'Konkatenering av strenger| Hva blir resultatet av denne kodelinjen : \n\n tekst =  '
                   '" ' + ord1 + '" + " ' + ord2 + '" + " ' + ord3 +
                   ' '' \n ');
           setCorrectAnswer('SyntaxError: EOL while scanning string literal ');
           setAnswer2('tekst == "' + ord1 + '' + ord2 + '' + ord3 + '"');
           setAnswer3('tekst == " ' + ord1 + ' ' + ord2 + ' ' + ord3 + ' " ');

           setAnswer4("NameError: name '" + ord1 + "' is not defined");
         }
         if (konkaterneringsResultat == 'SyntaxError2') {
           setQuestion(
               'Konkatenering av strenger| Hva blir resultatet av denne kodelinjen : \n\n tekst =  '
                   '' + ord1 + ' ' + ord2 + ' ' + ord3 + ' ');
           setCorrectAnswer('SyntaxError: invalid syntax ');
           setAnswer2('tekst == "' + ord1 + '' + ord2 + '' + ord3 + '"');
           setAnswer3('tekst == " ' + ord1 + ' ' + ord2 + ' ' + ord3 + ' " ');

           setAnswer4("NameError: name '" + ord1 + "' is not defined");
         }
         if (konkaterneringsResultat == 'heleSetningRiktig') {
           setQuestion(
               'Konkatenering av strenger| Hva blir resultatet av denne kodelinjen : \n\n tekst = " '
                    + ord1 + ' ' + ord2 + ' ' + ord3 +
                   ' "' '');

           setCorrectAnswer(
               'tekst == "' + ord1 + ' ' + ord2 + ' ' + ord3 + ' " ');
           setAnswer2('SyntaxError: invalid syntax ');
           setAnswer3('tekst == "' + ord1 + '' + ord2 + '' + ord3 + '"');
           setAnswer4("NameError: name '" + ord1 + "' is not defined");
         }

         if (konkaterneringsResultat == 'heleSetningUtenAppostroff') {
           setQuestion(
               'Konkatenering av strenger|Hva blir resultatet av denne kodelinjen : \n\n tekst =  '
                   + ord1 + '     ' + ord2 + '   ' + ord3 +
                   '"' );

           setCorrectAnswer('SyntaxError: invalid syntax');
           setAnswer2('tekst == "' + ord1 + ' ' + ord2 + ' ' + ord3 + '" ');
           setAnswer3('tekst == "' + ord1 + '' + ord2 + '' + ord3 + '"');
           setAnswer4("NameError: name '" + ord1 + "' is not defined");
         }

    setAnswer1(_correctAns);
    permuteAnswer();


  }

    void konkaterneringsQuestion_med_2_Strenger(){

      setWidgetType('questionTypeF');

      /// får streng fra metoden getStrenger
      String heleStrengen = getStrenger(2);

      String ord1 = heleStrengen.split("|").elementAt(0);
      String ord2 = heleStrengen.split("|").elementAt(1);



      String konkaterneringsResultat=getKonkaterneringsResultat();



    /// Spørsmål med strenger satt sammen av to ord

      if (konkaterneringsResultat == '*') {
        setQuestion(
            'Konkatenering av strenger| Hva blir resultatet av denne kodelinjen : \n\n tekst = "'
                + ord1 + '"   *   "' + ord2 + '"  ');

        //setter riktig svar
        setCorrectAnswer("TypeError: can't multiply sequence by non-int of type 'str' ");
        setAnswer2('tekst == "' + ord1 + '' + ord2 + ' "');

        setAnswer3('SyntaxError: EOL while scanning string literal ');


        setAnswer4('tekst == "' + ord1 + '  ' + ord2 + ' "');


      }


      if (konkaterneringsResultat == 'NameError') {
        // Lager spørsmål strengen
        setQuestion(
            'Konkatenering av strenger| Hva blir resultatet av denne kodelinjen : \n\n tekst = "'
                + ord1 + '" +   ' + ord2 + '  ');

        //setter riktig svar
        setCorrectAnswer("NameError: name '" + ord2 + "' is not defined");
        setAnswer2('tekst == "' + ord1 + '' + ord2 + ' "');

        setAnswer3('SyntaxError: EOL while scanning string literal ');


        setAnswer4('tekst == "' + ord1 + ' ' + ord2 + ' "');
      }
      if (konkaterneringsResultat == 'utenMellomRom') {

          setQuestion('Konkatenering av strenger| Hva blir : \n\n tekst =  '
              '"' + ord1 + '" +  "' + ord2 + '"');

        setCorrectAnswer('tekst = "' + ord1 + '' + ord2 + '"');

        setAnswer2('tekst == "' + ord1 + ' ' + ord2 + '"');
        setAnswer3('SyntaxError: EOL while scanning string literal ');
        setAnswer4("NameError: name '" + ord1 + "' is not defined");
      }
      if (konkaterneringsResultat == 'medMellomRom') {
        setQuestion('Konkatenering av strenger| Hva blir resultatet av denne kodelinjen : \n\n tekst =  '
            '"  ' + ord1 + '  " + "  ' + ord2 + '  "');
        setCorrectAnswer('tekst == " ' + ord1 + ' ' + ord2 + ' " ');
        setAnswer2('tekst == "' + ord1 + '' + ord2 + '"');
        setAnswer3('SyntaxError: EOL while scanning string literal ');
        setAnswer4("NameError: name '" + ord1 + "' is not defined");
      }

      if (konkaterneringsResultat == 'SyntaxError1') {
        setQuestion('Konkatenering av strenger|Hva blir resultatet av denne kodelinjen : \n\n tekst =  '
            '"' + ord1 + '" + " ' + ord2 + '');
        setCorrectAnswer('SyntaxError: EOL while scanning string literal ');
        setAnswer2('tekst == "' + ord1 + '' + ord2 + '"');
        setAnswer3('tekst == "' + ord1 + ' ' + ord2 + '" ');

        setAnswer4("NameError: name '" + ord1 + "' is not defined");
      }
      if (konkaterneringsResultat == 'SyntaxError2') {
        setQuestion('Konkatenering av strenger|Hva blir resultatet av denne kodelinjen : \n\n tekst =  '
            '' + ord1 + ' ' + ord2 + ' \n ');
        setCorrectAnswer('SyntaxError: invalid syntax ');
        setAnswer2('tekst == "' + ord1 + '' + ord2 + '"');
        setAnswer3('tekst == "' + ord1 + ' ' + ord2 + '" ');

        setAnswer4("NameError: name '" + ord1 + "' is not defined");
      }

      if (konkaterneringsResultat == 'heleSetningRiktig') {
        setQuestion('Konkatenering av strenger|Hva blir resultatet av denne kodelinjen : \n\n tekst = " '
            ' ' + ord1 + ' ' + ord2 + ' "');

        setCorrectAnswer('tekst == " ' + ord1 + ' ' + ord2 + ' "  ');
        setAnswer2('SyntaxError: invalid syntax ');
        setAnswer3('tekst == "' + ord1 + '' + ord2 + '"');
        setAnswer4("NameError: name '" + ord1 + "' is not defined");
      }


    if(konkaterneringsResultat=='heleSetningUtenAppostroff'){
      setQuestion('Konkatenering av strenger|Hva blir resultatet av denne kodelinjen : \n\n tekst =  '
          +ord1+ '     ' +ord2+  '');

      setCorrectAnswer('SyntaxError: invalid syntax' );
      setAnswer2('tekst == "' +ord1+ ' ' +ord2+ '" ');
      setAnswer3('tekst == "' +ord1+ '' +ord2+ '"');
      setAnswer4("NameError: name '" +ord1+ "' is not defined");

    }
       setAnswer1(_correctAns);
       permuteAnswer();
       }


       void konkaternering_med_2_heletall() {
         setWidgetType('questionTypeF');


         int tall1 = randomInt(10);
         int tall2 = randomInt(10);

         List<String> konkaterneringResultat =['heleStreng','nameError','beregning','toStrengerSammen',
         'Streng*heltall'];


         List<String> operatore = ['+', '*', '-', '/'];

         List<String> strenger_for_multi=['bly','bæ','blå','tøy','te','bø','ka'];



         int typeResultat = randomInt(konkaterneringResultat.length);


         String queStreng;
         if (konkaterneringResultat[typeResultat] == 'heleStreng') {
           queStreng = '' + tall1.toString() + ' + ' + tall2.toString() +
               '';
           setQuestion(
               ' Konkatenering av strenger|Hva blir resultatet av denne kodelinjen : \n\n tekst =  "'
                   + queStreng + '"');

           setCorrectAnswer(
               'tekst == "'+queStreng+'"');

           setAnswer1(_correctAns);
           setAnswer2('tekst == " ' + (tall1 + tall2).toString() + ' " ');
           setAnswer3(
               'tekst == " ' + tall1.toString() + '' + tall2.toString() + ' "');
           setAnswer4("NameError: name '" + tall1.toString() + "' is not defined");
         }

         if (konkaterneringResultat[typeResultat] == 'nameError') {
           queStreng = '' + tall1.toString() + ' + ' + tall2.toString() +
               '';
           setQuestion(
               'Konkatenering av strenger|Hva blir resultatet av denne kodelinjen : \n\n tekst =  " '
                   + queStreng + '');
           setCorrectAnswer(
               'SyntaxError: EOL while scanning string literal ');
            int tall3 = tall1+tall2;
           setAnswer2('tekst == " ' + tall3.toString() + ' " ');
           setAnswer3(
               'tekst == " ' + tall1.toString() + '' + tall2.toString() + ' "');
           setAnswer4('tekst == " ' + queStreng + ' "');
           setAnswer1(_correctAns);
         }

         if (konkaterneringResultat[typeResultat] == 'beregning') {
           int t = randomInt(operatore.length);

           setQuestion(
               ' Konkatenering av strenger|Hva blir resultatet av denne kodelinjen : \n\n tekst =  '
                   + tall1.toString() + ' ' + operatore[t] + ' ' +
                   tall2.toString() + '');
           if (operatore[t] == '+') {
             setCorrectAnswer(
                 'tekst == " ' + (tall1 + tall2).toString() + ' " ');
             setAnswer1(_correctAns);
             setAnswer3(
                 'tekst == "' + tall1.toString() + '' + tall2.toString() +
                     ' "');
             setAnswer4('SyntaxError: EOL while scanning string literal ');
             setAnswer2('tekst == "'+tall1.toString()+' '+operatore[t]+' '+tall2.toString()+'"');
           }
           if (operatore[t] == '-') {
             setCorrectAnswer(
                 'tekst == " ' + (tall1 - tall2).toString() + ' " ');
             setAnswer1(_correctAns);
             setAnswer3(
                 'tekst == " -' + tall1.toString() + '' + tall2.toString() +
                     ' "');
             setAnswer4("NameError: name '" + tall1.toString() + '" is not defined');
             setAnswer2(
                 'tekst == " ' + tall1.toString() + '-' + tall2.toString() +
                     ' "');

           }

           if (operatore[t] == '/') {
             if (tall2 == 0) {
               tall2 = randomInt(6) + 2;
             }
             tall1 = finnerTallDeleligY(tall1, tall2);
             setQuestion(
                 ' Konkatenering av strenger|Hva blir resultatet av denne kodelinjen : \n\n tekst =  '
                     + tall1.toString() + ' ' + operatore[t] + ' ' +
                     tall2.toString() + '');
             setCorrectAnswer(
                 'tekst == " ' + (tall1 / tall2).toString() + ' " ');
             setAnswer1(_correctAns);
             setAnswer3(
                 'tekst == " ' + tall1.toString() + '' + tall2.toString() +
                     ' "');
             setAnswer2('tekst == " ' + tall1.toString() + '/' + tall2.toString() +
                 ' "');
             setAnswer4("NameError: name '" + tall1.toString() + '" is not defined');
             
             
           }

           if (operatore[t] == '*') {
             setCorrectAnswer(
                 'tekst == " ' + (tall1 * tall2).toString() + ' " ');
             setAnswer1(_correctAns);
             String b = '';
             for (int i = 0; i < tall2; i++) {
               b = b + tall1.toString();
             }
              if(b==_correctAns){
               b='*'+tall1.toString()+'';
               setAnswer3("tekst == "+b+'"');
              }
             else {
                setAnswer3('tekst == " ' + b + ' "');
              }

             setAnswer2(
                 'tekst == " ' + tall1.toString() + ' ' + operatore[t] + ' ' +
                     tall2.toString() + ' " ');
             // setAnswer3('tekst = " '+tall1.toString()+''+tall2.toString()+' "');
             setAnswer4(
                 "NameError: name '" + tall1.toString() + ' is not defined');
           }

         }

         if (konkaterneringResultat[typeResultat]== 'toStrengerSammen') {
           setQuestion(
               'Konkatenering av strenger|Hva blir resultatet av denne kodelinjen : \n\n tekst =  "'
                   +tall1.toString()+'" + "'+tall2.toString()+ '"');


           setCorrectAnswer(
               'tekst == "' +tall1.toString()+''+tall2.toString()+'" ');
           setAnswer1(_correctAns);

           setAnswer4(
               "NameError: name '" + tall1.toString() + ' is not defined');

         setAnswer2(
             'tekst == " ' + tall1.toString() + ' + ' +
                 tall2.toString() + ' " ');
         setAnswer3('tekst == " '+(tall1 +tall2).toString()+' "');
       }
         if (konkaterneringResultat[typeResultat]== 'Streng*heltall') {

           String ord = strenger_for_multi[randomInt(
               strenger_for_multi.length)];
           int tall = randomInt(6);
           setQuestion(
               'Konkatenering av strenger|Hva blir resultatet av denne kodelinjen : \n\n tekst =  "'
                   + ord + '" * ' + tall.toString() + '');

           String b = '';
           for (int i = 0; i < tall; i++) {
             b = b + ord;
           }


           setCorrectAnswer(
               'tekst == "' + b + '" ');
           setAnswer1(_correctAns);

           setAnswer2(
               'tekst == " ' + ord + '*' +
                   tall.toString() + ' " ');
           setAnswer3('tekst == " ' + tall.toString() + '*'  + ord + ' "');
           setAnswer4(
               "NameError: name '" +ord+ ' is not defined');
         }



         permuteAnswer();



       }


       void printQestionStrenger(){

         List<String>  sprType = ['EOL','utenMellomRom','utenMellomRom_ogOperator',
          'SyntaxError','medMellomRom_ogOperator','medMellomRom_appostroff',
         'tekst'];

        // List<String>  sprType = ['tekst'];


         int t=randomInt(sprType.length);

         setWidgetType('questionTypeA');

         String heleStrengen = getStrenger(2);
         String ord1 = heleStrengen.split("|").elementAt(0);
         String ord2 = heleStrengen.split("|").elementAt(1);




         int medArgument=randomInt(2);
         if (sprType[t] == 'EOL') {
           // Lager spørsmål strengen
           if(medArgument==0){
           setQuestion(
               ' Hva  er reusltatet av print funksjonen:\n tekst = "'
                   + ord1 + '" + ' + ord2 + '" ' ' \n  print(tekst) ');

         }
         else{
             setQuestion(' Hva er resultatet av print funksjonen: \n'
                   ' \n   print("'+ ord1 + '"  +   ' + ord2 + ' ") ');
           }


         //setter riktig svar
         setCorrectAnswer('SyntaxError: EOL while scanning string literal ');

         setAnswer2('' + ord1 + '' + ord2 + '');

         setAnswer3('SyntaxError: EOL while scanning string literal ');
         setAnswer3("NameError: name '" + ord1 + "' is not defined");

         setAnswer4('' + ord1 + ' ' + ord2 + '');
         setAnswer1(_correctAns);

         }

         if (sprType[t] == 'utenMellomRom') {
           if (medArgument == 0) {
             setQuestion('Hva hva er resultatet av print funksjonen:\n tekst = "'
                  + ord1 + '" + "' + ord2 + '" \n print(tekst)');
           }
           else {
             setQuestion(' Hva er resultatet av print funksjonen: \n'
                  ' \n print("'+ord1 +'" + "' + ord2 + '") ');

           }
           setCorrectAnswer('' + ord1 + '' + ord2 + '');
             setAnswer2('' + ord1 + ' ' + ord2 + '');
             setAnswer3('SyntaxError: EOL while scanning string literal ');
             setAnswer4("NameError: name '" + ord1 + "' is not defined");
             setAnswer1(_correctAns);


         }
         if (sprType[t] == 'utenMellomRom_ogOperator') {
           if (medArgument == 0) {
             setQuestion('Hva er resultatet av print funksjonen:\n tekst = "'
                 + ord1 + '"   "' + ord2 + '" \n print(tekst)');
           }
           else {
             setQuestion(' Hva er resultatet av print funksjonen: \n'
                 ' \n print("'+ord1 +'"   "' + ord2 + '") ');

           }
           setCorrectAnswer('' + ord1 + '' + ord2 + '');
           setAnswer2('' + ord1 + ' ' + ord2 + '');
           setAnswer3('SyntaxError: EOL while scanning string literal ');
           setAnswer4("NameError: name '" + ord1 + "' is not defined");
           setAnswer1(_correctAns);


         }
         if (sprType[t] == 'SyntaxError') {
           if (medArgument == 0 || medArgument == 1)
             setQuestion(' Hva  er resultatet av print funksjonen: \n'
                 ' \n print( ' + ord1 + '   ' + ord2 + ' ) ');


           setCorrectAnswer('SyntaxError: invalid syntax');
           setAnswer2('' + ord1 + ' ' + ord2 + '');
           setAnswer3('' + ord1 + '' + ord2 + '');
           setAnswer4("NameError: name '" + ord1 + "' is not defined");
           setAnswer1(_correctAns);
         }

         if (sprType[t] == 'medMellomRom_ogOperator') {
           if (medArgument == 0) {
             setQuestion('Hva er resultatet av print funksjonen:\n tekst = " '
                 + ord1 + ' " + " ' + ord2 + ' " \n print(tekst)');
           }
           else {
             setQuestion(' Hva er reusltatet av print funksjonen: \n'
                 ' \n print(" '+ord1 +' "  +   " ' + ord2 + ' ") ');

           }
           setCorrectAnswer(' ' + ord1 + '  ' + ord2 + ' ');
           setAnswer2('' + ord1 + '' + ord2 + '');
           setAnswer3('SyntaxError: EOL while scanning string literal ');
           setAnswer4("NameError: name '" + ord1 + "' is not defined");
           setAnswer1(_correctAns);


         }


         if (sprType[t] == 'medMellomRom_appostroff') {
           if (medArgument == 0) {
             //i begynnelsen av setningen
             setQuestion('Hva er resultatet av print funksjonen:\n tekst = " '
                 + ord1 + '' + ord2 + ' \n print(tekst)');
           }
           else {
             //
             setQuestion(' Hva er resultatet av print funksjonen: \n'
                 ' \n print(" '+ord1 +'' + ord2 + ' ) ');
           }
           setCorrectAnswer('SyntaxError: EOL while scanning string literal ');
           setAnswer2('' + ord1 + '' + ord2 + '');
           setAnswer3(' ' + ord1 + '  ' + ord2 + ' ');
           setAnswer4("NameError: name '" + ord1 + "' is not defined");
           setAnswer1(_correctAns);
           }

         if (sprType[t] == 'tekst') {
           if (medArgument == 0) {
             //i begynnelsen av setningen
             setQuestion('Hva er resultatet av print funksjonen:\n\n tekst = "'
                 + ord1 + '' + ord2 + '" \n print("tekst")');
             setCorrectAnswer(' tekst');
             setAnswer4("NameError: name '" + ord1 + "' is not defined");
           }
           else{
             setQuestion('Hva er resultatet av print funksjonen:\n tekst = " '
                 + ord1 + '' + ord2 + '" \n print(Tekst)');
             setCorrectAnswer("NameError: name 'Tekst' is not defined");
             setAnswer4("Tekst");
           }
           setAnswer2('' + ord1 + '' + ord2 + '');
           setAnswer3(' ' + ord1 + '  ' + ord2 + ' ');
           setAnswer1(_correctAns);
         }




         permuteAnswer();

       }


       void printQuestionTall(){

         setWidgetType('questionTypePrintTall');


         int tall1 = randomInt(10);
         int tall2 = randomInt(10);

         int medArgument = randomInt(2);

        List<String> konkaterneringResultat = ['heleStreng','beregning', 'syntaxError','toStrengerSammen','Streng*heltall'];





         List<String> operatore = ['+', '*', '-', '/'];

         List<String> strenger_for_multi=['ly','bæ','ha','bo','lo','te','bø','ka'];

         int typeResultat = randomInt(konkaterneringResultat.length);


         String queStreng;
         if (konkaterneringResultat[typeResultat] == 'syntaxError') {
           queStreng = '' + tall1.toString() + ' + ' + tall2.toString() + '';

            if(medArgument==1) {
              setQuestion(
                  'Hva blir resultatet av denne kodelinjen: |tekst =  "' +
                      queStreng + '\n print(tekst)');
            }
            else{
              setQuestion('Hva blir resultatet print :\n |print('+queStreng+')');
            }
           setCorrectAnswer(
               "SyntaxError");

           setAnswer2('' + (tall1 + tall2).toString() + '  ');
           setAnswer3(
               ' ' + tall1.toString() + '' + tall2.toString() + '');
           setAnswer4('' + queStreng + '');
           setAnswer1(_correctAns);
         }


         if (konkaterneringResultat[typeResultat] == 'heleStreng') {
           queStreng = '' + tall1.toString() + ' + ' + tall2.toString() +
               '';
           if(medArgument==1) {
             setQuestion(
                 'Hva blir resultatet av denne kodelinjen :| tekst =  "'
                     + queStreng + '"' ' \n print(tekst) ?');
           }
           else {
             setQuestion(
                 'Hva blir resultatet av denne kodelinjen :\n |print(' +
                     queStreng + ') ?');
           }
           setCorrectAnswer(
               ''+queStreng+'');

           setAnswer1(_correctAns);
           setAnswer2('' + (tall1 + tall2).toString() + '');
           setAnswer3(
               '' + tall1.toString() + '' + tall2.toString() + '');
           setAnswer4("NameError");
         }



         if (konkaterneringResultat[typeResultat] == 'beregning') {

           int t = randomInt(operatore.length);
            if(medArgument==1){
           setQuestion(
               'Hva blir resultatet av  \n |tekst = '
                   + tall1.toString() + ' ' + operatore[t] + ' ' +
                   tall2.toString() + ' \n print(tekst)');
            }
            else{
              setQuestion('Hva blir resultatet av  \n |print('+ tall1.toString() + ' ' + operatore[t] + ' ' + tall2.toString()+ ')');
            }
           if (operatore[t] == '+') {
             setCorrectAnswer(
                 '' + (tall1 + tall2).toString() + '');
             setAnswer1(_correctAns);
             setAnswer3(
                 '' + tall1.toString() + '' + tall2.toString() +
                     ' ');
             setAnswer4('SyntaxError');
             setAnswer2(
                 '' + tall1.toString() + ' ' + operatore[t] + ' ' +
                     tall2.toString() + '');
           }
           if (operatore[t] == '-') {
             setCorrectAnswer(
                 '' + (tall1 - tall2).toString() + '');
             setAnswer1(_correctAns);
             setAnswer3(
                 '-' + tall1.toString() + '' + tall2.toString() +
                     ' ');
             setAnswer4(
                 "NameError");
             setAnswer2(
                 '' + tall1.toString() + '-' + tall2.toString() +
                     '');
           }


           if (operatore[t] == '/') {
             if (tall2 == 0) {
               tall2 = randomInt(6) + 2;
             }
             tall1 = finnerTallDeleligY(tall1, tall2);
             setQuestion(
                 '""|Hva blir resultatet av print('
                     + tall1.toString() + ' ' + operatore[t] + ' ' +
                     tall2.toString() + ')');
             setCorrectAnswer(
                 '' + (tall1 / tall2).toString() + '');
             setAnswer1(_correctAns);
             setAnswer3(
                 '' + tall1.toString() + '' + tall2.toString() +
                     '');
             setAnswer2('' + tall1.toString() + '/' + tall2.toString() +
                 '');
             setAnswer4("NameError");


           }

           if (operatore[t] == '*') {
             setCorrectAnswer(
                 'tekst == " ' + (tall1 * tall2).toString() + ' " ');
             setAnswer1(_correctAns);
             String b = '';
             for (int i = 0; i < tall2; i++) {
               b = b + tall1.toString();
             }
             if(b==_correctAns){
               b='*'+tall1.toString()+'';
               //' +b+';
             }

             setAnswer3('" ' + b + '');

             setAnswer2(
                 '' + tall1.toString() + ' ' + operatore[t] + ' ' +
                     tall2.toString() + '');
             // setAnswer3('tekst = " '+tall1.toString()+''+tall2.toString()+' "');
             setAnswer4(
                 "NameError");
           }

         }
         if (konkaterneringResultat[typeResultat]== 'toStrengerSammen') {
           if(medArgument==1) {
             setQuestion(
                 '""|Hva blir resultatet av denne kodelinjen : \n tekst =  "'
                     + tall1.toString() + '" + "' + tall2.toString() + '" \n '
                     'print(tekst)');
           }
           else{
             setQuestion(
                 ' |Hva blir resultatet av denne kodelinjen :\n'
                     'print('+ tall1.toString() + ' + ' + tall2.toString() + ')');
           }

           setCorrectAnswer(
               '' +tall1.toString()+''+tall2.toString()+'');
           setAnswer1(_correctAns);

           setAnswer4(
               "NameError");

           setAnswer2(
               '' + tall1.toString() + ' + ' +
                   tall2.toString() + '');
           setAnswer3('SyntaxError');
         }
         if (konkaterneringResultat[typeResultat]== 'Streng*heltall') {


           String ord = strenger_for_multi[randomInt(
               strenger_for_multi.length)];
           int tall = randomInt(5);
           setQuestion(
               '|Hva blir resultatet av denne kodelinjen : \n\n tekst =  "'
                   + ord + '" * ' + tall.toString() + '  \n print(tekst)');

           String b = '';
           for (int i = 0; i < tall; i++) {
             b = b + ord;
           }


           setCorrectAnswer(
               '' + b + '');
           setAnswer1(_correctAns);

           setAnswer2(
               '' + ord + '*' +
                   tall.toString() + '');
           setAnswer3('' + tall.toString() + '*' + ord + '');
           setAnswer4(
               "NameError");
         }







         permuteAnswer();


         }


  void setAnswer1(String ans1) {
    _answer1=ans1;
  }

  void setAnswer2(String ans2) {
    _answer2=ans2;
  }

  void setAnswer3(String ans3) {
    _answer3 =ans3;
  }

  void setAnswer4(String ans4) {
    _answer4=ans4;
  }

  //ikke noe god måte å gjøre dette på, en kjapp og dårlig løsning, men funker for
  void makeAnsAlternativeDouble(var answer) {

    List<String> answerList = new List(6);

    int b = randomInt(6);


    double riktigSvar = answer ;

     if(riktigSvar.toStringAsFixed(1) == '-0.0'){
      riktigSvar =0.0;
     }
     else {
       setCorrectAnswer(riktigSvar.toStringAsFixed(1));
     }
    
    answerList[b] = riktigSvar.toStringAsFixed(1);
         // plasser det riktige svar på en tilfeldig plass i listen

    var ansAlternative;


    setCorrectAnswer(answerList[b].toString());

    for (int i = 0; i < answerList.length; i++) {
      if (i != b) {

           ansAlternative= ((randomInt(9) - 5)+answer).toDouble().toStringAsFixed(1);
        while (isInAnswerAlternative(ansAlternative, answerList)) {
          ansAlternative = ((randomInt(9) - 5) + answer).toDouble().toStringAsFixed(1);
        }

        print('skriver ut ansAlternative '+ansAlternative.toString());
        answerList[i] = ansAlternative.toString();
      }
    }

    /* DETTE MÅ GJØRES PÅ EN ANNEN MÅTE ? */
    _answer1 = answerList.elementAt(0);
    _answer2 = answerList.elementAt(1);
    _answer3 = answerList.elementAt(2);
    _answer4 = answerList.elementAt(3);
    _answer5 = answerList.elementAt(4);
    _answer6 = answerList.elementAt(5);
  }

  }





