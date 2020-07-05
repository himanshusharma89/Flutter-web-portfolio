import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/extensions/hoverExtensions.dart';
import 'package:my_portfolio/utilities/profile_theme.dart';
import 'package:my_portfolio/utilities/text_animation.dart';

class Me_LS extends StatefulWidget {
  @override
  _Me_LSState createState() => _Me_LSState();
}

class _Me_LSState extends State<Me_LS> with SingleTickerProviderStateMixin  {
  AnimationController _controller;
  Animation _welcomAnimation;
  String hi ="Hi!";
  String name = "HIMANSHU SHARMA";
  Animation _hi;
  Animation _name;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 4000));
    _hi = StepTween(begin: 0, end: hi.length).animate(CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.2, curve: Curves.easeIn)));
    _name = StepTween(begin: 0, end: name.length).animate(CurvedAnimation(parent: _controller, curve: Interval(0.2, 0.75, curve: Curves.easeIn)));
    _welcomAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
       parent: _controller,
       curve: Interval(0.75, 1.0, curve: Curves.easeOut)));
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
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
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
                        Transform.scale(
                          scale: _welcomAnimation.value,
                          child: Padding(
                            padding: const EdgeInsets.only(top:20.0),
                            child: DottedBorder(
                              dashPattern: [6, 4, 4, 6],
                              color: Colors.black,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "WELCOME TO MY PROFILE",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white
                                  ),
                                ),
                              ),
                            ).moveUpOnHover.showCursorOnHover,
                          ),
                        ),
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.asset(
                            'self.jfif',
                            fit: BoxFit.cover,
                          ),
                        ).moveUpOnHover
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