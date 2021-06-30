import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staffdelivery/class/commission.dart';

class ButtonChooseCommission extends StatefulWidget {
  //const ButtonChooseCommission({Key? key}) : super(key: key);
  final int selectTab;
  final int numButton;
  final Function(int) tabPressed;

  ButtonChooseCommission({this.selectTab, this.tabPressed, this.numButton});

  @override
  _ButtonChooseCommissionState createState() => _ButtonChooseCommissionState();
}

class _ButtonChooseCommissionState extends State<ButtonChooseCommission> {
  Commission _Commission = Get.find<Commission>();

  @override
  int _selectTab = 0;

  List<Widget> buildCommission() {
    List<Widget> listinfo = [];

    _Commission.listAllPolycy.forEach((element) {
      listinfo.add(ChooseButton(
        onPressed: () {
          widget.tabPressed(element.index );
        },
        selected: _selectTab == element.index  ? true : false,
        title: element.ratioCommission,
      ));
    });

    return listinfo;
  }

  Widget build(BuildContext context) {
    _selectTab = widget.selectTab;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: buildCommission(),
      ),
    );
  }
}

class ChooseButton extends StatelessWidget {
  final bool selected;
  final Function onPressed;
  final String title;

  ChooseButton({this.onPressed, this.selected, this.title});

  @override
  Widget build(BuildContext context) {
    bool _selected = selected ?? false;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: _selected ? Color(0xffFA4A0C) : Colors.transparent,
        ))),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w700,
              color: _selected ? Color(0xffFA4A0C) : Color(0xff999999),
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none),
        ),
      ),
    );
  }
}
