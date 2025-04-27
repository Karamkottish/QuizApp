import 'package:english_quiz/Models/Guid.dart';

class Answer{
  Guid id;
  String aText;
  bool isCorrect;
  bool isSelected;

  Answer({
    required this.id,
    required this.aText,
    required this.isCorrect,
    required this.isSelected,
  });
}