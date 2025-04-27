import 'package:json_annotation/json_annotation.dart';
import 'SingleStudentResponse.dart';

part 'AllStudentsResponse.g.dart';

@JsonSerializable()
class AllStudentsResponse{

  @JsonValue("data")
  List<SingleStudentResponse> students;

  AllStudentsResponse(this.students);

  factory AllStudentsResponse.fromJson(Map<String, dynamic> json) => _$AllStudentsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AllStudentsResponseToJson(this);
}