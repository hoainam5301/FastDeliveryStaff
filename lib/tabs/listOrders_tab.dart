import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staffdelivery/class/orders.dart';
import 'package:staffdelivery/screens/detailOrders.dart';
import 'package:staffdelivery/widget/contans.dart';
import 'package:staffdelivery/widget/ordersInfo.dart';


class ListOrders extends StatefulWidget {
  @override
  _ListOrdersState createState() => _ListOrdersState();
}

class _ListOrdersState extends State<ListOrders> {
  String dropdownValue ;
  Orders orders = Get.find<Orders>();

  List<Widget> buildOrder() {
    List<Widget> listinfo = [];
    orders.listAllOrder.forEach((element) {
      listinfo.add(GestureDetector(
        onTap: (){
          print("co bam vao");
          print(element.orderName);
          Get.to(DetailOrder(orders: element,));
        },
        child: OrdersInfo(
          orders: element,
        ),
      ));
    });
    return listinfo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      "List Order",
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
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(36.0),
                    border: Border.all(
                      color: Color(0xffFA4A0C),
                    )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextField(
                    style: Contanst.titleTextFiled,
                    decoration: InputDecoration(
                      icon: Image.asset(
                        "assets/images/search.png",
                        width: 30,
                        height: 30,
                      ),
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: Contanst.hintText,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 24, top: 12),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: Color(0xffFA4A0C),
                          )),
                      width: 30,
                      height: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Image.asset("assets/images/filter.png"),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 16,
                            left: 6.0,
                          ),
                          child: Image.asset("assets/images/address.png",
                          width: 24,
                            height: 24,
                          ),
                        ),
                        Container(
                            height: 40,
                            width: 200,
                            margin: const EdgeInsets.only(
                              top: 12,
                              left: 6,
                            ),
                            color: Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.only(top:6),
                              child: DropdownButton<String>(
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
                                onChanged: (String  newValue) {
                                  setState(() {
                                    dropdownValue = newValue;
                                  });
                                },
                                hint: Container(
                                  width: 175,
                                  height: 40,
                                  child: Text("Dictrict",style: Contanst.noteText,
                                  ),
                                ),
                                items: <String>['One', 'Two', 'Free', 'Four']
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            )
                        ),
                      ],
                    ),
                    Padding(
                          padding: const EdgeInsets.only(left: 12,top: 20),
                          child: Text("Reset",style: TextStyle(
                            shadows: [
                              Shadow(
                                  color: Color(0xffFA4A0C),
                                  offset: Offset(0, -5))
                            ],
                            color: Colors.transparent,
                            decoration:
                            TextDecoration.underline,
                            decorationColor: Color(0xffFA4A0C),
                            decorationThickness: 2,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          ),
                          ),
                    ),
                  ],
                ),
              ),
              Column(
                children: buildOrder(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
