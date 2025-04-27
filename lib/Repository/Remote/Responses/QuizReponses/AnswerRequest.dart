import 'package:json_annotation/json_annotation.dart';

part 'AnswerRequest.g.dart';

@JsonSerializable()
class AnswerRequest{

  @JsonValue("AText")
  String aText;
  @JsonValue("IsCorrect")
  bool isCorrect;
  @JsonValue("IsSelected")
  bool isSelected;


  AnswerRequest(this.aText, this.isCorrect, this.isSelected);

  factory AnswerRequest.fromJson(Map<String,dynamic> json) => _$AnswerRequestFromJson(json);

  Map<String,dynamic> ToJson() => _$AnswerRequestToJson(this);

}