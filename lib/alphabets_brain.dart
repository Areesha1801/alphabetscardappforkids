import 'alphabets.dart';

class AlphabetBrain {
  int _alphabetNumber = 0;

  final List<Alphabets> _capsalphabetsBank = [
    Alphabets('A', true),
    Alphabets('B', true),
    Alphabets('C', true),
    Alphabets('D', true),
    Alphabets('E', true),
    Alphabets('F', true),
    Alphabets('G', true),
    Alphabets('H', true),
    Alphabets('I', true),
    Alphabets('J', true),
    Alphabets('K', true),
    Alphabets('L', true),
    Alphabets('M', true),
    Alphabets('N', true),
    Alphabets('O', true),
    Alphabets('P', true),
    Alphabets('Q', true),
    Alphabets('R', true),
    Alphabets('S', true),
    Alphabets('T', true),
    Alphabets('U', true),
    Alphabets('V', true),
    Alphabets('W', true),
    Alphabets('X', true),
    Alphabets('Y', true),
    Alphabets('Z', true),
  ];
  //Create Next Question Function
  void nextQuestion() {
    if (_alphabetNumber < _capsalphabetsBank.length - 1) {
      _alphabetNumber++;
    }
  }

  String getQuestionText() {
    return _capsalphabetsBank[_alphabetNumber].alphabetText;
  }

  bool getCorrectAnswer() {
    return _capsalphabetsBank[_alphabetNumber].control;
  }

  bool isFinished() {
    if (_alphabetNumber >= _capsalphabetsBank.length - 1) {
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
