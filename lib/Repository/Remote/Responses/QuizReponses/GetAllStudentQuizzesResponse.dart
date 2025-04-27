import 'package:english_quiz/Repository/Remote/Responses/QuizReponses/QuestionRequest.dart';
import 'package:english_quiz/Repository/Remote/Responses/TeacherResponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'GetAllStudentQuizzesResponse.g.dart';


@JsonSerializable(explicitToJson: true)
class GetAllStudentQuizzesResponse{
  
  @JsonValue("Id")
  String id;
  @JsonValue("Questions")
  List<QuestionRequest> questions;
  @JsonValue('Teacher')
  TeacherResponse teacher;
  @JsonValue("CreationTime")
  String creationTime;
  @JsonValue("Duration")
  int duration;
  @JsonValue("ExpiryDate")
  String expiryDate;
  @JsonValue("Mark")
  int mark;


  GetAllStudentQuizzesResponse(this.id, this.questions, this.teacher,
      this.creationTime, this.duration, this.expiryDate, this.mark);

  factory GetAllStudentQuizzesResponse.fromJson(Map<String,dynamic> json) => _$GetAllStudentQuizzesResponseFromJson(json);

  Map<String,dynamic> ToJson() => _$GetAllStudentQuizzesResponseToJson(this);


}