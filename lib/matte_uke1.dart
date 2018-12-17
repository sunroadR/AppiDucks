import 'package:appi_ducks/database/model/question.dart';
import 'package:appi_ducks/page/ui/question_type_b.dart';
import 'dart:math';

class MatteUke1 {



  Future<Question> division1() async{

    // random
    var random = new Random();

    // tilfeldige tall mellom 0-50
    var t =random.nextInt(50);

    print(t);


    // tilfeldige tall mellom 0-49, men legger til en slik at  man ikke får deling med 0
    var n =random.nextInt(49)+1;
    
    print(n);

    print('skrev ut t og n');
    // Deler
    var a = t/n;

    String ques="Hva blir "+t.toString()+ "// " +n.toString()+" ?";

    print(ques);

      // runder av til nærmeste hel tall
     var ans= a.floor();

   Question question = new Question("1.2.1", "Hva blir "+t.toString()+ "// " +n.toString()+" ?", "","","","","", "",ans.toString(),"QuestionTypeB");
     // returner et Question av typeB 
    
     return question;
     
}




}