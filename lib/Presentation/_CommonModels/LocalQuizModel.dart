import 'package:english_quiz/Models/QuizModel.dart';
import 'package:flutter/material.dart';

class LocalQuizModel extends ChangeNotifier{
  LocalQuizModel._private();
  QuizModel? _quizModel;

  static final LocalQuizModel _instance = LocalQuizModel._private();


  static LocalQuizModel get instance => _instance;

  QuizModel? get quizModel => _quizModel;

  factory LocalQuizModel({QuizModel? model}) {
    _instance._quizModel??= model;
    return _instance;
  }

  static void myDispose(){
    instance._quizModel =null;
  }
}