import 'package:flutter/material.dart';
import 'package:staffdelivery/widget/contans.dart';

class HidenRightMenuButton extends StatefulWidget {
  //const BottomTabButton({Key key}) : super(key: key);
  final int selectTab;
  final Function (int) tabPressed;

  HidenRightMenuButton({this.tabPressed,this.selectTab});

  @override
  _HidenRightMenuButtonState createState() => _HidenRightMenuButtonState();
}

class _HidenRightMenuButtonState extends State<HidenRightMenuButton> {
  @override
  int _selectTab=0;


  Widget build(BuildContext context) {
    _selectTab= widget.selectTab;
    return Container(
      child: Column(
        children: [
          BottomButton(
            imagePath: "assets/images/listorderWh.png",
            titleButton: "ListOrder",
            selected: _selectTab==0 ? true : false,
            onPressed: (){
              widget.tabPressed(0);
            },
          ),
          SizedBox(height: 3,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Divider(thickness: 1, color: Colors.white,),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 0.0),
            child: BottomButton(
              imagePath: "assets/images/policyWh.png",
              titleButton: "Commission Policy",
              selected: _selectTab==1 ? true :false,
              onPressed: (){
                widget.tabPressed(1);
              },
            ),
          ),
          SizedBox(height: 3,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Divider(thickness: 1, color: Colors.white,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: BottomButton(
              imagePath: "assets/images/profileWh.png",
              titleButton: "Profile",
              selected: _selectTab ==2 ? true : false,
              onPressed: (){
                widget.tabPressed(2);
              },
            ),
          ),
          SizedBox(height: 3,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Divider(thickness: 1, color: Colors.white,),
          ),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget{
  final String imagePath;
  final bool selected;
  final Function onPressed;
  final String titleButton;

  BottomButton({this.onPressed,this.imagePath,this.selected,this.titleButton});

  @override
  Widget build(BuildContext context) {
    bool _selected = selected ?? false;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: _selected ? Colors.deepOrange : Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Row(
            children: [
              Image(
                image: AssetImage(imagePath ?? ""),
                width: 40.0,
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(titleButton,
                  style: Contanst.textInButton,

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
