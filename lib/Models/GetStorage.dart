import 'package:english_quiz/Models/Roles.dart';
import 'package:english_quiz/Models/SharedPrefConstants.dart';
import 'package:get_storage/get_storage.dart';




class MyStorage{
  final GetStorage _storage = GetStorage();

  void saveRole(Roles role){
    _storage.write(SharedPrefConstants.role, role.toString());
  }

  void saveGreeting(String greeting){
    _storage.write(SharedPrefConstants.greeting, greeting);
  }

  void saveID(String id){
    _storage.write(SharedPrefConstants.id, id);
  }

  String getRole()=> _storage.read(SharedPrefConstants.role);
  String getGreeting() => _storage.read(SharedPrefConstants.greeting);
  String getID()=> _storage.read(SharedPrefConstants.id);

}