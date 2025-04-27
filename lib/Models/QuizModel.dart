import 'package:english_quiz/Models/Guid.dart';
import 'QuestionModel.dart';

class QuizModel{
  Guid id;
  String creationTime;
  int duration;
  String expiryDate;
  List<QuestionModel> questions;
  List<Guid> requiredStudents;
  List<Guid> testedStudents;

  QuizModel({
    required this.id,
    required this.creationTime,
    required this.duration,
    required this.expiryDate,
    required this.questions,
    required this.requiredStudents,
    required this.testedStudents,
  });
}


