import 'package:json_annotation/json_annotation.dart';
part 'LoginResponse.g.dart';

@JsonSerializable()
class LoginResponse{

  @JsonValue("id")
  late String? id;
  @JsonValue("firstName")
  late String? firstName;
  @JsonValue("lastName")
  late String? lastName;
  @JsonValue("email")
  late String? email;
  @JsonValue("role")
  late int? role;
  @JsonValue("isExist")
  late bool isExist;
  @JsonValue("responseMessage")
  late String responseMessage;
  
  LoginResponse();
  
  
  factory LoginResponse.fromJson(Map<String,dynamic> json) => _$LoginResponseFromJson(json);

  Map<String,dynamic> ToJson() => _$LoginResponseToJson(this);
}



