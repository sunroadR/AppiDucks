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
    this._answer1 == obj['answer1']; //TODO == vs = ?
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

  /// takes a parameter on the form //TODO clean up documentation
  /// "uniqID:X.Y.Z pageType:<question type> que:<question text> [correctAns:<answer text>]? [ans: <alternative answers>]*"
  ///
  /// example argument "uniqID:1.2.8 pageType:questionTypeC que:% correctAns: ans1: ans2: ans3: ans4: ans5: ans6:"
  /// example argument "uniqID:1.2.8 pageType:questionTypeC que:%"
  Question.fromString(v) {
    List<String> args = v.split(" "); //TODO erstatt " " med space encoding eller annet tegn
    removeEmptyArguments(args);
    Map<String, String> fields = new Map.fromIterable(args,
        key: (item) => item.toString().split(":").elementAt(0),
        value: (item) => item.toString().split(":").elementAt(1)
    );
    //TODO sjekk input: må ha unik id, spørsmålstekst og pagetype
    this._uniqId = '${fields['uniqID']}';
    this._question = '${fields['que']}';
    this._answer1 = '${fields['ans1']}';
    this._answer2 = '${fields['ans2']}';
    this._answer3 = '${fields['ans3']}';
    this._answer4 = '${fields['ans4']}';
    this._answer5 = '${fields['ans5']}';
    this._answer6 = '${fields['ans6']}';
    this._corectAns ='${fields['correctAns']}';
    this._pageWidget ='${fields['pageType']}';
  }

  void removeEmptyArguments(List<String> args) {
    args.removeWhere((s) => (s.length < 1) | !s.contains(":"));
  }
}
