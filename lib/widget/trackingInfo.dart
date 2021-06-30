import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:staffdelivery/class/detailStatus.dart';
import 'package:staffdelivery/class/orders.dart';
import 'package:staffdelivery/screens/home_page.dart';
import 'package:staffdelivery/widget/contans.dart';

class TrackingInfo extends StatelessWidget {
  //const TrackingInfo({Key? key}) : super(key: key);
  DetailStatus detailStatus;
  Orders orders;
  bool isFirstStatus=false;
  TrackingInfo({this.isFirstStatus,this.detailStatus,this.orders});

  @override
  Widget build(BuildContext context) {
    var dateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(detailStatus.datetime, true);
    var dateLocal = dateTime.toLocal();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 6),
      height: 100,
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Image.asset("assets/images/clock.png",width: 25,height: 25,),
          ),
          SizedBox(width: 12,),
          Container(
            width: 270,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 6,),
                Text("${dateLocal.hour}:${dateLocal.minute} ${dateLocal.day}-${dateLocal.month}-${dateLocal.year}",style:isFirstStatus == true ? Contanst.textInButtonLanding : Contanst.noteText,),
                Text("Name status: ${detailStatus.idStatus.name}",style: Contanst.noteText,),
                Text("Note: ${detailStatus.idStatus.note}",style: Contanst.noteText,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: isFirstStatus== true ? GestureDetector(
              onTap: (){
                orders.deleteStatus(orders.id, detailStatus.id).then((value) {print("Doneeeeeeeeeeeeeeeee");
                Get.offAll(HomePage());
                });
              },
                child: Image.asset("assets/images/delete.png",width: 30,height: 30,))
                : null,
          ),

        ],
      ),
    );
  }
}
