import 'package:flutter/material.dart';
import 'package:my_portfolio/screen/home.dart';
import 'package:my_portfolio/screen/navbar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  ItemScrollController controller;
  bool darkmode;

  @override
  void initState() {
    setState(() {
      darkmode=true;
    });
    super.initState();
    controller=ItemScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: darkmode? Color(0xff12181b): Colors.white
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Home(controller: controller,darkmode: true,),
            Navbar(controller: controller,darkmode: true,),
          ],
        ),
      ),
    );
  }
}