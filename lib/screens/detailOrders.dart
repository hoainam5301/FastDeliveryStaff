import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staffdelivery/class/orders.dart';
import 'package:staffdelivery/screens/tracking.dart';
import 'package:staffdelivery/screens/updateStatus.dart';
import 'package:staffdelivery/tabs/listOrders_tab.dart';
import 'package:staffdelivery/widget/button.dart';
import 'package:staffdelivery/widget/contans.dart';

class DetailOrder extends StatelessWidget {
  //const DetailOrder({Key? key}) : super(key: key);
  Orders orders;
  DetailOrder({this.orders});

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
                      "Detail Order",
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
              Text(orders.orderName,style: Contanst.nameOrder,),
              Text("${orders.orderMoney} VND",style: Contanst.price,),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        child: Text("Delivery info general",
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
                              child: Text("Name Order: ${orders.orderName}",
                                style: Contanst.hintText,)
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 6),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              child: Text("Price: ${orders.orderMoney} VND",
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
                        child: Text("Delivery info receiver",
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
                              child: Text("Name Receiver: ${orders.receiverName}",
                                style: Contanst.hintText,)
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 6),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              child: Text("Phone: ${orders.receiverPhone}",
                                style: Contanst.hintText,)
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24,right: 24),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              child: Text("Note Address: ${orders.receiverIDAddress.noteAddress}",
                                style: Contanst.hintText,)
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24,right: 24,top: 6,bottom: 6),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              child: Text("Full Address: ${orders.receiverIDAddress.fullAddress}",
                                style: Contanst.hintText,)
                          )
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40,),
              GestureDetector(
                onTap: (){
                  print("co vao");
                  orders.getListStatusOrder(orders.id).then((value) {if(value!=null){
                    Get.to(Tracking(orders: orders,));
                  }});

                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36),
                  child: Button(title: "Tracking",),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
