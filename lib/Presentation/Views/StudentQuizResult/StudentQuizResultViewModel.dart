

import 'package:english_quiz/Presentation/_CommonModels/LocalQuizModel.dart';
import 'package:flutter/material.dart';

class StudentQuizResultViewModel extends ChangeNotifier{

  LocalQuizModel _quizModel = LocalQuizModel.instance;

  int get quizQLength => _quizModel.quizModel!.questions.length;

  int get quizResult{
    int sum = 0;
    for(var question in _quizModel.quizModel!.questions){
      for(var answer in question.answers){
        if(answer.isSelected && answer.isCorrect) sum++;
      }
    }
    return sum;
  }


  void disposeQuizModel(){
    LocalQuizModel.myDispose();
  }




}