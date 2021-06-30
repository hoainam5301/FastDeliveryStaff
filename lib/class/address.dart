import 'package:json_annotation/json_annotation.dart';
import 'package:staffdelivery/class/ward.dart';
part 'address.g.dart';

@JsonSerializable(explicitToJson: true)
class Address {
  String id;
  String fullAddress;
  String noteAddress;
  Ward idWard;

  Address({this.id,this.fullAddress,this.idWard,this.noteAddress});

  factory Address.fromJson(Map<String, dynamic> data) => _$AddressFromJson(data);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}