import 'package:english_quiz/Models/Guid.dart';

import 'AnswerModel.dart';

class QuestionModel{
  Guid id;
  String qText;
  List<Answer> answers;

  QuestionModel({
    required this.id,
    required this.qText,
    required this.answers,
  });


}