import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staffdelivery/class/commission.dart';
import 'package:staffdelivery/class/district.dart';
import 'package:staffdelivery/class/orders.dart';
import 'package:staffdelivery/class/ward.dart';
import 'package:staffdelivery/controllers/staffController.dart';
import 'package:staffdelivery/screens/landing_page.dart';


void main() {
  Get.put(Commission());
  Get.put(District());
  Get.put(Ward());
  Get.put(StaffControllers());
  Get.put(Orders());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Commission Commission= Get.find<Commission>();
    //Commission.getListCommission();
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingPage(),
    );
  }
}

