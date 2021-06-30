import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:staffdelivery/class/staff.dart';


class StaffControllers extends GetxController{
  Staff staffUser ;

  Future<String> loginStaff(String email, String password)async{
    //List<Staff> listStaff = [];
    final String apiUrl = "http://52.142.43.138:3000/staffs/login/delivery/?email=$email&password=$password";
    var response = await http.get(apiUrl);
    print(response.statusCode);
    if(response.statusCode==200)
    {
      var data=jsonDecode(response.body);
      staffUser= Staff.fromJson(data);
      //print(staffUser.fullName);
      return "Logged in successfully";
    }
  }

  Future<String> reloadDataUser(String idStaff)async{
    //List<Staff> listStaff = [];
    final String apiUrl = "http://52.142.43.138:3000/staffs/$idStaff";
    var response = await http.get(apiUrl);
    print(response.statusCode);
    if(response.statusCode==200)
    {
      var data=jsonDecode(response.body);
      staffUser= Staff.fromJson(data);
      //print(staffUser.fullName);
      return "Logged in successfully";
    }
  }

  Future<String> updateStaff(String idStaff,Staff staff) async {
    final String apiUrl = "http://52.142.43.138:3000/staffs/$idStaff";
    var response = await http.put(apiUrl, body: staff.toJson() );

    if(response.statusCode==201 || response.statusCode==200) {
      var data = jsonDecode(response.body);

      return "Update successfully";
    }
    else {

      return response.body;
    }
  }

}