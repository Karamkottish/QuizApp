import 'package:json_annotation/json_annotation.dart';

part 'SingleStudentResponse.g.dart';

@JsonSerializable()
class SingleStudentResponse{
  
  @JsonValue("id")
  String id;
  @JsonValue("firstName")
  String firstName;
  @JsonValue("lastName")
  String lastName;
  @JsonValue("email")
  String email;
  @JsonValue("level")
  int level;


  SingleStudentResponse(
      this.id, this.firstName, this.lastName, this.email, this.level);

  factory SingleStudentResponse.fromJson(Map<String, dynamic> json) => _$SingleStudentResponseFromJson(json);

  Map<String, dynamic> ToJson() => _$SingleStudentResponseToJson(this);


}