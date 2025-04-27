import 'package:english_quiz/Models/Guid.dart';
import 'package:english_quiz/Models/QuizModel.dart';
import 'package:english_quiz/Models/UserModel.dart';
import 'package:english_quiz/Presentation/_CommonModels/LocalQuizModel.dart';
import 'package:english_quiz/Repository/Remote/Repository.dart';
import 'package:flutter/material.dart';

import '../../../Models/AnswerModel.dart';
import '../../../Models/QuestionModel.dart';
import '../../../Models/Roles.dart';

class TeacherQuizInfoViewModel extends ChangeNotifier{
  Repository myRepo = Repository();
  int _selectedIndex = -1;
  LocalQuizModel _quizModel = LocalQuizModel();
  final List<UserModel> _requiredStudents = [
    for(var i = 0; i<10; i++) UserModel(id: Guid(i.toString()),email: 'test@test.com',firstName: 'FirstName',lastName: 'LastName', role: Roles.student, isExist: true)
  ];
  final List<UserModel> _testedStudents = [
    for(var i = 0; i<10; i++) UserModel(id: Guid(i.toString()),email: 'test@test.com',firstName: 'FirstName',lastName: 'LastName',  role: Roles.student, isExist: true)
  ];


  QuizModel get quizModel => _quizModel.quizModel!;
  int get selectedIndex => _selectedIndex;
  List<UserModel> get requiredStudents => _requiredStudents;
  List<UserModel> get testedStudents => _testedStudents;



  void setSelectedIndex(int index){
    _selectedIndex = index;
    notifyListeners();
  }

  void setStudents() async{
    //TODO: assign the values to the private students variables.
    _quizModel.quizModel!.requiredStudents?.forEach((guid) {
      myRepo.getStudentById(guid.id);
    });
    _quizModel.quizModel!.testedStudents?.forEach((guid) {
      myRepo.getStudentById(guid.id);
    });
  }



  void deleteQuiz() async{
    //TODO: do the deletion logic;
  }

  void myString(int qIndex){
    print("QText: ${quizModel.questions[qIndex].qText}");
    quizModel.questions[qIndex].answers.forEach((answer) {
      print("answer: ${answer.aText}, isSelected: ${answer.isSelected}, isCorrect: ${answer.isCorrect}");
    });
  }

}