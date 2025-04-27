import 'package:english_quiz/Models/Guid.dart';

import 'Roles.dart';

class UserModel{
  Guid id;
  Roles role;
  bool isExist;
  String firstName;
  String lastName;
  String email;

  UserModel({
    required this.id,
    required this.role,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isExist,
  });
}