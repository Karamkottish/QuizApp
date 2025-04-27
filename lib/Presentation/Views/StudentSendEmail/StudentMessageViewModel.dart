import 'package:english_quiz/Models/Guid.dart';
import 'package:english_quiz/Models/Roles.dart';
import 'package:english_quiz/Models/UserModel.dart';
import 'package:english_quiz/Presentation/_CommonModels/ValidationObject.dart';
import 'package:flutter/material.dart';

class StudentMessageViewModel extends ChangeNotifier{
  ValidationObject _messageObject = ValidationObject(null, null);
  final List<UserModel> _availableTeachers = [
   for(int i = 0; i<5; i++) UserModel(id: Guid("1"), role: Roles.teacher,
       firstName: "moha$i", lastName: "ali", email: "mail@mail.com", isExist: true)];
  int? selectedTeacherIndex;

  String? get getErrorMessage => _messageObject.errorMessage;
  int get getAvailableTeachersLength => _availableTeachers.length;

  String getTeacherFullName(int index) =>
      "${_availableTeachers[index].firstName} ${_availableTeachers[index].lastName}";
  String get getSelectedTeacherFullName =>
      (selectedTeacherIndex ==null)? "none": getTeacherFullName(selectedTeacherIndex!);

  bool get ValidateInput {
    return _messageObject.value != null && selectedTeacherIndex != null;
  }

  void onTeacherSelectionChange(int index){
    selectedTeacherIndex = index;
    notifyListeners();
  }

  void onMessageChange(String value) {
    value.isEmpty ? _messageObject = ValidationObject(null, "Enter a Message") :
    _messageObject = ValidationObject(value, null);
    notifyListeners();
  }


  void fetchTeachers()async{
    //TODO: get the teachers for messaging
  }

  void sendMessage() async{
    //TODO: do the message sending
  }

}