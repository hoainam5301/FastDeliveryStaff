import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staffdelivery/class/orders.dart';
import 'package:staffdelivery/screens/updateStatus.dart';
import 'package:staffdelivery/widget/button.dart';
import 'package:staffdelivery/widget/contans.dart';
import 'package:staffdelivery/widget/trackingInfo.dart';

class Tracking extends StatelessWidget {
  //const DetailOrder({Key? key}) : super(key: key);
  Orders orders;
  Tracking({this.orders});
  //DetailOrder({this.orders});

  List<Widget> buildOrderStatus() {
    List<Widget> listinfoStatus = [];
    int i=0;
    orders.listAllStatusOrder.forEach((element) {
      listinfoStatus.add(GestureDetector(
        onTap: (){
          //print(element.orderName);
          //Get.to(DetailOrder(orders: element,));
        },
        child: TrackingInfo(
          orders: orders,
          isFirstStatus: i==0? true : false,
          detailStatus: element,
        ),
      ));
      i++;
    });
    return listinfoStatus;
  }

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
                      "Tracking",
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
              Text("${orders.orderMoney} VNĐ",style: Contanst.price,),
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
              SizedBox(height: 15,),
              Container(
                height: 250,
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SingleChildScrollView(
                      child: Column(
                        children: buildOrderStatus(),)
                  )
              ),
              SizedBox(height: 40,),
              GestureDetector(
                onTap: (){
                  orders.getListStatusNext(orders.id).then((value) {Get.to(UpdateStatus(orders: orders,));});
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
