import 'package:appi_ducks/database/model/question.dart';
import 'package:appi_ducks/page/ui/question_type_b.dart';
import 'dart:math';

class MatteUke1 {



  Question division1(){

    // random
    var random = new Random();

    // tilfeldige tall mellom 0-50
    int t =random.nextInt(50);

    // tilfeldige tall mellom 0-49, men legger til en slik at  man ikke får deling med 0
    int n =random.nextInt(49)+1;

    // Deler
    var a = t/n;
      
      
      // runder av til nærmeste hel tall
     int ans= a.floor();
     
     // returner et Question av typeB 
    
     return new Question("1.2.1", "Hva blir "+t.toString()+ "// " +n.toString()+" ?", "","","","","", "",ans.toString(),"pageTypeB");
     
}




}