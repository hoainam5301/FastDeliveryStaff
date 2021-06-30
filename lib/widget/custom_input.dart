import 'package:flutter/material.dart';
import 'package:staffdelivery/widget/contans.dart';

class CustomInput extends StatelessWidget {
  //const CustomInput({Key key}) : super(key: key);
  final String title;
  final String hintText;
  final Function(String) onChange;
  final Function(String) onSubmitted;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final bool isPasswordField;
  final String iconImages;
  final bool isAddress;

  CustomInput({this.isAddress,this.title,this.hintText,this.onChange,this.onSubmitted,this.focusNode,this.textInputAction,this.isPasswordField,this.iconImages});


  @override
  Widget build(BuildContext context) {
    bool _isPasswordField = isPasswordField ?? false;
    return Column(
      children: [
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 6.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(title,
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
              obscureText: _isPasswordField,
              focusNode: focusNode,
              onChanged: onChange,
              onSubmitted: onSubmitted,
              textInputAction: textInputAction,
              style: Contanst.titleTextFiled,
              decoration: InputDecoration(
                icon: Image.asset(iconImages,
                  width: 40,
                  height: 40,
                ),
                border:InputBorder.none,
                hintText:  hintText ?? "HintText",
                hintStyle:Contanst.hintText,
              ),
            ),
          ),
        )
      ],
    );
  }
}
