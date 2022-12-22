import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionList = [
    Question(
        questionText: 'You can lead a cow down stairs but not up stairs.',
        questionAnswer: false),
    Question(
        questionText: 'Approximately one quarter of human bones are in the feet.',
        questionAnswer: true),
    Question(questionText: 'A slug\'s blood is green.', questionAnswer: true)
  ];

  void NextQuestion() {
    if (_questionNumber < _questionList.length - 1) _questionNumber++;
  }

  String GetQuestionText() {
    return _questionList[_questionNumber].questionText;
  }

  bool GetQuestionAnswer() {
    return _questionList[_questionNumber].questionAnswer;
  }

  bool IsFinished() {
    if (_questionNumber == _questionList.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void Reset() {
    _questionNumber = 0;
  }
}
