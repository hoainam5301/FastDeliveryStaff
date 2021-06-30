import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

import 'package:http/http.dart' as http;
import 'package:staffdelivery/class/address.dart';
import 'package:staffdelivery/class/bank.dart';
import 'package:staffdelivery/class/commission.dart';
part 'store.g.dart';


@JsonSerializable(explicitToJson: true)
class Store{
  String id;
  String email;
  String password;
  String name;
  String phone;
  String accountNumber;
  String accountName;
  Address idAddress;
  Bank idBank;
  String branchBank;
  Commission idCommission;

  Store({
    this.id,
    this.email,
    this.password,
    this.name,
    this.phone,
    this.accountNumber,
    this.accountName,
    this.idBank,
    this.branchBank,
    this.idCommission,
    this.idAddress,
  });
  factory Store.fromJson(Map<String, dynamic> data) => _$StoreFromJson(data);
  Map<String, dynamic> toJson() => _$StoreToJson(this);

  List<Store> listAllStore=[];

  Future<Store> createStore(Store store) async {
    final String apiUrl = "http://52.142.43.138:3000/stores";
    var response = await http.post(apiUrl, body: store.toJson() );

    if(response.statusCode==201 || response.statusCode==200) {
      final String storeFrom=response.body;
      return Store.fromJson(jsonDecode(response.body));
    }
    else {

      throw Exception(response.body);
    }
  }

  Future<List<Store>> getListStore()async{
    List<Store> listStore = [];
    final String apiUrl = "http://52.142.43.138:3000/stores";
    var response = await http.get(apiUrl);

    if(response.statusCode==200)
    {
      var data=jsonDecode(response.body);
      for (var _policy in data){
        listStore.add(Store.fromJson(_policy));
      }
      listAllStore=listStore;
      return listStore;
    }
  }

  Future<String> updateStore(String idStore,Store store) async {
    final String apiUrl = "http://52.142.43.138:3000/stores/$idStore";
    print("aaaaaa");
    var response = await http.put(apiUrl, body: store.toJson() );
    print(store.toJson());
    if(response.statusCode==201 || response.statusCode==200) {
      var data = jsonDecode(response.body);
      //print(response.body);
      //storeUser=Store.fromJson(data);
      return "Update successfully";
    }
    else {

      return response.body;
    }
  }

}