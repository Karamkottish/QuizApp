import 'package:json_annotation/json_annotation.dart';

part 'RegisterRequest.g.dart';

@JsonSerializable()
class RegisterRequest{

  String firstName;
  String lastName;
  String email;
  String password;
  int role;

  RegisterRequest(
      this.firstName, this.lastName, this.email, this.password, this.role);

  factory RegisterRequest.fromJson(Map<String, dynamic> json) => _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);



}