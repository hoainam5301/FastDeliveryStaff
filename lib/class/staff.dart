import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:staffdelivery/class/address.dart';
import 'package:staffdelivery/class/commission.dart';
import 'package:staffdelivery/class/staffType.dart';
part 'staff.g.dart';

@JsonSerializable(explicitToJson: true)
class Staff{
  String id;
  StaffType idStaffType;
  Commission idCommission;
  String fullName;
  String gender;
  String dateOfBirth;
  String idNumber;
  String phone;
  String email;
  String password;
  Address idAddress;
  String basicSalary;
  String actualSalary;

  Staff({this.id,
    this.idAddress,
    this.idCommission,
    this.idStaffType,
    this.idNumber,
    this.password,
    this.phone,
    this.email,
    this.fullName,
    this.gender,
    this.actualSalary,
    this.basicSalary,
    this.dateOfBirth});

  factory Staff.fromJson(Map<String, dynamic> data) => _$StaffFromJson(data);
  Map<String, dynamic> toJson() => _$StaffToJson(this);

}