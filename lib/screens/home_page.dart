import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:staffdelivery/tabs/commissionPolicy_tab.dart';
import 'package:staffdelivery/tabs/listOrders_tab.dart';
import 'package:staffdelivery/tabs/profile_tab.dart';
import 'package:staffdelivery/widget/hidenRightMenu.dart';

class HomePage extends StatefulWidget {
  //const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  PageController _tabController;
  int _selectedTab =0;
  String imagePath;


  @override
  void initState() {
    _tabController=PageController();

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F8),
      drawer: ClipPath(
        clipper: BackGroundClipper(),
        child: Drawer(
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xffFA4A0C)
            ),
            child:Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 80,
                    right: 140,
                  ),
                  child: CircleAvatar(
                    radius:45.0,
                    backgroundColor: Colors.white,
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
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,),
                  child: HidenRightMenuButton(
                    selectTab: _selectedTab,
                    tabPressed: (num){
                      _tabController.animateToPage(num, duration:Duration(milliseconds: 300), curve: Curves.easeOutCubic);
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading:  Builder(
            builder:(context)=> IconButton(
              icon: Icon(Icons.menu_rounded),
              iconSize: 40,
              color: Color(0xff000000),
              onPressed: (){
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        actions: [
          Container(
              child:  _getIcon(),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: PageView(
                physics:new NeverScrollableScrollPhysics(),
                controller: _tabController,
                onPageChanged: (num){
                  setState(() {
                    _selectedTab=num;
                  });
                },
                children: [
                  ListOrders(),
                  CommissionPolicy(),
                  Profile(),
                ],

              )
          ),

        ],
      ),
    );
  }
  _getIcon() {
    if ( _selectedTab == 0)
      return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Image.asset("assets/images/policyOr.png",
          width: 40,
          height: 40,
        ),
      );
    else if (_selectedTab==1)
      return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Image.asset("assets/images/listorderOr.png",
        width: 40,
          height: 40,
        ),
      );
    else if (_selectedTab ==2)
      return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Image.asset("assets/images/profileOr.png",
          width: 40,
          height: 40,
        ),
      );
  }

}

class BackGroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width/2, 0);
    var firstControlPoint = Offset(size.width/2+300,size.height/2-size.height/4);
    //var firstEndPoint = Offset(size.width/2-50, size.height/2+100);
    var firstEndPoint = Offset(100, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(100, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;

  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
