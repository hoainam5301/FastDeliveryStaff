import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staffdelivery/class/district.dart';
import 'package:staffdelivery/controllers/staffController.dart';
import 'package:staffdelivery/screens/editProfile.dart';
import 'package:staffdelivery/widget/contans.dart';
import 'package:staffdelivery/widget/showInformation.dart';

class Profile extends StatelessWidget {
  //const Profile({Key? key}) : super(key: key);
  StaffControllers userStaff = Get.find<StaffControllers>();
  District district= Get.find<District>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 24,right: 24),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 24,
                  left: 24,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Text(
                      "Profile",
                      style: Contanst.headingText,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 124,
                ),
                child: Divider(
                  color: Color(0xffFA4A0C),
                  thickness: 3,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text(
                        "General",
                        style: Contanst.infoText,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      district.getListDistrict().then((value) {Get.to(EditProfile());});
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                          color: Color(0xffFA4A0C),
                          borderRadius: BorderRadius.circular(60)),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.asset(
                          "assets/images/pencil.png",
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                  )
                ],
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
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          userStaff.staffUser.fullName,
                          style: Contanst.infoText,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          userStaff.staffUser.phone,
                          style: Contanst.regularText,
                        ),
                      ),
                    ),
                    Divider(
                      color: Color(0xff808080),
                      height: 5.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          userStaff.staffUser.email,
                          style: Contanst.regularText,
                        ),
                      ),
                    ),
                    Divider(
                      color: Color(0xff808080),
                      height: 5.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          userStaff.staffUser.gender,
                          style: Contanst.regularText,
                        ),
                      ),
                    ),
                    Divider(
                      color: Color(0xff808080),
                      height: 5.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          userStaff.staffUser.dateOfBirth,
                          style: Contanst.regularText,
                        ),
                      ),
                    ),
                    Divider(
                      color: Color(0xff808080),
                      height: 5.0,
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
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          userStaff.staffUser.idAddress.idWard.idDistrict.name,
                          style: Contanst.regularText,
                        ),
                      ),
                    ),
                    Divider(
                      color: Color(0xff808080),
                      height: 5.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          userStaff.staffUser.idAddress.idWard.name,
                          style: Contanst.regularText,
                        ),
                      ),
                    ),
                    Divider(
                      color: Color(0xff808080),
                      height: 5.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          userStaff.staffUser.idAddress.fullAddress,
                          style: Contanst.regularText,
                        ),
                      ),
                    ),
                    Divider(
                      color: Color(0xff808080),
                      height: 5.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          userStaff.staffUser.idAddress.noteAddress,
                          style: Contanst.regularText,
                        ),
                      ),
                    ),
                    SizedBox(height: 50,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
