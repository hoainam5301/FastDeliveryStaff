import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:staffdelivery/screens/landing_page.dart';
import 'package:staffdelivery/widget/contans.dart';

class SignUp extends StatefulWidget {
  //const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  String email;
  String phoneNumber;

  Future<String> signUpDataStaff(String email, String phoneNumber) async {
    final String apiUrl = "http://52.142.43.138:3000/new-staffs";
    var response = await http.post(apiUrl, body: {
      'email':email,
      'phone':phoneNumber,
    });

    if(response.statusCode==201 || response.statusCode==200) {
      return "Done";
    }
    else {
      throw Exception(response.body);
    }
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
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(24.0),
                              child: Image.asset(
                                "assets/images/meowngulol.png",
                                width: MediaQuery.of(context).size.width,
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
                        child: Text("Please enter your information in the\nform below, our staff will contact you soon",
                          style: Contanst.noteText,),
                      )
                  ),
                  SizedBox(height: 35.0,),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 6.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("E-mail",
                            style: Contanst.titleTextFiled,),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 24.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(36.0),
                            border:Border.all(
                              color: Color(0xffFA4A0C),
                            )

                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child:
                          TextField(
                            style: Contanst.titleTextFiled,
                            decoration: InputDecoration(
                              icon: Image.asset("assets/images/gmail.png",
                                width: 40,
                                height: 40,
                              ),
                              border:InputBorder.none,
                              hintText:  "mail@gmail.com",
                              hintStyle:Contanst.hintText,
                            ),
                            onChanged: (value){
                             email=value;
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15.0,),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 6.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Phone Number",
                            style: Contanst.titleTextFiled,),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 24.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(36.0),
                            border:Border.all(
                              color: Color(0xffFA4A0C),
                            )

                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child:
                          TextField(
                            style: Contanst.titleTextFiled,
                            decoration: InputDecoration(
                              icon: Image.asset("assets/images/password.png",
                                width: 40,
                                height: 40,
                              ),
                              border:InputBorder.none,
                              hintText:  "036889897",
                              hintStyle:Contanst.hintText,
                            ),
                            onChanged: (value){
                              phoneNumber=value;
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 120,),
                  GestureDetector(
                    onTap: (){
                      signUpDataStaff(email, phoneNumber).then((value) {print("Done");
                      Get.offAll(LandingPage());
                      });
                    },
                    child: Container(
                      height: 52,
                      margin: const EdgeInsets.symmetric(horizontal: 24.0),
                      decoration: BoxDecoration(
                        color: Color(0xffFA4A0C),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Center(
                        child: Text("Send",style: Contanst.textInButton,),
                      ),
                    ),
                  ),
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
