import 'dart:async';

import 'package:english_quiz/Presentation/_CommonModels/LocalQuizModel.dart';
import 'package:english_quiz/Presentation/_Resources/RouteManager.dart';
import 'package:flutter/material.dart';

class StudentQuizViewModel extends ChangeNotifier{

  LocalQuizModel _quizModel = LocalQuizModel.instance;

  late Duration _quizTime;

  late Timer _countDownTimer;

  int get getQuestionCount => _quizModel.quizModel!.questions.length;
  String get timerMinutes => _strDigits(_quizTime.inMinutes.remainder(60));
  String get timerSeconds => _strDigits(_quizTime.inSeconds.remainder(60));


  void startTimer(){
    _quizTime = Duration(minutes:_quizModel.quizModel!.duration);
    _countDownTimer = Timer.periodic(const Duration(seconds: 1), (_) =>
      _countDown());
  }

  void _countDown(){
    int currentDuration = _quizTime.inSeconds -1;
    currentDuration.isNegative ? _stopCounter():
    _quizTime = Duration(seconds: currentDuration);
    notifyListeners();
  }

  void _stopCounter() {
    _countDownTimer.cancel();
  }

  String _strDigits(int num) => num.toString().padLeft(2,"0");

  void submitQuiz(){
    _countDownTimer.cancel();
    //TODO: do the submission login to the API;
  }

  void endQuiz(BuildContext context){
    Navigator.pushReplacementNamed(context, RouteManager.studentQuizResult);
  }



}