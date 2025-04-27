import 'package:dio/dio.dart';
import 'package:english_quiz/Models/Roles.dart';
import 'package:english_quiz/Models/SharedPrefConstants.dart';
import 'package:english_quiz/Models/GetStorage.dart';
import 'package:english_quiz/Presentation/_CommonModels/ValidationObject.dart';
import 'package:english_quiz/Presentation/_Resources/RouteManager.dart';
import 'package:english_quiz/Repository/Remote/Repository.dart';
import 'package:english_quiz/Repository/Remote/Requests/LoginRequest.dart';
import 'package:english_quiz/Repository/Remote/Responses/LoginResponse.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginViewModel with ChangeNotifier{
  Repository myRepo = Repository();
  MyStorage storage = MyStorage();
  ValidationObject _email = ValidationObject(null, null);
  ValidationObject _password = ValidationObject(null, null);

  ValidationObject get email => _email;
  ValidationObject get password => _password;
  bool get isValidInput => (_email.value != null && _password.value != null);

  LoginResponse? loginResponse;


  void setUserRole()async{
    if(loginResponse!.role! == 0){
      storage.saveRole(Roles.admin);
    }else if(loginResponse!.role! == 1){
      storage.saveRole(Roles.teacher);
    }else{
      storage.saveRole(Roles.student);
    }
  }

  void setGreeting() async{
    storage.saveGreeting(loginResponse!.responseMessage);
  }


  String goTo()=> loginResponse!.role! == 2? RouteManager.studentHome:
    RouteManager.teacherHomeRoute;


  void onEmailChange(String value) {
    value.isEmpty ? _email = ValidationObject(null, "Enter An Email") :
        _email = ValidationObject(value, null);
    print(email.value);
    notifyListeners();
  }

  void onPasswordChange(String value) {
    value.isEmpty ? _password = ValidationObject(null, "Enter A password"):
    _password = ValidationObject(value, null);
    notifyListeners();
  }

  Future<bool> login() async {
    loginResponse = await myRepo.login(LoginRequest(email.value!, password.value!));

    if(loginResponse!.isExist) {
      setUserRole();
      setGreeting();
      storage.saveID(loginResponse!.id!);
    }

    return loginResponse!.isExist;

  }




}