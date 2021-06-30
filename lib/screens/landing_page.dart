import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staffdelivery/class/commission.dart';
import 'package:staffdelivery/screens/login_page.dart';
import 'package:staffdelivery/widget/contans.dart';

class LandingPage extends StatefulWidget {
  //const LandingPage({Key  key}) : super(key: key);
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(0xffFA4A0C)
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 70.0,
                right: 230.0,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius:45.0,
                child: ClipRRect(
                  borderRadius: new BorderRadius.circular(0.0),
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 75,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(height: 6.0,),
            Align(
              alignment: Alignment.centerLeft,
                child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48.0),
                      child: Text("Fast\nDelivery",style: Contanst.headingTextLanDingPage,),
                    )
                )
            ),
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius:160.0,
              child: ClipRRect(
                borderRadius: new BorderRadius.circular(25.0),
                child: Image.asset(
                  "assets/images/meowmatcak.png",
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 36.0,horizontal: 48.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Center(
                    child: Text("Get Start",style: Contanst.textInButtonLanding,),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
