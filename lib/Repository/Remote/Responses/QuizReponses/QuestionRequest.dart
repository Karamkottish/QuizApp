import 'package:json_annotation/json_annotation.dart';

import 'AnswerRequest.dart';

part 'QuestionRequest.g.dart';

@JsonSerializable(explicitToJson: true)
class QuestionRequest{

  @JsonValue('QText')
  String qText;
  @JsonValue('Answers')
  List<AnswerRequest> answers;


  QuestionRequest(this.qText, this.answers);

  factory QuestionRequest.fromJson(Map<String,dynamic> json) => _$QuestionRequestFromJson(json);

  Map<String,dynamic> ToJson() => _$QuestionRequestToJson(this);


}