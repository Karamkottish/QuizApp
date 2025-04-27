import 'package:english_quiz/Models/Roles.dart';
import 'package:english_quiz/Models/SharedPrefConstants.dart';
import 'package:english_quiz/Models/GetStorage.dart';
import 'package:flutter/material.dart';

class TeacherHomeViewModel extends ChangeNotifier{
  final MyStorage _storage = MyStorage();



  bool isAdmin()=> _storage.getRole() == Roles.admin.toString();
  String getGreeting() => _storage.getGreeting();




}

