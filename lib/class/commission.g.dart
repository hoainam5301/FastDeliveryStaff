// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Commission _$CommissionFromJson(Map<String, dynamic> json) {
  return Commission(
    name: json['name'] as String,
    ratioCommission: json['ratioCommission'] as String,
    note: json['note'] as String,
    orderPerMonthMax: json['orderPerMonthMax'] as String,
    orderPerMonthMin: json['orderPerMonthMin'] as String,
  );
}

Map<String, dynamic> _$CommissionToJson(Commission instance) =>
    <String, dynamic>{
      'name': instance.name,
      'note': instance.note,
      'orderPerMonthMin': instance.orderPerMonthMin,
      'orderPerMonthMax': instance.orderPerMonthMax,
      'ratioCommission': instance.ratioCommission,
    };
