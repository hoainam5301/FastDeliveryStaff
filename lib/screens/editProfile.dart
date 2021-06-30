import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:staffdelivery/class/district.dart';
import 'package:http/http.dart' as http;
import 'package:staffdelivery/class/ward.dart';
import 'package:staffdelivery/controllers/staffController.dart';
import 'package:staffdelivery/screens/home_page.dart';
import 'package:staffdelivery/widget/button.dart';
import 'package:staffdelivery/widget/contans.dart';
import 'package:staffdelivery/widget/showInformation.dart';

class EditProfile extends StatefulWidget {
  //const EditProfile({Key? key}) : super(key: key);
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  StaffControllers userStaff = Get.find<StaffControllers>();
  District _district = Get.find<District>();
  Ward _ward = Get.find<Ward>();
  District dropdownValueDistrict;
  Ward dropdownValueWard;
  List<Ward> listWard=[];

  Future<List<Ward>> _getWardList(String idDistrict) async {
    List<Ward> wardlist=[];
    final String apiUrl = "http://52.142.43.138:3000/districts/$idDistrict/wards";
    await http.get(apiUrl).then((response) {
      setState(() {
        var data=jsonDecode(response.body);
        //print(data);
        for (var _policy in data){
          print(Ward.fromJson(_policy).id);
          wardlist.add(Ward.fromJson(_policy));
        }
        listWard=wardlist;
      });
    });
    return listWard;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: Text(
            "Edit Profile",
            style: Contanst.headingText,
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined),
            iconSize: 30,
            color: Color(0xff000000),
            onPressed: () {
              Get.back();
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 24, top: 12),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 124,
                ),
                child: Divider(
                  color: Color(0xffFA4A0C),
                  thickness: 3,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    "General",
                    style: Contanst.infoText,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12.0),
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 12),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 55.0,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(70.0),
                            child: Image.asset(
                              "assets/images/meowngulol.png",
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 0.0),
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 0.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text("Name Staff",style: Contanst.titleInfor,),
                              ),
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: TextField(
                                  controller: TextEditingController()..text=userStaff.staffUser.fullName,
                                  style: Contanst.regularText,
                                  onChanged:(value){
                                    userStaff.staffUser.fullName=value;
                                  } ,
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 0.0),
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 0.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text("Note Address",style: Contanst.titleInfor,),
                              ),
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: TextField(
                                  controller: TextEditingController()..text=userStaff.staffUser.email,
                                  style: Contanst.regularText,
                                  onChanged:(value){
                                    userStaff.staffUser.email=value;
                                  } ,
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 0.0),
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 0.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text("Note Address",style: Contanst.titleInfor,),
                              ),
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: TextField(
                                  controller: TextEditingController()..text=userStaff.staffUser.phone,
                                  style: Contanst.regularText,
                                  onChanged:(value){
                                    userStaff.staffUser.phone=value;
                                  } ,
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 0.0),
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 0.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text("Note Address",style: Contanst.titleInfor,),
                              ),
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: TextField(
                                  controller: TextEditingController()..text=userStaff.staffUser.gender,
                                  style: Contanst.regularText,
                                  onChanged:(value){
                                    userStaff.staffUser.gender=value;
                                  } ,
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          child: Text(userStaff.staffUser.dateOfBirth,style: Contanst.regularText,),
                          onPressed: (){
                            DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                minTime: DateTime(1900, 3, 5),
                                maxTime: DateTime.now(),
                                onChanged: (date) {
                                },
                                onConfirm: (date) {
                                  userStaff.staffUser.dateOfBirth="${date.day}/${date.month}/${date.year}";
                                },
                                currentTime: DateTime.now(), locale: LocaleType.en);
                          },
                        )
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    "Information addresss",
                    style: Contanst.infoText,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                color: Colors.white,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 6.0),
                          child: Align(
                            child: Text("District",style: Contanst.titleInfor,),
                            alignment: Alignment.topLeft,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 0),
                          child:Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 0),
                            child: DropdownButton<District>(
                              value: dropdownValueDistrict,
                              icon: const Icon(Icons.keyboard_arrow_down_sharp,size: 40,),
                              iconSize: 24,
                              elevation: 16,
                              style: Contanst.regularText,
                              underline: Container(
                                margin: const EdgeInsets.only(top: 18),
                                height: 2,
                                color: Colors.grey,
                              ),
                              onChanged: (District newValue) {
                                setState(() {
                                  dropdownValueWard=null;
                                  dropdownValueDistrict = newValue;
                                  _getWardList(newValue.id).then((value) {print("done"); print(listWard.length);
                                  });
                                  _ward.idDistrict=newValue;
                                });
                              },
                              hint: Container(
                                margin: const EdgeInsets.symmetric(vertical: 6),
                                width: 310,
                                height: 48,
                                child: Text(
                                  "District",
                                  style: Contanst.hintText,
                                ),
                              ),
                              items: _district.listAllDistrict.map((District district) {
                                return DropdownMenuItem<District>(
                                  value: district,
                                  child: Text(
                                    district.name,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 12.0),
                          child: Align(
                            child: Text("Ward",style: Contanst.titleInfor,),
                            alignment: Alignment.topLeft,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal:0),
                          child:Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: DropdownButton<Ward>(
                              value: dropdownValueWard,
                              icon: const Icon(Icons.keyboard_arrow_down_sharp,size: 40,),
                              iconSize: 24,
                              elevation: 16,
                              style: Contanst.regularText,
                              underline: Container(
                                margin: const EdgeInsets.only(top: 18),
                                height: 2,
                                color: Colors.grey,
                              ),
                              onChanged: (Ward newValue) {
                                setState(() {
                                  dropdownValueWard = newValue;
                                  userStaff.staffUser.idAddress.idWard=newValue;
                                  //widget.staff.idAddress.idWard=newValue;
                                });
                              },
                              hint: Container(
                                margin: const EdgeInsets.symmetric(vertical: 6),
                                width: 310,
                                height: 48,
                                child: Text(
                                  "Ward",
                                  style: Contanst.hintText,
                                ),
                              ),
                              items: listWard.map((Ward ward) {
                                return DropdownMenuItem<Ward>(
                                  value: ward,
                                  child: Text(
                                    ward.name,
                                    style: Contanst.regularText,
                                  ),
                                );
                              }).toList(),

                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 0.0),
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 0.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text("Note Address",style: Contanst.titleInfor,),
                              ),
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: TextField(
                                  controller: TextEditingController()..text=userStaff.staffUser.gender,
                                  style: Contanst.regularText,
                                  onChanged:(value){
                                    userStaff.staffUser.gender=value;
                                  } ,
                                )
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 14,),
              GestureDetector(
                onTap: (){
                  userStaff.updateStaff(userStaff.staffUser.id, userStaff.staffUser).then((value) {print("Done");
                  userStaff.reloadDataUser(userStaff.staffUser.id).then((value) {if(value!=null)
                  {
                    Get.off(HomePage());
                  }
                  });
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36,vertical: 24),
                  child: Button(title: "Save",),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
