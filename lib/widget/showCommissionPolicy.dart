import 'package:flutter/material.dart';
import 'package:staffdelivery/class/commission.dart';
import 'package:staffdelivery/widget/contans.dart';

class ShowCommissionPolicy extends StatelessWidget {

  final Commission commission;
  ShowCommissionPolicy(this.commission);
  //const ShowCommissionPolicy({Key? key}) : super(key: key);

  @override


  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      child: Stack(
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 50),
              width: 300,
              height: 370,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(1),
                    blurRadius: 7,
                    offset: Offset(0, 7),
                  )
                ]
              ),
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 140,
                        right: 12,
                        left: 12,
                      ),
                      child: Text("${commission.name}",style: Contanst.policyText,textAlign: TextAlign.center,),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 12,
                          right: 12,
                          left: 12,
                      ),
                      child: Text("${commission.note}",style: Contanst.regularText,maxLines: 100,textAlign: TextAlign.center,),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              width: 150,
              height: 150,
              margin: const EdgeInsets.only(
                left: 12.0,
                right: 12.0,
                bottom: 250,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  color: Colors.white,
                  boxShadow: [BoxShadow(
                    color: Colors.grey.withOpacity(1),
                    blurRadius: 7,
                    offset: Offset(0, 7),
                  )]
              ),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius:150.0,
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
          ),
        ],
      ),
    );
  }
}
