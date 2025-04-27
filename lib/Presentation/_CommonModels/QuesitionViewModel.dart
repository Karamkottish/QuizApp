import 'package:english_quiz/Models/AnswerModel.dart';
import 'package:english_quiz/Models/QuestionModel.dart';
import 'package:english_quiz/Presentation/_CommonModels/LocalQuizModel.dart';
import 'package:english_quiz/Presentation/_CommonModels/ValidationObject.dart';
import 'package:english_quiz/Presentation/_Resources/ColorManager.dart';
import 'package:flutter/material.dart';

import '../../Models/Guid.dart';

class QuestionViewModel extends ChangeNotifier {
  LocalQuizModel _quizModel = LocalQuizModel();

  // this list is to manage the selected answer on each index. the length
  // of this list is equal to the length of the questions list.
  List<int> _selectionManager = [];

  List<int> get selectionManager => _selectionManager;

  List<QuestionModel> get quizQuestions => _quizModel.quizModel!.questions;


  // questions form fields validators.
  List<ValidationObject> questionValidationObject = [];
  String? getQuestionErrorMessage(int qIndex) {
    return questionValidationObject[qIndex].errorMessage;
  }
  bool get validateQuestionsText => !questionValidationObject.any((question) => question.value == null);
  bool get validateAnswersText => !answersValidationObject.any((answer) => answer.value == null);


  List<ValidationObject> answersValidationObject = [];
  String? getAnswersErrorMessage(int qIndex) {
    return answersValidationObject[qIndex].errorMessage;
  }

  // to append the questions from the previous view when clicking the triangle button.
  void initQuizQuestions() {
    _selectionManager = [];
    for (var question in quizQuestions) {
      for (var answer in question.answers) {
        answer.isSelected = false;
      }
    }
    for (var question in quizQuestions) {
      int curr =
          question.answers.indexWhere((answer) => answer.isCorrect == true);
      question.answers[curr].isSelected = true;
      _selectionManager.add(curr);
    }
    if(questionValidationObject.length != quizQuestions.length){
      questionValidationObject = [];
      answersValidationObject = [];
      for (var question in quizQuestions) {
        questionValidationObject.add(ValidationObject(question.qText, null));
        answersValidationObject.add(ValidationObject(question.qText, null));
      }
    }
  }

  // called when a selection is changed in student quiz.
  void stdInitQuizQuestions() {
    _selectionManager = [];
    for (var question in quizQuestions) {
      for (var answer in question.answers) {
        answer.isSelected = false;
      }
    }

    //default select
    for (var question in quizQuestions) {
      _selectionManager.add(0);
    }
  }

  // to change the internal structure of the question selected answer.
  // to set all answer to false expect the selected one depending on index.
  void teacherSetQAnswerSelect(int qIndex, int selectedAnsIndex) {
    for (var answer in quizQuestions[qIndex].answers) {
      answer.isSelected = false;
      answer.isCorrect = false;
    }
    quizQuestions[qIndex].answers[selectedAnsIndex].isSelected = true;
    quizQuestions[qIndex].answers[selectedAnsIndex].isCorrect = true;
    _selectionManager[qIndex] = selectedAnsIndex;
    notifyListeners();
  }

  void stdSetQAnswerSelect(int qIndex, int selectedAnsIndex) {
    for (var answer in quizQuestions[qIndex].answers) {
      answer.isSelected = false;
    }
    quizQuestions[qIndex].answers[selectedAnsIndex].isSelected = true;
    _selectionManager[qIndex] = selectedAnsIndex;
    notifyListeners();
  }

  //to change the colored tiled depending on selection
  Color? setAnsColorDependOnSelect(int qIndex, int ansIndex) =>
      quizQuestions[qIndex].answers[ansIndex].isSelected
          ? ColorManager.tertiary
          : null;

  // to change the colored tile depending on weather the answer is correct or not.
  Color? setAnsColorDependOnCorrect(int qIndex, int ansIndex) =>
      quizQuestions[qIndex].answers[ansIndex].isCorrect
          ? ColorManager.tertiary
          : null;

  Color? setAnsColorDependOnBoth(int qIndex, ansIndex) =>
      quizQuestions[qIndex].answers[ansIndex].isCorrect
          ? ColorManager.tertiary
          : quizQuestions[qIndex].answers[ansIndex].isSelected
              ? ColorManager.errorContainer
              : null;

  ScrollPhysics? isScrollable(bool isScrollable) =>
      isScrollable ? null : const NeverScrollableScrollPhysics();

  // the three functions below are to retrieve the question info such as
  // question text and answers text.
  int getQAnswersNumber(int qIndex) {
    return quizQuestions[qIndex].answers.length;
  }

  String getQText(int qIndex) {
    return quizQuestions[qIndex].qText;
  }

  String getAnsText(int qIndex, int ansIndex) =>
      quizQuestions[qIndex].answers[ansIndex].aText;

  String getCorrectAnswerT(int qIndex) => quizQuestions[qIndex]
      .answers
      .firstWhere((answer) => answer.isCorrect)
      .aText;

  String getSelectedAnswerT(int qIndex) {
    var test =  quizQuestions[qIndex]
      .answers
      .firstWhere((answer) => answer.isSelected)
      .aText;
    return test;
  }

  void deleteQuestion(int qIndex) {
    quizQuestions.removeAt(qIndex);
    notifyListeners();
  }

  // for answers form field
  void setAnswerText(int qIndex, int answerIndex, String newText) {
    quizQuestions[qIndex].answers[answerIndex].aText = newText;

    bool isAnyAnswerEmpty = quizQuestions[qIndex].answers.any((answer) => answer.aText.isEmpty);
    isAnyAnswerEmpty? answersValidationObject[qIndex] = ValidationObject(null, "some answers are empty"):
    answersValidationObject[qIndex] = ValidationObject("value", null);
    notifyListeners();
  }

  // for question form field
  void setQText(int qIndex, String newText) {
    quizQuestions[qIndex].qText = newText;
    newText.isEmpty? questionValidationObject[qIndex] = ValidationObject(null, "enter a text"):
        questionValidationObject[qIndex] = ValidationObject(newText, null);
    notifyListeners();
  }

  void deleteQAnswer(int qIndex, int answerIndex){
    if(quizQuestions[qIndex].answers[answerIndex].isSelected){
      teacherSetQAnswerSelect(qIndex, 0);
    }
    quizQuestions[qIndex].answers.removeAt(answerIndex);
    notifyListeners();

  }
  void addAnswerToQ(int qIndex){
    quizQuestions[qIndex].answers.add(
        Answer(id: Guid("$qIndex - 1"), aText: "Default Text",
            isCorrect: false, isSelected: false));
    notifyListeners();
  }

  void addQuestion(){
    quizQuestions.add(QuestionModel(id: Guid("${quizQuestions.length+1}"), qText: "qText", answers: [
      Answer(id: Guid("1"), aText: "aText", isCorrect: true, isSelected: false),
      Answer(id: Guid("2"), aText: "aText", isCorrect: false, isSelected: false)
    ]));
    notifyListeners();
  }


  void myString(int qIndex) {
    for (var answer in quizQuestions[qIndex].answers) {
      print(
          "answer: ${answer.id.id}, condition: ${answer.isSelected}, isTrue: ${answer.isCorrect}");
    }
  }

}
