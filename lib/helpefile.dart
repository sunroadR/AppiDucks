import 'package:flutter/material.dart';

import 'package:appi_ducks/database/database_helper.dart';
import 'package:appi_ducks/database/model/question.dart';

// En midlertidig klasse med en metode for å legge inn spørsmøl i databasen
class HelpeFile {
  DataBaseHelper db = new DataBaseHelper();

  void leggNyeSpr() {
    db.saveQuestion(new Question(
        '1.1.1',
        'Hva er et program ?',
        'Python',
        'Matte oppgaver',
        'set med variabler',
        'set med instruksjoner',
        '',
        '',
        'set med instruksjoner',

        'QuestionTypeA'));
    db.saveQuestion(new Question('1.1.2', 'Hva blir (-2)**4 ?', '-16', '16',
        '8', '-8', '6', '-6', '16', 'QuestionTypeC'));
    db.saveQuestion(new Question('1.1.3', 'Hvilke type er 78 ?', 'Int',
        'Variable', 'Number', 'Float', '', '', 'int', 'QuestionTypeA'));
    db.saveQuestion(new Question(
        '1.1.8',
        'Hva menes med denne feilmeldingen? print('
        'Helo world) ^ SyntaxError: EOL while scanning string literal',
        'Mangler utropstegn',
        'feil type quote mark',
        'feilstavet Helo',
        'mangler quote etter world',
        '',
        '',
        'mangler quote etter world',

        'QuestionTypeA'));
    db.saveQuestion(new Question('1.1.4','Hvordan ser paranteser ut ?','//','()','>>','[]','{}','< >','()','QuestionTypeC'));
    
  }
  
}
