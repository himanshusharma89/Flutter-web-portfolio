import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/extensions/translateOnHover.dart';
import 'package:my_portfolio/utilities/profile_theme.dart';
import 'package:my_portfolio/utilities/responsiveLayout.dart';

class Me extends StatefulWidget {
  @override
  _MeState createState() => _MeState();
}

class _MeState extends State<Me> with SingleTickerProviderStateMixin  {
  AnimationController _controller;
  Animation _hi;
  Animation _name;
  Animation _designation;
  Animation _imgAnimation;
  String hi ="Hey! I am";
  String name = "HIMANSHU SHARMA";
  String designation = "Flutter Developer";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 5500));
    _hi = StepTween(begin: 0, end: hi.length).animate(CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.25, curve: Curves.easeIn)));
    _name = StepTween(begin: 0, end: name.length).animate(CurvedAnimation(parent: _controller, curve: Interval(0.2, 0.7, curve: Curves.easeIn)));
    _designation = StepTween(begin: 0, end: designation.length).animate(CurvedAnimation(parent: _controller, curve: Interval(0.65, 1, curve: Curves.easeIn)));
    _imgAnimation = CurvedAnimation(parent: _controller, curve: Interval(0.3, 0.6, curve: Curves.easeIn));
   _controller.forward();
   _controller.addListener(() {
     setState(() {});
   });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    if(ResponsiveLayout.isLargeScreen(context) || ResponsiveLayout.isMediumScreen(context)){
      return Column(
        children: [
          SizedBox(height:height*0.03),
          Container(
            height: height*0.85,
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: 0.7,
                    child: Container(
                      padding: const EdgeInsets.only(top:30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          AnimatedBuilder(
                            animation: _hi,
                            builder: (BuildContext context, Widget child) {
                              String text = hi.substring(0, _hi.value);
                              return Text(
                                text, 
                                style: TextStyle(
                                  letterSpacing: 0.2,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: ProfileTheme.subHeadingColor,
                                ),
                              );
                            },
                          ),
                          AnimatedBuilder(
                            animation: _name,
                            builder: (BuildContext context, Widget child) {
                              String text = name.substring(0, _name.value);
                              return Text(
                                text, 
                                style: TextStyle(
                                  letterSpacing: 0.2,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              );
                            },
                          ),
                          AnimatedBuilder(
                            animation: _designation,
                            builder: (BuildContext context, Widget child) {
                              String text = designation.substring(0, _designation.value);
                              return Text(
                                text, 
                                style: TextStyle(
                                  letterSpacing: 2,
                                  fontSize: 35,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Neue Helvetica',
                                  color: Colors.grey,
                                ),
                              );
                            },
                          ),
                          // TranslateOnHover(
                          //   child: HandCursor(
                          //     child: Transform.scale(
                          //       scale: _welcomAnimation.value,
                          //       child: Padding(
                          //         padding: const EdgeInsets.only(top:20.0),
                          //         child: DottedBorder(
                          //           dashPattern: [6, 4, 4, 6],
                          //           color: Colors.black,
                          //           child: Padding(
                          //             padding: const EdgeInsets.all(8.0),
                          //             child: Text(
                          //               "WELCOME TO MY PROFILE",
                          //               style: TextStyle(
                          //                 fontSize: 18,
                          //                 color: Colors.white
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: FractionallySizedBox(
                    alignment: Alignment.centerRight,
                    widthFactor: 0.6,
                    child: Stack(
                      children: [
                        FadeTransition(
                          opacity: _imgAnimation,
                          child: Container(
                            margin: const EdgeInsets.only(top:100),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(22.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(0.0, 3.0),
                                  blurRadius: 15
                                )
                              ]
                            ),
                            child: TranslateOnHover(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image.asset(
                                  'self.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(height:height*0.1),
          // MySeparator(color: Colors.grey,),
          // SizedBox(height:height*0.12),
        ],
      );
    } else {
      return Padding(
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
                  ),
                ),
                Text(
                  'My name is ',
                  style: TextStyle(
                    fontSize: 40, 
                    color: Colors.white,
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
                child: TranslateOnHover(
                  child: DottedBorder(
                    dashPattern: [6, 4, 4, 6],
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "WELCOME TO MY PROFILE",
                        style: TextStyle(
                          color: Colors.white,
                                                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: TranslateOnHover(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network('https://avatars0.githubusercontent.com/u/44980497?s=460&u=b25b445a569e149aceb9257e95a17152b2683c09&v=4',
                    width: 400.0,
                  )),
              ),
            ),
          ],
        ),
      );
    }
  }
}