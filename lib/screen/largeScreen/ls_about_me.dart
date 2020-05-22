import 'package:flutter/material.dart';

class AboutMe_LS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        SizedBox(height:height*0.05),
        Text(
          "ABOUT ME",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 30.0,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width*0.0625,
          child: Divider(
            color: Colors.white,
            thickness: 3.0,
          )
        ),
        Padding(
          padding: const EdgeInsets.only(top:30.0,left:50.0,right: 50.0),
          child: Text(
            "Focused Computer Science major (9.84 CGPA) currently attending Chitkara University, with a aim to leverage a proven knowledge of competitive programming with C/C++ & Java, Flutter Application Development, and web designing skills. I am a content writer at IEEE CIET Branch, Open Source enthusiast and I also like to working on Alexa Skill and Google Assistant App development.\n I am a quick learner and frequently praised as hard-working by my peers",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white
            ),
          ),
        ),
        SizedBox(height:height*0.12),
      ],
    );
  }
}