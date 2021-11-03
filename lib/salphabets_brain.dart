import 'alphabets.dart';

class SAlphabetBrain {
  int _alphabetNumber = 0;

  final List<Alphabets> _smallalphabetsBank = [
    Alphabets('a', true),
    Alphabets('b', true),
    Alphabets('c', true),
    Alphabets('d', true),
    Alphabets('e', true),
    Alphabets('f', true),
    Alphabets('g', true),
    Alphabets('h', true),
    Alphabets('i', true),
    Alphabets('j', true),
    Alphabets('k', true),
    Alphabets('l', true),
    Alphabets('m', true),
    Alphabets('n', true),
    Alphabets('o', true),
    Alphabets('p', true),
    Alphabets('q', true),
    Alphabets('r', true),
    Alphabets('s', true),
    Alphabets('t', true),
    Alphabets('u', true),
    Alphabets('v', true),
    Alphabets('w', true),
    Alphabets('x', true),
    Alphabets('y', true),
    Alphabets('z', true),
  ];
  //Create Next Question Function
  void nextQuestion() {
    if (_alphabetNumber < _smallalphabetsBank.length - 1) {
      _alphabetNumber++;
    }
  }

  String getQuestionText() {
    return _smallalphabetsBank[_alphabetNumber].alphabetText;
  }

  bool getCorrectAnswer() {
    return _smallalphabetsBank[_alphabetNumber].control;
  }

  bool isFinished() {
    if (_alphabetNumber >= _smallalphabetsBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  int endCheck() {
    return _alphabetNumber;
  }

  void reset() {
    _alphabetNumber = 0;
  }
}

//  void nextQuestion() {
//    if (_questionNumber < _questionBank.length - 1) {
//      _questionNumber++;
//    }
//  }
//
//  String getQuestionText() {
//    return _questionBank[_questionNumber].questionText;
//  }
//
//  bool getCorrectAnswer() {
//    return _questionBank[_questionNumber].questionAnswer;
//  }

//TODO: Step 3 Part A - Create a method called isFinished() here that checks to see if we have reached the last question. It should return (have an output) true if we've reached the last question and it should return false if we're not there yet.

//TODO: Step 3 Part B - Use a print statement to check that isFinished is returning true when you are indeed at the end of the quiz and when a restart should happen.

//TODO: Step 4 Part B - Create a reset() method here that sets the questionNumber back to 0.
//}
