import 'package:english_quiz/Repository/Remote/Responses/QuizReponses/QuestionRequest.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../Models/Guid.dart';

part 'QuizRequest.g.dart';


@JsonSerializable(explicitToJson: true)
class QuizRequest{

  @JsonValue("Questions")
  List<QuestionRequest> questions;
  @JsonValue('TeacherId')
  String teacherId;
  @JsonValue('CreationTime')
  String creationTime;
  @JsonValue('Duration')
  int duration;
  @JsonValue('IsLevelQuiz')
  bool isLevelQuiz;
  @JsonValue('ExpiryDate')
  String expiryDate;
  @JsonValue('RequiredStudentsIds')
  List<String> requiredStudentsIds;


  QuizRequest(this.questions, this.teacherId, this.creationTime, this.duration,
      this.isLevelQuiz, this.expiryDate, this.requiredStudentsIds);

  factory QuizRequest.fromJson(Map<String,dynamic> json) => _$QuizRequestFromJson(json);

  Map<String,dynamic> ToJson() => _$QuizRequestToJson(this);
}