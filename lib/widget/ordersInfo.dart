import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staffdelivery/class/orders.dart';
import 'package:staffdelivery/screens/detailOrders.dart';
import 'package:staffdelivery/widget/contans.dart';

class OrdersInfo extends StatelessWidget {
  //const Orders({Key? key}) : super(key: key);
  Orders orders;
  OrdersInfo({this.orders});


  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 12.0),
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 36,
                right: 12,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  color: Colors.white,
                  boxShadow: [BoxShadow(
                    color: Colors.grey.withOpacity(1),
                    blurRadius: 7,
                    offset: Offset(0, 7),
                  )]
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  left: 96,
                  top: 24,
                  bottom: 24,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text(
                          "#ORDER102",
                          style: Contanst.regularText,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text(
                          orders.orderName,
                          style: Contanst.regularText,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text(
                          orders.receiverIDAddress.fullAddress,
                          style: Contanst.noteText,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text(
                          orders.idPresentStatus.idStatus.name,
                          style: Contanst.noteText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.only(
                left: 12.0,
                top: 3.0
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  color: Colors.white,
                  boxShadow: [BoxShadow(
                    color: Colors.grey.withOpacity(1),
                    blurRadius: 7,
                    offset: Offset(10, 3),
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
              padding: const EdgeInsets.only(
                left: 280,
                top: 12,
              ),
              child: Text("${orders.orderMoney} VND",style: Contanst.textInButtonLanding,),
            )
          ],
        ),
      );

  }
}
