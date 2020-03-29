import 'package:flutter/material.dart';
import 'package:my_portfolio/screen/home.dart';
import 'package:my_portfolio/screen/navbar.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff00c6ff), Color(0xff363795)]
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Navbar(),
              Home()
            ],
          ),
        ),
      ),
    );
  }
}