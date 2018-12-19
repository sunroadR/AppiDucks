import 'package:appi_ducks/database/model/question.dart';
import 'package:appi_ducks/page/ui/question_type_b.dart';
import 'dart:math';

class MatteUke1 {

  // random
  var random = new Random();


  // 1.2.1
  Future<Question> division1() async{

    // tilfeldige tall mellom 0-50
    int t =random.nextInt(50);

    print(t);

    // tilfeldige tall mellom 0-49, men legger til en slik at  man ikke får deling med 0
    int n =random.nextInt(49)+1;

    // Deler
    var j = (t/n);

    int a= j.toInt();

    var b =a+1;
    var c =a+2;
    var d = a-1;
    var e = a-2;
    var f = -a;

    return new Question("1.2.1", "Hva blir "+t.toString()+ "// " +n.toString()+" ?",
        ""+a.toString()+"",""+c.toString()+"",""+d.toString()+"",""+b.toString()+"",""+e.toString()+"",
        ""+f.toString()+"",""+a.toString()+"","QuestionTypeC");
  }

  // 1.2.2
  Future<Question> divisionNeg() async{

    // tilfeldige tall mellom -1-49
   final int k =random.nextInt(50);

     var t = -k;

    // tilfeldige tall mellom 0-49, men legger til en slik at  man ikke får deling med 0
    int n =random.nextInt(49)+1;


    // Deler
    var j = t/n;

    int a =j.toInt();
    var b =a+1;
    var c =a+2;
    var d = a-1;
    var e = a-2;
    var f = -a;

    return new Question("1.2.1", "Hva blir "+t.toString()+ "// " +n.toString()+" ?",
        ""+b.toString()+"",""+c.toString()+"",""+d.toString()+"",""+a.toString()+"",""+e.toString()+"",
        ""+f.toString()+"",""+a.toString()+"","QuestionTypeC");

  }

  // 1.2.3
  Future<Question> divisionNeg2() async{

    // tilfeldige tall mellom  0-50
    final int t =random.nextInt(50);



    // tilfeldige tall mellom 0-49, men legger til en slik at  man ikke får deling med 0
    int k =random.nextInt(49)+1;
    int n = -k;

    // Deler
    var j = t/n;

    int a =j.toInt();
    var b =a+1;
    var c =a+2;
    var d = a-1;
    var e = a-2;
    var f = -a;

    return new Question("1.2.1", "Hva blir "+t.toString()+ "// " +n.toString()+" ?",
        ""+b.toString()+"",""+c.toString()+"",""+d.toString()+"",""+e.toString()+"",""+a.toString()+"",
        ""+f.toString()+"",""+a.toString()+"","QuestionTypeC");

  }

  Future<Question> divisionNeg3() async{

    // tilfeldige tall mellom  0-50
    final int t =random.nextInt(50);



    // tilfeldige tall mellom 0-49, men legger til en slik at  man ikke får deling med 0
    int k =random.nextInt(49)+1;
    int n = -k;

    // Deler
    var j = t/n;

    int a =j.toInt();
    var b =a+1;
    var c =a+2;
    var d = a-1;
    var e = a-2;
    var f = -a;

    return new Question("1.2.1", "Hva blir "+t.toString()+ "// " +n.toString()+" ?",
        ""+c.toString()+"",""+a.toString()+"",""+d.toString()+"",""+e.toString()+"",""+b.toString()+"",
        ""+f.toString()+"",""+a.toString()+"","QuestionTypeC");

  }
  Future<Question> divisionNeg4() async{

    // tilfeldige tall mellom  0-50
    final int s =random.nextInt(50);

    int t = -s;

    // tilfeldige tall mellom 0-49, men legger til en slik at  man ikke får deling med 0
    int k =random.nextInt(49)+1;
    int n = -k;

    // Deler
    var j = t/n;

    int a =j.toInt();
    var b =a+1;
    var c =a+2;
    var d = a-1;
    var e = a-2;
    var f = -a;

    return new Question("1.2.1", "Hva blir "+t.toString()+ "// " +n.toString()+" ?",
        ""+b.toString()+"",""+c.toString()+"",""+d.toString()+"",""+e.toString()+"",""+f.toString()+"",
        ""+a.toString()+"",""+a.toString()+"","QuestionTypeC");

  }

// modulo 1.2.5
  Future<Question> modulo1() async{

    // tilfeldige tall mellom  0-50
    final int t =random.nextInt(50);



    // tilfeldige tall mellom 0-49, men legger til en slik at  man ikke får deling med 0
    int n =random.nextInt(49)+1;


    // Deler
    var a = t%n;



    return new Question("1.2.1", "Hva blir "+t.toString()+ " modulo " +n.toString()+"?",
        "","","","","",
       "" ,""+a.toString()+"","QuestionTypeB");

  }

  // modulo 1.2.6
  Future<Question> modulo2() async{

    // tilfeldige tall mellom  0-50
    final int t =random.nextInt(50);



    // tilfeldige tall mellom 0-49, men legger til en slik at  man ikke får deling med 0
    int n =random.nextInt(49)+1;


    int a= t%n;

    return new Question("1.2.1", "Hva blir "+t.toString()+" modulo "+n.toString()+"?",
        "","","","","",
        "" ,""+a.toString()+"","QuestionTypeB");

  }

  // modulo 1.2.7
  Future<Question> modulo3() async{

    // tilfeldige tall mellom  0-50
    final int t =random.nextInt(50);



    // tilfeldige tall mellom 0-49, men legger til en slik at  man ikke får deling med 0
    int n =random.nextInt(49)+1;

    int a=(-t)%n;

    return new Question("1.2.1", "Hva blir  modulo "+t.toString()+ "mod  " +n.toString()+" ?",
        "","","","","",
        "" ,""+a.toString()+"","QuestionTypeB");

  }

}