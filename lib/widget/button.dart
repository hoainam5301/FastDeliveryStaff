import 'package:flutter/material.dart';
import 'package:staffdelivery/widget/contans.dart';

class Button extends StatelessWidget {
 // const Button({Key? key}) : super(key: key);
  final String title;
  Button({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      decoration: BoxDecoration(
        color: Color(0xffFA4A0C),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Center(
        child: Text(title,style: Contanst.textInButton,),
      ),
    );
  }
}
