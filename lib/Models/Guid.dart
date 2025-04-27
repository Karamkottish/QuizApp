import 'package:json_annotation/json_annotation.dart';

part 'Guid.g.dart';
@JsonSerializable()
class Guid{

  @JsonValue("id")
  String id;

  Guid(this.id);

  factory Guid.fromJson(Map<String,dynamic> json) => _$GuidFromJson(json);

  Map<String,dynamic> ToJson() => _$GuidToJson(this);



}