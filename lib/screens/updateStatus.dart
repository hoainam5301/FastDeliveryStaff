import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staffdelivery/class/orders.dart';
import 'package:staffdelivery/class/status.dart';
import 'package:staffdelivery/controllers/staffController.dart';
import 'package:staffdelivery/screens/home_page.dart';
import 'package:staffdelivery/widget/button.dart';
import 'package:staffdelivery/widget/contans.dart';

class UpdateStatus extends StatefulWidget {
  //const UpdateStatus({Key? key}) : super(key: key);
  Orders orders;
  UpdateStatus({this.orders});
  @override
  _UpdateStatusState createState() => _UpdateStatusState();
}

class _UpdateStatusState extends State<UpdateStatus> {
  Status dropdownValue ;
  Status showData;
  String idStatus;
  StaffControllers userStaff = Get.find<StaffControllers>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading:  Builder(
          builder:(context)=> IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined),
            iconSize: 30,
            color: Color(0xff000000),
            onPressed: (){
              Get.back();
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Image.asset("assets/images/listorderOr.png",
              width: 40,
              height: 40,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
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
                      "Update Status",
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
              SizedBox(height: 8,),
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color: Colors.white,
                    boxShadow: [BoxShadow(
                      color: Colors.grey.withOpacity(1),
                      blurRadius: 7,
                      offset: Offset(0, 15),
                    )]
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius:160.0,
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(100.0),
                    child: Image.asset(
                      "assets/images/meowmatcak.png",
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 64),
                child: Divider(
                  color: Colors.deepOrange,
                  thickness: 2,
                ),
              ),
              SizedBox(height: 10,),
              Text(widget.orders.orderName,style: Contanst.nameOrder,),
              Text("${widget.orders.orderMoney} VNĐ",style: Contanst.price,),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        child: Text("Previous Status",
                          style: Contanst.infoText,)
                    )
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24,right: 24,top:12),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              child: Text("Name Status: ${widget.orders.idPresentStatus.idStatus.name}",
                                style: Contanst.hintText,)
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 6),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              child: Text("Note:${widget.orders.idPresentStatus.idStatus.note}",
                                style: Contanst.hintText,)
                          )
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        child: Text("Current Status",
                          style: Contanst.infoText,)
                    )
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 16,
                            left: 24.0,
                          ),
                          child: Image.asset("assets/images/trackorder.png",
                            width: 30,
                            height: 30,
                          ),
                        ),
                        Container(
                            height: 40,
                            width: 280,
                            margin: const EdgeInsets.only(
                              top: 12,
                              left: 6,
                            ),
                            color: Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.only(top:6),
                              child: DropdownButton<Status>(
                                value: dropdownValue,
                                icon: const Icon(Icons.arrow_downward),
                                iconSize: 24,
                                elevation: 16,
                                style: const TextStyle(color: Colors.grey),
                                underline: Container(
                                  margin: const EdgeInsets.only(top:18),
                                  height: 2,
                                  color: Color(0xffA1A1A1),
                                ),
                                onChanged: (Status  newValue) {
                                  setState(() {
                                    dropdownValue = newValue;
                                    idStatus=newValue.id;
                                    showData=newValue;
                                  });
                                },
                                hint: Container(
                                  width: 255,
                                  height: 40,
                                  margin: const EdgeInsets.symmetric(vertical: 6),
                                  child: Text("Status",style: Contanst.noteText,
                                  ),
                                ),
                                items: widget.orders.listAllStatusNext.map((Status status) {
                                  return DropdownMenuItem<Status>(
                                    value: status,
                                    child: Text(
                                      status.name,
                                      style: Contanst.noteText,
                                    ),
                                  );
                                }).toList(),
                              ),
                            )
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24,right: 24,top:12),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              child: Text("Name Status:${showData != null ? showData.name : "Name Status"} ",
                                style: Contanst.hintText,)
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24,right: 24,top: 6,bottom: 6),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              child: Text("Note: ${showData != null ? showData.note : "Note Status" }",
                                style: Contanst.hintText,)
                          )
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 70,),
              GestureDetector(
                onTap: (){
                  widget.orders.updateStatus(widget.orders.id, userStaff.staffUser.id, idStatus).then((value) {print("Done");
                  Get.offAll(HomePage());
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36),
                  child: Button(title: "Update Status",),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
