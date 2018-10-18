class Question {
  int id;
  String _uniqId;
  String _question;
  String _answer1;
  String _answer2;
  String _answer3;
  String _answer4;
  String _answer5;
  String _answer6;
  String _corectAns;
  bool   _firstTime=true;
  String _pageWidget;

  Question(
      this._uniqId,
      this._question,
      this._answer1,
      this._answer2,
      this._answer3,
      this._answer4,
      this._answer5,
      this._answer6,
      this._corectAns,
      this._pageWidget);

  Question.map(dynamic obj) {
    this._uniqId = obj['uniqId'];
    this._question = obj['question'];
    this._answer1 == obj['answer1'];
    this._answer2 == obj['answer2'];
    this._answer3 == obj['answer3'];
    this._answer4 == obj['answer4'];
    this._answer5 == obj['answer5'];
    this._answer6 == obj['answer6'];
    this._corectAns == obj['correctAns'];
    this._pageWidget == obj['pageWidget'];
  }

  String get uniqId => _uniqId;

  String get question => _question;

  String get answer1 => _answer1;

  String get answer2 => _answer2;

  String get answer3 => _answer3;

  String get answer4 => _answer4;

  String get answer5 => _answer5;

  String get answer6 => _answer6;

  String get pageWidget => _pageWidget;

  String get correctAns => _corectAns;

  bool get firstTime => _firstTime;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map['uniqId'] = _uniqId;
    map['question'] = _question;
    map['answer1'] = _answer1;
    map['answer2'] = _answer2;
    map['answer3'] = _answer3;
    map['answer4'] = _answer4;
    map['answer5'] = _answer5;
    map['answer6'] = _answer5;
    map['correctAns'] = _corectAns;
    map['firstTime']=_firstTime;
    map['pageWigdet'] = _pageWidget;

    return map;
  }

  void setId(int id) {
    this.id = id;
  }

  void setFirstTime() {
    _firstTime = false;
  }
}
