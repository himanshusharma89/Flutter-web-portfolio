import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/utilities/responsiveLayout.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:my_portfolio/extensions/hoverExtensions.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: LargeChild(),
      smallScreen: SmallChild(),
    );
  }
}

class LargeChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height:20.0),
        Container(
          height: 600,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              FractionallySizedBox(
                alignment: Alignment.centerRight,
                widthFactor: 0.6,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(22.0))
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network('https://avatars0.githubusercontent.com/u/44980497?s=460&u=b25b445a569e149aceb9257e95a17152b2683c09&v=4',
                      width: 400.0,
                    ).moveUpOnHover,
                  )
                )
              ),
              FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: .6,
                child: Padding(
                  padding: EdgeInsets.only(left: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("Hello! ",
                            style: TextStyle(
                              fontSize: 30,
                              // fontWeight: FontWeight.bold,
                              fontFamily: "Poppins",
                              color: Colors.white
                            )
                          ),
                          Text(
                            "My name is ",
                            style: TextStyle(
                              fontSize: 30, 
                              color: Colors.white,
                              fontFamily: "Poppins"
                            ),
                          )
                        ],
                      ),
                      Text(
                        "HIMANSHU SHARMA",
                        style: TextStyle(
                          letterSpacing: 0.2,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: "Poppins"
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:20.0),
                        child: DottedBorder(
                          dashPattern: [6, 4, 4, 6],
                          color: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "WELCOME TO MY PROFILE",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: "Poppins",
                                color: Colors.white
                              ),
                            ),
                          ),
                        ).moveUpOnHover,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height:100.0),// GAP
        Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 10.0,left: 10.0),
                  child: Divider(
                    color: Colors.white,
                    thickness: 3.0,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    "I AM A ",
                    style: TextStyle(
                      letterSpacing: 1,
                      color: Colors.white,
                      fontSize: 25.0,
                      fontFamily: "Poppins"
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(60.0),
                    child: Image.asset('assets/flutter.png',
                      width: 90.0,
                    )
                  ).moveUpOnHover,
                  Text(
                    " FLUTTER DEVELOPER",
                    style: TextStyle(
                      letterSpacing: 1,
                      color: Colors.white,
                      fontSize: 25.0,
                      fontFamily: "Poppins"
                    ),
                  )
                ],
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left:10.0,right:10.0),
                  child: Divider(
                    color: Colors.white,
                    thickness: 3.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height:80.0),// GAP
        Container(
          child: Column(
            children: <Widget>[
              Text(
                "ABOUT ME",
                style: TextStyle(
                  fontFamily: "Poppins",
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
                    fontFamily: "Poppins",
                    color: Colors.white
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 80.0,),// GAP
        Container(
          child: Column(
            children: <Widget>[
              Text(
                "SKILLS",
                style: TextStyle(
                  fontFamily: "Poppins",
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
              SizedBox(height:30.0),
              Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircularPercentIndicator(
                        radius: 100.0,
                        animation: true,
                        animationDuration: 1200,
                        lineWidth: 15.0,
                        percent: 0.9,
                        center: GestureDetector(
                          onTap: () {
                            _launchURL('https://sourcerer.io/himanshusharma89');
                          },
                          child: Image.asset(
                            'assets/tech/c.png',
                            width: 55.0,
                          ).showCursorOnHover,
                        ),
                        circularStrokeCap: CircularStrokeCap.butt,
                        backgroundColor: Colors.white24,
                        progressColor: Colors.white,
                      ).moveUpOnHover,
                      CircularPercentIndicator(
                        radius: 100.0,
                        animation: true,
                        animationDuration: 1200,
                        lineWidth: 15.0,
                        percent: 0.6,
                        center: GestureDetector(
                          onTap: () {
                            _launchURL('https://sourcerer.io/himanshusharma89');
                          },
                          child: Image.asset(
                            'assets/tech/c++.png',
                            width: 55.0,
                          ).showCursorOnHover,
                        ),
                        circularStrokeCap: CircularStrokeCap.butt,
                        backgroundColor: Colors.white24,
                        progressColor: Colors.white,
                      ).moveUpOnHover,
                      CircularPercentIndicator(
                        radius: 100.0,
                        animation: true,
                        animationDuration: 1200,
                        lineWidth: 15.0,
                        percent: 0.7,
                        center: GestureDetector(
                          onTap: () {
                            _launchURL('https://sourcerer.io/himanshusharma89');
                          },
                          child: Image.asset(
                            'assets/tech/java.png',
                            width: 55.0,
                          ).showCursorOnHover,
                        ),
                        circularStrokeCap: CircularStrokeCap.butt,
                        backgroundColor: Colors.white24,
                        progressColor: Colors.white,
                      ).moveUpOnHover,
                      CircularPercentIndicator(
                        radius: 100.0,
                        animation: true,
                        animationDuration: 1200,
                        lineWidth: 15.0,
                        percent: 0.9,
                        center: GestureDetector(
                          onTap: () {
                            _launchURL('https://sourcerer.io/himanshusharma89');
                          },
                          child: Image.asset(
                            'assets/tech/html.png',
                            width: 43.0,
                          ).showCursorOnHover,
                        ),
                        circularStrokeCap: CircularStrokeCap.butt,
                        backgroundColor: Colors.white24,
                        progressColor: Colors.white,
                      ).moveUpOnHover,
                      CircularPercentIndicator(
                        radius: 100.0,
                        animation: true,
                        animationDuration: 1200,
                        lineWidth: 15.0,
                        percent: 0.8,
                        center: GestureDetector(
                          onTap: () {
                            _launchURL('https://sourcerer.io/himanshusharma89');
                          },
                          child: Image.asset(
                            'assets/tech/css.png',
                            width:43.0,
                          ).showCursorOnHover,
                        ),
                        circularStrokeCap: CircularStrokeCap.butt,
                        backgroundColor: Colors.white24,
                        progressColor: Colors.white,
                      ).moveUpOnHover,
                      CircularPercentIndicator(
                        radius: 100.0,
                        animation: true,
                        animationDuration: 1200,
                        lineWidth: 15.0,
                        percent: 0.8,
                        center: GestureDetector(
                          onTap: () {
                            _launchURL('https://sourcerer.io/himanshusharma89');
                          },
                          child: Image.asset(
                            'assets/tech/dart.png',
                            width: 45.0,
                          ).showCursorOnHover,
                        ),
                        circularStrokeCap: CircularStrokeCap.butt,
                        backgroundColor: Colors.white24,
                        progressColor: Colors.white,
                      ).moveUpOnHover,
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 80.0,),// GAP
        Container(
          child: Column(
            children: <Widget>[
              Text(
                "EXPERIENCE",
                style: TextStyle(
                  fontFamily: "Poppins",
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
              SizedBox(height:30.0),
              Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:200.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width*0.7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0.0, 3.0),
                                blurRadius: 6.0,
                                color: Colors.black26
                              )
                            ]
                          ),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                  Image.asset(
                                    'assets/experience/gssoc.png',
                                    width: 150.0,
                                    height: 150.0,
                                  ),
                                  SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'GSSOC\'20 Participant',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'GIRLSCRIPT',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontStyle: FontStyle.italic,
                                              color: Colors.grey
                                            ),
                                          ),
                                          SizedBox(width: MediaQuery.of(context).size.width*0.31,),
                                          Text(
                                            '03/20 to Present',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontStyle: FontStyle.italic,
                                              color: Colors.grey
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                      Text(
                                        'Contributing to Open Source projects on GitHub as a participant of GSSOC 2020.',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      )
                                    ],
                                  ),
                                  // SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                        Container(
                          width: MediaQuery.of(context).size.width*0.7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0.0, 3.0),
                                blurRadius: 6.0,
                                color: Colors.black26
                              )
                            ]
                          ),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                  Image.asset(
                                    'assets/experience/jwoc.jfif',
                                    width: 150.0,
                                    height: 150.0,
                                  ).showCursorOnHover,
                                  SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'JWOC Participant',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'JGEC Winter Of Code',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontStyle: FontStyle.italic,
                                              color: Colors.grey
                                            ),
                                          ),
                                          SizedBox(width: MediaQuery.of(context).size.width*0.25,),
                                          Text(
                                            '01/20 to 02/2020',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontStyle: FontStyle.italic,
                                              color: Colors.grey
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                      Text(
                                        'Ranked 5th as a top contributor to Open Source projects on GitHub as a \nparticipant of JwoC (JGEC Winter of Code).',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      )
                                    ],
                                  ),
                                  // SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                        Container(
                          width: MediaQuery.of(context).size.width*0.7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0.0, 3.0),
                                blurRadius: 6.0,
                                color: Colors.black26
                              )
                            ]
                          ),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                  Image.asset(
                                    'assets/experience/google.png',
                                    width: 150.0,
                                    height: 150.0,
                                  ).showCursorOnHover,
                                  SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Build for Digital India Trainee',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'GOOGLE',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontStyle: FontStyle.italic,
                                              color: Colors.grey
                                            ),
                                          ),
                                          SizedBox(width: MediaQuery.of(context).size.width*0.33,),
                                          Text(
                                            '10/19 to 01/2020',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontStyle: FontStyle.italic,
                                              color: Colors.grey
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                      Text(
                                        'Got selected as a ChangeMaker and developed a mobile application using \nFlutter and Dart and with Firebase and Google Cloud Platform Places API, under \nBuild For Digital India program.',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      )
                                    ],
                                  ),
                                  // SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                        Container(
                          width: MediaQuery.of(context).size.width*0.7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0.0, 3.0),
                                blurRadius: 6.0,
                                color: Colors.black26
                              )
                            ]
                          ),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                  Image.asset(
                                    'assets/experience/QSwhite.png',
                                    width: 150.0,
                                    height: 150.0,
                                  ).showCursorOnHover,
                                  SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Flutter Developer',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'QuickStay',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontStyle: FontStyle.italic,
                                              color: Colors.grey
                                            ),
                                          ),
                                          SizedBox(width: MediaQuery.of(context).size.width*0.32,),
                                          Text(
                                            '12/19 to Present',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontStyle: FontStyle.italic,
                                              color: Colors.grey
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                      Text(
                                        'Developing a mobile application, using Flutter with Dart and Firebase as a \nbackend for authentication and storage of user data for the startup QuickStay.',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      )
                                    ],
                                  ),
                                  // SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                        Container(
                          width: MediaQuery.of(context).size.width*0.7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0.0, 3.0),
                                blurRadius: 6.0,
                                color: Colors.black26
                              )
                            ]
                          ),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                  Image.asset(
                                    'assets/experience/ieee.png',
                                    width: 150.0,
                                    height: 150.0,
                                  ).showCursorOnHover,
                                  SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Content Writer',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'IEEE CIET STUDENT BRANCH',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontStyle: FontStyle.italic,
                                              color: Colors.grey
                                            ),
                                          ),
                                          SizedBox(width: MediaQuery.of(context).size.width*0.23,),
                                          Text(
                                            '05/19 to Present',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontStyle: FontStyle.italic,
                                              color: Colors.grey
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                      Text(
                                        'Created content for various events like Workshops, Hackathons, Expert Talk, and \nOrientation Program for freshers organised by IEEE CIET Student Branch.',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      )
                                    ],
                                  ),
                                  // SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                        Container(
                          width: MediaQuery.of(context).size.width*0.7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0.0, 3.0),
                                blurRadius: 6.0,
                                color: Colors.black26
                              )
                            ]
                          ),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                  Image.asset(
                                    'assets/social/gfg2.png',
                                    width: 150.0,
                                    height: 150.0,
                                  ).showCursorOnHover,
                                  SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Campus Ambassador',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'GEEKSFORGEEKS',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontStyle: FontStyle.italic,
                                              color: Colors.grey
                                            ),
                                          ),
                                          SizedBox(width: MediaQuery.of(context).size.width*0.28,),
                                          Text(
                                            '06/19 to Present',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontStyle: FontStyle.italic,
                                              color: Colors.grey
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                      Text(
                                        'Organizing and managing GeeksforGeeks presence in college fests and other \ntechnical events, and involving students from first to a final year to actively \nparticipate in GeeksforGeeks activities and contributions.',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      )
                                    ],
                                  ),
                                  // SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 80.0,),//Gap
        Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(top:30.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  focalRadius: 1.0,
                  colors: [ Colors.blueAccent,Colors.black]
                )
              ),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        RotateAnimatedTextKit(
                          totalRepeatCount: 1000,
                          text: ["CODE", "DEBUG", "ANALYZE", "DESIGN"],
                          textStyle: TextStyle(
                            fontSize: 40.0, 
                            fontFamily: "Star Jedi",
                            color: Colors.white
                          ),
                          textAlign: TextAlign.start,
                          alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                        ),
                      ],
                    ),
                    Text(
                      "PROJECTS",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 30.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Container(
                    width: MediaQuery.of(context).size.width*0.0625,
                      child: Divider(
                        color: Colors.white,
                        thickness: 3.0,
                      ),
                    ),
                    SizedBox(height:30.0),
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                color: Colors.white,
                              ),
                              width: 300.0,
                              height:510.0,
                              child: GestureDetector(
                                onTap: () {
                                  _launchURL('https://github.com/himanshusharma89/Flutter-Blog-App');
                                },
                                child: Card(
                                  color: Colors.black,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(height:10.0),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(80.0),
                                          child: Image.asset(
                                            'assets/flutter.png',
                                            width: 150.0,
                                          ),
                                        ),
                                        SizedBox(height:30.0),
                                        Text(
                                          'FLUTTER BLOG APP',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Poppins"
                                          ),
                                        ),
                                        SizedBox(height:30.0),
                                        Text(
                                          'This is a Blog App developed with Flutter Framework and Dart programming language. It is just a blog adding and saving application. This is a fully functional app with Firebase backend.',
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            fontFamily: "Poppins"
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ).showCursorOnHover.moveUpOnHover,
                            SizedBox(width: 120.0,),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                color: Colors.white,
                              ),
                              width: 300.0,
                              height:510.0,
                              child: GestureDetector(
                                onTap: () {
                                  _launchURL('https://github.com/himanshusharma89/Way-Back-Home');
                                },
                                child: Card(
                                  color: Colors.black,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(height:10.0),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(80.0),
                                          child: Image.asset(
                                            'assets/flutter.png',
                                            width: 150.0,
                                          ),
                                        ),
                                        SizedBox(height:30.0),
                                        Text(
                                          'WAY BACK HOME',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Poppins"
                                          ),
                                        ),
                                        SizedBox(height:30.0),
                                        Text(
                                          'This is a app which is under development, developed with Flutter Framework and Dart programming for BUILD FOR DIGITAL INDIA #BFDI initiative by Govt. and Google',
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            fontFamily: "Poppins"
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ).showCursorOnHover.moveUpOnHover,
                          ],
                        ),
                        SizedBox(height:70.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                color: Colors.white,
                              ),
                              width: 300.0,
                              height:510.0,
                              child: GestureDetector(
                                onTap: () {
                                  _launchURL('https://github.com/himanshusharma89/TIET-Makeathon-2.0');
                                },
                                child: Card(
                                  color: Colors.black,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(height:10.0),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(80.0),
                                          child: Image.asset(
                                            'assets/flutter.png',
                                            width: 150.0,
                                          ),
                                        ),
                                        SizedBox(height:30.0),
                                        Text(
                                          'WATER MONITORING SYSTEM',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Poppins"
                                          ),
                                        ),
                                        SizedBox(height:30.0),
                                        Text(
                                          'Water​ ​Monitoring​ ​System​ ​is​ ​an​ ​IOT​ ​based​ ​Flutter​ Project ​that​ ​has mechanisms​ ​to​ ​keep​ ​the​ ​user​ ​alerted​ ​in​ ​case​ ​of​ ​liquid​ ​overflow​. Developed for Makeathon 2.0 @ TIET.',
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            fontFamily: "Poppins"
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ).showCursorOnHover.moveUpOnHover,
                            SizedBox(width: 120.0,),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                color: Colors.white,
                              ),
                              width: 300.0,
                              height:510.0,
                              child: GestureDetector(
                                onTap: () {
                                  _launchURL('https://github.com/himanshusharma89/Flutter-Card-Carousel');
                                },
                                child: Card(
                                  color: Colors.black,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(height:10.0),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(80.0),
                                          child: Image.asset(
                                            'assets/flutter.png',
                                            width: 150.0,
                                          ),
                                        ),
                                        SizedBox(height:30.0),
                                        Text(
                                          'FLUTTER CARD CAROUSEL TEMPLATE',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Poppins"
                                          ),
                                        ),
                                        SizedBox(height:30.0),
                                        Text(
                                          'This is template for creating card carousel in Flutter with the help of carousel_slider package',
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            fontFamily: "Poppins"
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ).showCursorOnHover.moveUpOnHover,
                          ],
                        )
                      ],
                    ),
                    SizedBox(height:100.0)
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 80.0,),// GAP
        Container(
          child: Column(
            children: <Widget>[
              Text(
                "ARTICLES",
                style: TextStyle(
                  fontFamily: "Poppins",
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
              SizedBox(height:30.0),
              Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: Colors.black,
                        ),
                        width: 250.0,
                        height: 300.0,
                        child: GestureDetector(
                          onTap: () {
                            _launchURL('https://medium.com/@rageremix/how-to-create-card-carousel-in-flutter-979bc8ecf19');
                          },
                          child: Card(
                            color: Colors.white,
                            child: Column(
                              children: <Widget>[
                                SizedBox(height:10.0),
                                Image.asset(
                                  'assets/social/medium.png',
                                  width: 150.0,
                                ),
                                SizedBox(height:30.0),
                                Text(
                                  'HOW TO CREATE CARD CAROUSEL IN FLUTTER?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ).showCursorOnHover.moveUpOnHover,
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: Colors.black,
                        ),
                        width: 250.0,
                        height: 300.0,
                        child: GestureDetector(
                          onTap: () {
                            _launchURL('https://www.geeksforgeeks.org/blockchain-in-brief/');
                          },
                          child: Card(
                            color: Colors.white,
                            child: Column(
                              children: <Widget>[
                                SizedBox(height:10.0),
                                Image.asset(
                                  'assets/social/gfg1.png',
                                  width: 150.0,
                                ),
                                SizedBox(height:30.0),
                                Text(
                                  'BLOCKCHAIN IN BRIEF?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ).showCursorOnHover.moveUpOnHover,
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: Colors.black,
                        ),
                        width: 250.0,
                        height: 300.0,
                        child: GestureDetector(
                          onTap: () {
                            _launchURL('https://medium.com/@rageremix/my-story-of-app-development-with-flutter-dart-ed6b41cc8226');
                          },
                          child: Card(
                            color: Colors.white,
                            child: Column(
                              children: <Widget>[
                                SizedBox(height:10.0),
                                Image.asset(
                                  'assets/social/medium.png',
                                  width: 150.0,
                                ),
                                SizedBox(height:30.0),
                                Text(
                                  'MY STORY OF APP DEVELOPMENT WITH FLUTTER & DART',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ).showCursorOnHover.moveUpOnHover,
                    ],
                  ),
                ),
              ),
              SizedBox(height:80.0)
            ],
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 10.0,left: 10.0),
                  child: Divider(
                    color: Colors.white,
                    thickness: 3.0,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    "THIS WEBSITE IS CREATED WITH ",
                    style: TextStyle(
                      letterSpacing: 1,
                      color: Colors.white,
                      fontSize: 22.0,
                      fontFamily: "Poppins"
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(60.0),
                    child: Image.asset('assets/flutter.png',
                      width: 65.0,
                    )
                  ).moveUpOnHover,
                  Text(
                    " FLUTTER WEB ❤",
                    style: TextStyle(
                      letterSpacing: 1,
                      color: Colors.white,
                      fontSize: 22.0,
                      fontFamily: "Poppins"
                    ),
                  )
                ],
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left:10.0,right:10.0),
                  child: Divider(
                    color: Colors.white,
                    thickness: 3.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height:80.0)
      ],
    );
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class SmallChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left:40,right: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height:30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Hello! ",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                        fontFamily: "Poppins"
                      ),
                    ),
                    Text(
                      'My name is ',
                      style: TextStyle(
                        fontSize: 40, 
                        color: Colors.white,
                        fontFamily: "Poppins"
                      ),
                    )
                  ],
                ),
                Center(
                  child: RichText(
                    text:TextSpan(
                      text: "H",
                      style: TextStyle(
                        letterSpacing: 0.2,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: "Poppins"
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "IMANSHU ",
                          style: TextStyle(
                            // fontWeight: FontWeight.normal,
                            fontSize: 40.0
                          )
                        ),
                        TextSpan(
                          text: "S",
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: 50.0,
                          )
                        ),
                        TextSpan(
                          text: "HARMA",
                          style: TextStyle(
                            fontSize: 40.0,
                            // fontWeight: FontWeight.normal
                          )
                        )
                      ]
                    )
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: DottedBorder(
                      dashPattern: [6, 4, 4, 6],
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "WELCOME TO MY PROFILE",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins"
                          ),
                        ),
                      ),
                    ).moveUpOnHover,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network('https://avatars0.githubusercontent.com/u/44980497?s=460&u=b25b445a569e149aceb9257e95a17152b2683c09&v=4',
                      width: 400.0,
                    )).moveUpOnHover,
                ),
              ],
            ),
          ),
          SizedBox(height:80.0),
          Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 10.0,left: 10.0),
                  child: Divider(
                    color: Colors.white,
                    thickness: 3.0,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    "I AM A ",
                    style: TextStyle(
                      letterSpacing: 1,
                      color: Colors.white,
                      fontSize: 20.0,
                      fontFamily: "Poppins"
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(60.0),
                    child: Image.asset('assets/flutter.png',
                      width: 80.0,
                    )
                  ).moveUpOnHover,
                  Text(
                    " FLUTTER DEVELOPER",
                    style: TextStyle(
                      letterSpacing: 1,
                      color: Colors.white,
                      fontSize: 20.0,
                      fontFamily: "Poppins"
                    ),
                  )
                ],
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left:10.0,right:10.0),
                  child: Divider(
                    color: Colors.white,
                    thickness: 3.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height:80.0),
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  "About Me",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.125,
                  child: Divider(
                    color: Colors.white,
                    thickness: 3.0,
                  )
                ),
                Padding(
                  padding: const EdgeInsets.only(top:30.0,left:50.0,right: 50.0),
                  child: Text(
                    "Focused Computer Science major (9.84 CGPA) currently attending Chitkara University, with a aim to leverage a proven knowledge of competitive programming with C/C++ & Java, Flutter Application Development, and web designing skills. I am a content writer at IEEE CIET Branch, Open Source enthusiast and I also like to working on Alexa Skill and Google Assistant App development.\nI am a quick learner and frequently praised as hard-working by my peers",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: "Poppins",
                      color: Colors.white
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height:80.0),
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  "SKILLS",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.125,
                  child: Divider(
                    color: Colors.white,
                    thickness: 3.0,
                  )
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            CircularPercentIndicator(
                              radius: 130.0,
                              animation: true,
                              animationDuration: 1200,
                              lineWidth: 15.0,
                              percent: 0.9,
                              center: GestureDetector(
                                onTap: () {
                                  _launchURL('https://sourcerer.io/himanshusharma89');
                                },
                                child: Image.asset(
                                  'assets/tech/c.png',
                                  width: 55.0,
                                ).showCursorOnHover,
                              ),
                              circularStrokeCap: CircularStrokeCap.butt,
                              backgroundColor: Colors.white24,
                              progressColor: Colors.white,
                            ),
                            CircularPercentIndicator(
                              radius: 130.0,
                              animation: true,
                              animationDuration: 1200,
                              lineWidth: 15.0,
                              percent: 0.6,
                              center: GestureDetector(
                                onTap: () {
                                  _launchURL('https://sourcerer.io/himanshusharma89');
                                },
                                child: Image.asset(
                                  'assets/tech/c++.png',
                                  width: 55.0,
                                ).showCursorOnHover,
                              ),
                              circularStrokeCap: CircularStrokeCap.butt,
                              backgroundColor: Colors.white24,
                              progressColor: Colors.white,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            CircularPercentIndicator(
                              radius: 130.0,
                              animation: true,
                              animationDuration: 1200,
                              lineWidth: 15.0,
                              percent: 0.7,
                              center: GestureDetector(
                                onTap: () {
                                  _launchURL('https://sourcerer.io/himanshusharma89');
                                },
                                child: Image.asset(
                                  'assets/tech/java.png',
                                  width: 55.0,
                                ).showCursorOnHover,
                              ),
                              circularStrokeCap: CircularStrokeCap.butt,
                              backgroundColor: Colors.white24,
                              progressColor: Colors.white,
                            ),
                            CircularPercentIndicator(
                              radius: 130.0,
                              animation: true,
                              animationDuration: 1200,
                              lineWidth: 15.0,
                              percent: 0.9,
                              center: GestureDetector(
                                onTap: () {
                                  _launchURL('https://sourcerer.io/himanshusharma89');
                                },
                                child: Image.asset(
                                  'assets/tech/html.png',
                                  width: 50.0,
                                ).showCursorOnHover,
                              ),
                              circularStrokeCap: CircularStrokeCap.butt,
                              backgroundColor: Colors.white24,
                              progressColor: Colors.white,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            CircularPercentIndicator(
                              radius: 130.0,
                              animation: true,
                              animationDuration: 1200,
                              lineWidth: 15.0,
                              percent: 0.8,
                              center: GestureDetector(
                                onTap: () {
                                  _launchURL('https://sourcerer.io/himanshusharma89');
                                },
                                child: Image.asset(
                                  'assets/tech/css.png',
                                  width: 50.0,
                                ).showCursorOnHover,
                              ),
                              circularStrokeCap: CircularStrokeCap.butt,
                              backgroundColor: Colors.white24,
                              progressColor: Colors.white,
                            ),
                            CircularPercentIndicator(
                              radius: 130.0,
                              animation: true,
                              animationDuration: 1200,
                              lineWidth: 15.0,
                              percent: 0.8,
                              center: GestureDetector(
                                onTap: () {
                                  _launchURL('https://sourcerer.io/himanshusharma89');
                                },
                                child: Image.asset(
                                  'assets/tech/dart.png',
                                  width: 50.0,
                                ).showCursorOnHover,
                              ),
                              circularStrokeCap: CircularStrokeCap.butt,
                              backgroundColor: Colors.white24,
                              progressColor: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
          child: Column(
            children: <Widget>[
              Text(
                "EXPERIENCE",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.56,
                child: Divider(
                  color: Colors.white,
                  thickness: 3.0,
                )
              ),
              SizedBox(height:30.0),
              Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width*0.56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0.0, 3.0),
                              blurRadius: 6.0,
                              color: Colors.black26
                            )
                          ]
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                // SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                Image.asset(
                                  'assets/experience/gssoc.png',
                                  width: 150.0,
                                  height: 150.0,
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.055,),
                                Text(
                                  'GSSOC\'20 Participant',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  'GIRLSCRIPT',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey
                                  ),
                                ),
                                // SizedBox(width: MediaQuery.of(context).size.width*0.31,),
                                Text(
                                  '03/20 to Present',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey
                                  ),
                                ),
                                // SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                      Container(
                        width: MediaQuery.of(context).size.width*0.56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0.0, 3.0),
                              blurRadius: 6.0,
                              color: Colors.black26
                            )
                          ]
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                // SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                Image.asset(
                                  'assets/experience/jwoc.jfif',
                                  width: 150.0,
                                  height: 150.0,
                                ).showCursorOnHover,
                                SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                Text(
                                  'JWOC Participant',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  'JGEC Winter Of Code',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey
                                  ),
                                ),
                                // SizedBox(width: MediaQuery.of(context).size.width*0.25,),
                                Text(
                                  '01/20 to 02/2020',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey
                                  ),
                                ),
                                // SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                      Container(
                        width: MediaQuery.of(context).size.width*0.56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0.0, 3.0),
                              blurRadius: 6.0,
                              color: Colors.black26
                            )
                          ]
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                // SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                Image.asset(
                                  'assets/experience/google.png',
                                  width: 150.0,
                                  height: 150.0,
                                ).showCursorOnHover,
                                // SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                Text(
                                  'Build for Digital India \nTrainee',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  'GOOGLE',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey
                                  ),
                                ),
                                // SizedBox(width: MediaQuery.of(context).size.width*0.33,),
                                Text(
                                  '10/19 to 01/2020',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey
                                  ),
                                ),
                                // SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                      Container(
                        width: MediaQuery.of(context).size.width*0.56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0.0, 3.0),
                              blurRadius: 6.0,
                              color: Colors.black26
                            )
                          ]
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                // SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                Image.asset(
                                  'assets/experience/QSwhite.png',
                                  width: 150.0,
                                  height: 150.0,
                                ).showCursorOnHover,
                                SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                Text(
                                  'Flutter Developer',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  'QuickStay',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey
                                  ),
                                ),
                                // SizedBox(width: MediaQuery.of(context).size.width*0.32,),
                                Text(
                                  '12/19 to Present',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey
                                  ),
                                ),
                                // SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                      Container(
                        width: MediaQuery.of(context).size.width*0.56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0.0, 3.0),
                              blurRadius: 6.0,
                              color: Colors.black26
                            )
                          ]
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                // SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                Image.asset(
                                  'assets/experience/ieee.png',
                                  width: 150.0,
                                  height: 150.0,
                                ).showCursorOnHover,
                                SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                Text(
                                  'Content Writer',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  'IEEE CIET STUDENT BRANCH',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey
                                  ),
                                ),
                                // SizedBox(width: MediaQuery.of(context).size.width*0.23,),
                                Text(
                                  '05/19 to Present',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey
                                  ),
                                ),
                                // SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                      Container(
                        width: MediaQuery.of(context).size.width*0.56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0.0, 3.0),
                              blurRadius: 6.0,
                              color: Colors.black26
                            )
                          ]
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                // SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                Image.asset(
                                  'assets/social/gfg2.png',
                                  width: 150.0,
                                  height: 150.0,
                                ).showCursorOnHover,
                                SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                Text(
                                  'Campus Ambassador',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  'GEEKSFORGEEKS',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey
                                  ),
                                ),
                                // SizedBox(width: MediaQuery.of(context).size.width*0.28,),
                                Text(
                                  '06/19 to Present',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey
                                  ),
                                ),
                                // SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top:30.0),
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    focalRadius: 1.0,
                    colors: [ Colors.blueAccent,Colors.black]
                  )
                ),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          RotateAnimatedTextKit(
                            totalRepeatCount: 1000,
                            text: ["CODE", "DEBUG", "ANALYZE", "DESIGN"],
                            textStyle: TextStyle(
                              fontSize: 55.0, 
                              fontFamily: "Star Jedi",
                              color: Colors.white
                            ),
                            textAlign: TextAlign.start,
                            alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                          ),
                        ],
                      ),
                      Text(
                        "PROJECTS",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Container(
                      width: MediaQuery.of(context).size.width*0.0625,
                        child: Divider(
                          color: Colors.white,
                          thickness: 3.0,
                        ),
                      ),
                      SizedBox(height:30.0),
                      Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: Colors.white,
                            ),
                            width: MediaQuery.of(context).size.width*0.56,
                            child: GestureDetector(
                              onTap: () {
                                _launchURL('https://github.com/himanshusharma89/Flutter-Blog-App');
                              },
                              child: Card(
                                color: Colors.black,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(height:10.0),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(80.0),
                                        child: Image.asset(
                                          'assets/flutter.png',
                                          width: 150.0,
                                        ),
                                      ),
                                      SizedBox(height:30.0),
                                      Text(
                                        'FLUTTER BLOG APP',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Poppins"
                                        ),
                                      ),
                                      SizedBox(height:30.0),
                                      Text(
                                        'This is a Blog App developed with Flutter Framework and Dart programming language. It is just a blog adding and saving application. This is a fully functional app with Firebase backend.',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontFamily: "Poppins"
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ).showCursorOnHover.moveUpOnHover,
                          SizedBox(height:40.0),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: Colors.white,
                            ),
                            width: MediaQuery.of(context).size.width*0.56,
                            child: GestureDetector(
                              onTap: () {
                                _launchURL('https://github.com/himanshusharma89/Way-Back-Home');
                              },
                              child: Card(
                                color: Colors.black,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(height:10.0),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(80.0),
                                        child: Image.asset(
                                          'assets/flutter.png',
                                          width: 150.0,
                                        ),
                                      ),
                                      SizedBox(height:30.0),
                                      Text(
                                        'WAY BACK HOME',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Poppins"
                                        ),
                                      ),
                                      SizedBox(height:30.0),
                                      Text(
                                        'This is a app which is under development, developed with Flutter Framework and Dart programming for BUILD FOR DIGITAL INDIA #BFDI initiative by Govt. and Google',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontFamily: "Poppins"
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ).showCursorOnHover.moveUpOnHover,
                          SizedBox(height:40.0),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: Colors.white,
                            ),
                            width: MediaQuery.of(context).size.width*0.56,
                            child: GestureDetector(
                              onTap: () {
                                _launchURL('https://github.com/himanshusharma89/TIET-Makeathon-2.0');
                              },
                              child: Card(
                                color: Colors.black,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(height:10.0),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(80.0),
                                        child: Image.asset(
                                          'assets/flutter.png',
                                          width: 150.0,
                                        ),
                                      ),
                                      SizedBox(height:30.0),
                                      Text(
                                        'WATER MONITORING SYSTEM',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Poppins"
                                        ),
                                      ),
                                      SizedBox(height:30.0),
                                      Text(
                                        'Water​ ​Monitoring​ ​System​ ​is​ ​an​ ​IOT​ ​based​ ​Liquid​ ​Flutter​ Project ​that​ ​has mechanisms​ ​to​ ​keep​ ​the​ ​user​ ​alerted​ ​in​ ​case​ ​of​ ​liquid​ ​overflow​ ​or​ ​when​ ​tank​ ​depletes. This project was developed for Makeathon 2.0 @ TIET.',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontFamily: "Poppins"
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ).showCursorOnHover.moveUpOnHover,
                          SizedBox(height:40.0),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: Colors.white,
                            ),
                            width: MediaQuery.of(context).size.width*0.56,
                            child: GestureDetector(
                              onTap: () {
                                _launchURL('https://github.com/himanshusharma89/Flutter-Card-Carousel');
                              },
                              child: Card(
                                color: Colors.black,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(height:10.0),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(80.0),
                                        child: Image.asset(
                                          'assets/flutter.png',
                                          width: 150.0,
                                        ),
                                      ),
                                      SizedBox(height:30.0),
                                      Text(
                                        'FLUTTER CARD CAROUSEL TEMPLATE',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Poppins"
                                        ),
                                      ),
                                      SizedBox(height:30.0),
                                      Text(
                                        'This is template for creating card carousel in Flutter with the help of carousel_slider package',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontFamily: "Poppins"
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ).showCursorOnHover.moveUpOnHover,
                        ],
                      ),
                      SizedBox(height:100.0)
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 80.0,),// GAP
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  "ARTICLES",
                  style: TextStyle(
                    fontFamily: "Poppins",
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
                SizedBox(height:30.0),
                Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: Colors.black,
                          ),
                          width: MediaQuery.of(context).size.width*0.56,
                          child: GestureDetector(
                            onTap: () {
                              _launchURL('https://medium.com/@rageremix/how-to-create-card-carousel-in-flutter-979bc8ecf19');
                            },
                            child: Card(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height:10.0),
                                    Image.asset(
                                      'assets/social/medium.png',
                                      width: 150.0,
                                    ),
                                    SizedBox(height:30.0),
                                    Text(
                                      'HOW TO CREATE CARD CAROUSEL IN FLUTTER?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ).showCursorOnHover.moveUpOnHover,
                        SizedBox(height:40.0),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: Colors.black,
                          ),
                          width: MediaQuery.of(context).size.width*0.56,
                          child: GestureDetector(
                            onTap: () {
                              _launchURL('https://www.geeksforgeeks.org/blockchain-in-brief/');
                            },
                            child: Card(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height:10.0),
                                    Image.asset(
                                      'assets/social/gfg1.png',
                                      width: 150.0,
                                    ),
                                    SizedBox(height:30.0),
                                    Text(
                                      'BLOCKCHAIN IN BRIEF?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ).showCursorOnHover.moveUpOnHover,
                        SizedBox(height:40.0),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: Colors.black,
                          ),
                          width: MediaQuery.of(context).size.width*0.56,
                          child: GestureDetector(
                            onTap: () {
                              _launchURL('https://medium.com/@rageremix/my-story-of-app-development-with-flutter-dart-ed6b41cc8226');
                            },
                            child: Card(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height:10.0),
                                    Image.asset(
                                      'assets/social/medium.png',
                                      width: 150.0,
                                    ),
                                    SizedBox(height:30.0),
                                    Text(
                                      'MY STORY OF APP DEVELOPMENT WITH FLUTTER & DART',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ).showCursorOnHover.moveUpOnHover,
                      ],
                    ),
                  ),
                ),
                SizedBox(height:80.0)
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 10.0,left: 10.0),
                    child: Divider(
                      color: Colors.white,
                      thickness: 3.0,
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "THIS WEBSITE IS CREATED WITH ",
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.white,
                        fontSize: 16.0,
                        fontFamily: "Poppins"
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(60.0),
                      child: Image.asset('assets/flutter.png',
                        width: 80.0,
                      )
                    ).moveUpOnHover,
                    Text(
                      " FLUTTER WEB ❤",
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.white,
                        fontSize: 16.0,
                        fontFamily: "Poppins"
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left:10.0,right:10.0),
                    child: Divider(
                      color: Colors.white,
                      thickness: 3.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height:80.0)
        ],
      ),
    );
  }
}

_launchURL(String Url) async {
    var url = Url;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }