import 'package:english_quiz/Presentation/_CommonModels/ValidationObject.dart';
import 'package:english_quiz/Repository/Remote/Repository.dart';
import 'package:english_quiz/Repository/Remote/Requests/RegisterRequest.dart';
import 'package:english_quiz/Repository/Remote/Responses/RegisterResponse.dart';
import 'package:flutter/material.dart';

class RegisterViewModel with ChangeNotifier{

  final RegExp _emailReg = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

  Repository myRepo = Repository();
  late RegisterResponse res;
  ValidationObject _email = ValidationObject(null, null);
  ValidationObject _firstName = ValidationObject(null, null);
  ValidationObject _lastName = ValidationObject(null, null);
  ValidationObject _password = ValidationObject(null, null);



  ValidationObject get email => _email;
  ValidationObject get firstName => _firstName;
  ValidationObject get lastName => _lastName;
  ValidationObject get password => _password;
  bool get isValidInput =>
      (_email.errorMessage == null
      && _email.value !=null
          && _firstName.value != null
          && _lastName.value != null
          && _password.value != null);

  void checkEmail(String value){
    _emailReg.hasMatch(value) ? _email = ValidationObject(value, null):
        _email = ValidationObject(null,"Not an email form");
    notifyListeners();
  }

  void checkFirstName(String value){
    value.isEmpty ? _firstName = ValidationObject(null, "Enter a first name"):
        _firstName = ValidationObject(value, null);
    notifyListeners();

  }

  void checkLastName(String value){
    value.isEmpty ? _lastName = ValidationObject(null, "Enter a last name"):
    _lastName = ValidationObject(value, null);
    notifyListeners();
  }

  void checkPassword(String value){
    value.isEmpty ? _password = ValidationObject(null, "Enter a password"):
    _password = ValidationObject(value, null);
    notifyListeners();
  }


  Future registerStd() async{
    RegisterRequest req = RegisterRequest(_firstName.value!, _lastName.value!,
        _email.value!, _password.value!, 2);
    res = await myRepo.register(req);
  }

  Future registerTeacher() async{
    RegisterRequest req = RegisterRequest(_firstName.value!, _lastName.value!,
        _email.value!, _password.value!, 1);
    res = await myRepo.register(req);
  }
}