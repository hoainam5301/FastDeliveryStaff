import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staffdelivery/class/commission.dart';
import 'package:staffdelivery/widget/buttonChooseCommission.dart';
import 'package:staffdelivery/widget/contans.dart';
import 'package:staffdelivery/widget/showCommissionPolicy.dart';

class CommissionPolicy extends StatefulWidget {
  //const CommissionPolicy({Key? key}) : super(key: key);

  @override
  _CommissionPolicyState createState() => _CommissionPolicyState();
}

class _CommissionPolicyState extends State<CommissionPolicy> {

  PageController _tabController;
  int _selectedTab =0;
  Commission _Commission = Get.find<Commission>();

  @override
  void initState() {
    _tabController=PageController(
    );
    /*_Commission.getListCommission().then((value) => (){
      List<Commission> a =value;
    });*/
    //print(listCommission.length);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   List <Widget> buildCommission(){
      List<Widget> listinfo=[];
      _Commission.listAllPolycy.forEach((element) {
        listinfo.add(ShowCommissionPolicy(element));
      }
      );
      return listinfo;
    }
    return Scaffold(
      body:SingleChildScrollView(
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
                      "Commission Policy",
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
              ButtonChooseCommission(
              selectTab: _selectedTab,
              tabPressed: (num){
                _tabController.animateToPage(num, duration:Duration(milliseconds: 300), curve: Curves.easeOutCubic);
              }
              ),
              Container(
                width: 300,
                height: 500,
                    child: PageView(
                      controller: _tabController,
                      onPageChanged: (num){
                        setState(() {
                          _selectedTab=num;
                        });
                      },
                      children: buildCommission(),

                    )

              ),
            ],
          ),
        ),
      ),
    );
  }
}

