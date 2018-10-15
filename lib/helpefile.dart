
import 'package:flutter/material.dart';

import 'package:appi_ducks/database/database_helper.dart';
import 'package:appi_ducks/database/question.dart';
class HelpeFile{


  DataBaseHelper db = new DataBaseHelper();

  void leggNyeSpr(){
  db.saveQuestion(new Question('1.1.1','Hva er et program ?' ,'Python','Matte oppgaver','set med variabler','set med instruksjoner'
      ,'' ,'','set med instruksjoner' ,'QuestionTypeA'));
  db.saveQuestion(new Question('1.1.3', 'Hvilke type er [int = [-50 til 100]]?','','','','','','','int','QuestionTypeB' ));
  db.saveQuestion(new Question('1.1.8','Hva menes med denne feilmeldingen? print(''Helo world) ^ SyntaxError: EOL while scanning string literal',
      'Mangler utropstegn','feil type quote mark','feilstavet Helo','mangler quote etter world','','','mangler quote etter world', 'QuestionTypeC'));




}


}