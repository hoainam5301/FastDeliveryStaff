import 'package:json_annotation/json_annotation.dart';
part 'staffType.g.dart';

@JsonSerializable(explicitToJson: true)
class StaffType{
  String id;
  String name;
  String note;

  StaffType({this.id,this.name,this.note});

  factory StaffType.fromJson(Map<String,dynamic>data) => _$StaffTypeFromJson(data);
  Map<String,dynamic> toJson() => _$StaffTypetoJson(this);
}