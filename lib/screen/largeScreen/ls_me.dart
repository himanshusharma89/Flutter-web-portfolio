import 'package:flutter/material.dart';
import 'package:my_portfolio/extensions/translateOnHover.dart';
import 'package:my_portfolio/utilities/profile_theme.dart';

class Me_LS extends StatefulWidget {
  @override
  _Me_LSState createState() => _Me_LSState();
}

class _Me_LSState extends State<Me_LS> with SingleTickerProviderStateMixin  {
  AnimationController _controller;
  Animation _hi;
  Animation _name;
  Animation _designation;
  // Animation _welcomAnimation;
  String hi ="Hey! I am";
  String name = "HIMANSHU SHARMA";
  String designation = "Flutter Developer";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 5500));
    _hi = StepTween(begin: 0, end: hi.length).animate(CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.25, curve: Curves.easeIn)));
    _name = StepTween(begin: 0, end: name.length).animate(CurvedAnimation(parent: _controller, curve: Interval(0.25, 0.65, curve: Curves.easeIn)));
    _designation = StepTween(begin: 0, end: designation.length).animate(CurvedAnimation(parent: _controller, curve: Interval(0.65, 1, curve: Curves.easeIn)));
    // _welcomAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Interval(0.70, 1.0, curve: Curves.easeOut)));
   _controller.forward();
   _controller.addListener(() {
     setState(() {});
   });
  }
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
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
                              text.toUpperCase(), 
                              style: TextStyle(
                                letterSpacing: 2,
                                fontSize: 35,
                                fontWeight: FontWeight.w500,
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
                      Container(
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
                              'self.jfif',
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
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
  }
}