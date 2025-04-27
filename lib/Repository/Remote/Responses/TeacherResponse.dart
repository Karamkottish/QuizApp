import 'package:json_annotation/json_annotation.dart';


part 'TeacherResponse.g.dart';

@JsonSerializable()
class TeacherResponse{
  
  @JsonValue("id")
  String id;
  @JsonValue("firstName")
  String firstName;
  @JsonValue("lastName")
  String lastName;
  @JsonValue("email")
  String email;

  TeacherResponse(this.id, this.firstName, this.lastName, this.email);


  factory TeacherResponse.fromJson(Map<String,dynamic> json) => _$TeacherResponseFromJson(json);

  Map<String,dynamic> ToJson() => _$TeacherResponseToJson(this);


  
}