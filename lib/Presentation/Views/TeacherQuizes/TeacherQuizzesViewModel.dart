import 'package:english_quiz/Models/Guid.dart';
import 'package:english_quiz/Presentation/_CommonModels/LocalQuizModel.dart';
import 'package:english_quiz/Repository/Remote/Repository.dart';
import 'package:flutter/material.dart';
import '../../../Models/AnswerModel.dart';
import '../../../Models/QuestionModel.dart';
import '../../../Models/QuizModel.dart';

class TeacherQuizzesViewModel extends ChangeNotifier{
  Repository myRepo = Repository();

  final QuizModel templateQuizModel =QuizModel(id: Guid("1"), creationTime: 'now', duration: 30,
      expiryDate: 'now', questions: [
        QuestionModel(id: Guid("1"), qText: "qText", answers: [
          Answer(id: Guid("1"), aText: "aText", isCorrect: true, isSelected: false),
          Answer(id: Guid("1"), aText: "aText", isCorrect: false, isSelected: false),
        ])], requiredStudents: [], testedStudents: []);


  final List<QuizModel> _quizzes = [
    for(var i = 0; i <10; i++)
      QuizModel(
          id: Guid("${i}"),
          creationTime: "now",
          questions: [
            QuestionModel(id: Guid("1"), qText: "${i} first Q", answers: [
              Answer(id: Guid("1"), aText: "First 1", isCorrect: true, isSelected: false),
              Answer(id: Guid("2"), aText: "First 2", isCorrect: false, isSelected: true),
              Answer(id: Guid("3"), aText: "First 3", isCorrect: false, isSelected: false),
              Answer(id: Guid("4"), aText: "First 4", isCorrect: false, isSelected: false),
            ]),
            QuestionModel(id: Guid("2"), qText: "Second Q", answers: [
              Answer(id: Guid("1"), aText: "Second 1", isCorrect: false, isSelected: false),
              Answer(id: Guid("2"), aText: "Second 2", isCorrect: false, isSelected: true),
              Answer(id: Guid("3"), aText: "Second 3", isCorrect: true, isSelected: false),
              Answer(id: Guid("4"), aText: "Second 4", isCorrect: false, isSelected: false),
            ]),
            QuestionModel(id: Guid("3"), qText: "Third Q", answers: [
              Answer(id: Guid("1"), aText: "Third 1", isCorrect: false, isSelected: false),
              Answer(id: Guid("2"), aText: "Third 2", isCorrect: false, isSelected: true),
              Answer(id: Guid("3"), aText: "Third 3", isCorrect: false, isSelected: false),
              Answer(id: Guid("4"), aText: "Third 4", isCorrect: true, isSelected: false),
            ])],
          duration: 20,expiryDate: "test",requiredStudents: [],testedStudents: [])
  ];

  List<QuizModel> get quizzes => _quizzes;


  void fetchQuizzes() async{
    //TODO: do the fetch logic and put it in _quizzes.
    myRepo.getAllStudentQuizzes();
  }

  void saveQuizInfoLocally(QuizModel model){
    LocalQuizModel info = LocalQuizModel(model: model);

  }






}