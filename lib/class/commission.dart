import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
part 'commission.g.dart';

@JsonSerializable(explicitToJson: true)
class Commission {
  String name;
  String note;
  String orderPerMonthMin;
  String orderPerMonthMax;
  String ratioCommission;
  int index;

  Commission({this.name,this.ratioCommission,this.note,this.orderPerMonthMax,this.orderPerMonthMin});



  factory Commission.fromJson(Map<String,dynamic>data) => _$CommissionFromJson(data);
  Map<String,dynamic> toJson() => _$CommissionToJson(this);

  List<Commission> listAllPolycy=[];
  Future<List<Commission>> getListCommission()async{
    List<Commission> listCommission = [];
    final String apiUrl = "http://52.142.43.138:3000/cmstaffs";
    var response = await http.get(apiUrl);

    if(response.statusCode==200)
    {
      var data=jsonDecode(response.body);
      int i=0;
      for (var _Commission in data){
        listCommission.add(Commission.fromJson(_Commission));
        listCommission[i].index=i;
        i++;
      }
      listAllPolycy=listCommission;
      return listCommission;
    }

  }
}