import 'package:english_quiz/Models/AnswerModel.dart';
import 'package:english_quiz/Models/GetStorage.dart';
import 'package:english_quiz/Models/Guid.dart';
import 'package:english_quiz/Models/QuizModel.dart';
import 'package:english_quiz/Models/Roles.dart';
import 'package:english_quiz/Models/UserModel.dart';
import 'package:english_quiz/Presentation/_CommonModels/LocalQuizModel.dart';
import 'package:english_quiz/Presentation/_CommonModels/ValidationObject.dart';
import 'package:english_quiz/Repository/Remote/Repository.dart';
import 'package:english_quiz/Repository/Remote/Responses/AllStudentsResponse.dart';
import 'package:english_quiz/Repository/Remote/Responses/QuizReponses/AnswerRequest.dart';
import 'package:english_quiz/Repository/Remote/Responses/QuizReponses/QuestionRequest.dart';
import 'package:english_quiz/Repository/Remote/Responses/QuizReponses/QuizRequest.dart';
import 'package:flutter/material.dart';
import '../../../Models/QuestionModel.dart';

class AddQuizViewModel extends ChangeNotifier{
  Repository myRepo = Repository();
  MyStorage storage = MyStorage();
  final LocalQuizModel _quizModel = LocalQuizModel();
  final List<UserModel> _availableStudents = [];
  List<Guid> _selectedStudents = [];
  ValidationObject durationValidator = ValidationObject(null,null);
  ValidationObject quizDaysValidator = ValidationObject(null,null);

  List<Guid> get selectedStudents => _selectedStudents;

  QuizModel get quizModel => _quizModel.quizModel!;
  List<QuestionModel> get questions => _quizModel.quizModel!.questions;

  List<UserModel> get availableStudents => _availableStudents;
  int get getStudentsLength => _availableStudents.length;
  String? get getQuizDaysErrorMessage => quizDaysValidator.errorMessage;
  String? get getDurationErrorMessage => durationValidator.errorMessage;
  bool get getIsValidInput => (selectedStudents.isNotEmpty
      && durationValidator.errorMessage == null
      && quizDaysValidator.errorMessage == null);

  void onDurationChange(String text){
    int val = int.tryParse(text) ?? 0;
    val <=0?
      durationValidator = ValidationObject(null, "enter a correct value"):
    durationValidator = ValidationObject(text, null);
    notifyListeners();
  }

  void onQuizDaysChange(String text){
    int val = int.tryParse(text) ?? 0;
    val <=0?
    quizDaysValidator = ValidationObject(null, "enter a correct value"):
    quizDaysValidator = ValidationObject(text, null);
    notifyListeners();
  }

  String getStudentFullName(int index) => "${_availableStudents[index].firstName} ${_availableStudents[index].lastName}";

  String getStudentEmail(int index) => _availableStudents[index].email;

  List<int> typesValues = [0,1];
  int selectedQuizType = 0;
  int getSelectionValue(int index) => typesValues[index];

  void setQuizLevelSelection(int index) {
    selectedQuizType = index;
    notifyListeners();
  }

  Guid _getStudentGUID(int index) => _availableStudents[index].id;

  void handleStdTap(int index) {
    int indexFlag = _selectedStudents.indexWhere((guid) =>
    guid == _availableStudents[index].id);
    indexFlag == -1? _selectedStudents.add(_getStudentGUID(index)):
        _selectedStudents.removeAt(indexFlag);
    notifyListeners();
  }

  Icon? getSelectionIcon(int index) =>
      _selectedStudents.contains(_getStudentGUID(index)) ?
  const Icon(Icons.task_alt): null;


  Future fetchAvailableStudents() async{
    AllStudentsResponse response = await myRepo.fetchAllStudents();
    for (var student in response.students) {
      availableStudents.add(UserModel(id: Guid(student.id),
          role: Roles.student,
          firstName: student.firstName,
          lastName: student.lastName,
          email: student.email,
          isExist: true));
    }
    notifyListeners();
    availableStudents.length;
  }

  void uploadQuiz() async {
    int duration = int.parse(durationValidator.value!);
    int quizDays = int.parse(quizDaysValidator.value!);
    String creationTime = DateTime.now().toIso8601String();
    String expiryDate = DateTime.now().add(Duration(days: quizDays)).toIso8601String();
    bool isLevelQuiz = selectedQuizType == 0 ? false: true;
    List<String> requiredStudents = selectedStudents.map((e) => e.id).toList();
    String teacherID = storage.getID();
    List<QuestionRequest> questionsReq = questions.map((question) =>
        QuestionRequest(question.qText, question.answers.map((answer) =>

            AnswerRequest (answer.aText, answer.isCorrect, false)

        ).toList())).toList();

    print(questionsReq.first);

    QuizRequest quiz = QuizRequest(questionsReq,teacherID,
        creationTime, duration, isLevelQuiz, expiryDate, requiredStudents);

    await myRepo.addUploadQuiz(quiz);


  }
}