import 'package:english_quiz/Models/QuestionModel.dart';
import 'package:english_quiz/Presentation/_CommonModels/LocalQuizModel.dart';
import 'package:flutter/material.dart';

class TeacherEditQuizViewModel extends ChangeNotifier{

  LocalQuizModel _quizModel = LocalQuizModel();


  List<QuestionModel> get questions => _quizModel.quizModel!.questions;



}