// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staffType.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaffType _$StaffTypeFromJson(Map<String, dynamic> json) {
  return StaffType(
    id: json['id'] as String,
    name: json['name'] as String,
    note: json['note'] as String,
  );
}

Map<String, dynamic> _$StaffTypetoJson(StaffType instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'note': instance.note,
    };
