import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staffdelivery/class/commission.dart';
import 'package:staffdelivery/class/orders.dart';
import 'package:staffdelivery/class/staff.dart';
import 'package:staffdelivery/controllers/staffController.dart';
import 'package:staffdelivery/screens/home_page.dart';
import 'package:staffdelivery/screens/signUp_page.dart';
import 'package:staffdelivery/widget/button.dart';
import 'package:staffdelivery/widget/contans.dart';
import 'package:staffdelivery/widget/custom_input.dart';

class LoginPage extends StatefulWidget {
  //const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email;
  String password;
  Commission _Commission = Get.find<Commission>();
  StaffControllers userStaff=Get.find<StaffControllers>();
  Orders _orders=Get.find<Orders>();

  @override
  void initState() {
    // TODO: implement initState
    _Commission.getListCommission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F8),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child:
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Container(
                      height: 300,
                      child: Stack(
                        children: [
                          ClipPath(
                            clipper: BackGroundClipper(),
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Color(0xffFA4A0C),
                                  borderRadius: BorderRadius.circular(0)
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: CircleAvatar(
                                radius:70.0,
                                backgroundColor: Colors.white,
                                child: ClipRRect(
                                  borderRadius: new BorderRadius.circular(0.0),
                                  child: Image.asset(
                                    "assets/images/logo.png",
                                    width: 115,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Text("Welcome!",
                            style: Contanst.welcomeText,),
                        )
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Text("Please enter your data to sign in",
                            style: Contanst.noteText,),
                        )
                    ),
                    SizedBox(height: 35.0,),
                    CustomInput(
                      title: "E-mail",
                      hintText: "mail@gmail.com",
                      iconImages: "assets/images/gmail.png",
                      onChange: (value){
                        email=value;
                      },
                    ),
                    SizedBox(height: 15.0,),
                    CustomInput(
                      title: "Password",
                      iconImages: "assets/images/password.png",
                      hintText: "**************",
                      isPasswordField: true,
                      onChange: (value){
                        password=value;
                      },
                    ),
                    SizedBox(height: 30,),
                    GestureDetector(
                      onTap: (){
                        userStaff.loginStaff(email, password).then((value) {
                         if(value=="Logged in successfully"){
                           _orders.getListOrders(userStaff.staffUser.id).then((value) {
                             print("Done");
                             Get.offAll(HomePage());
                           });
                         }
                        });

                       // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                      },
                      child: Button(title: "Login",),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 24.0,
                        ),
                        child: RichText(
                          text: TextSpan(
                              text: "Don't have an account?",
                              style: Contanst.regularText,
                              children: const <TextSpan>[
                                TextSpan(
                                    text: "Sign Up",
                                    style: Contanst.textInButtonLanding
                                )
                              ]
                          ),),
                      ),
                    )
                  ],
                ),
              ),
        ),
      )
      );

  }
}

class BackGroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    var firstControlPoint = Offset(50, size.height/2-15);
    var firstEndPoint = Offset(size.width/2, size.height/2);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width/2 + size.width/2 +10, size.height - size.height/2 +25);
    var secondEndPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

   return path;

  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
