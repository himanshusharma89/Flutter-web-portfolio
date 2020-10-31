import 'package:flutter/material.dart';
import 'package:my_portfolio/helpers/translateOnHover.dart';
import 'package:my_portfolio/profile_theme.dart';
import 'package:my_portfolio/helpers/responsiveLayout.dart';

class Me extends StatefulWidget {
  @override
  _MeState createState() => _MeState();
}

class _MeState extends State<Me> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _hi;
  Animation _name;
  Animation _designation;
  Animation _imgAnimation;
  String hi = "Hey! I am";
  String name = "HIMANSHU SHARMA";
  String designation = "Flutter Developer";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5500));
    _hi = StepTween(begin: 0, end: hi.length).animate(CurvedAnimation(
        parent: _controller, curve: Interval(0.0, 0.25, curve: Curves.easeIn)));
    _name = StepTween(begin: 0, end: name.length).animate(CurvedAnimation(
        parent: _controller, curve: Interval(0.2, 0.7, curve: Curves.easeIn)));
    _designation = StepTween(begin: 0, end: designation.length).animate(
        CurvedAnimation(
            parent: _controller,
            curve: Interval(0.65, 1, curve: Curves.easeIn)));
    _imgAnimation = CurvedAnimation(
        parent: _controller, curve: Interval(0.3, 0.6, curve: Curves.easeIn));
    _controller.forward();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    if (ResponsiveLayout.isLargeScreen(context) ||
        ResponsiveLayout.isMediumScreen(context)) {
      return Center(
        child: FittedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: width * 0.23,
                  child: Text(
                    name,
                    textAlign: TextAlign.right,
                    maxLines: 2,
                    style: TextStyle(
                      letterSpacing: 2.2,
                      fontSize:
                          ResponsiveLayout.isMediumScreen(context) ? 25 : 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.01,
                ),
                Container(
                  height: ResponsiveLayout.isMediumScreen(context)
                      ? height * 0.6
                      : height * 0.7,
                  width: ResponsiveLayout.isMediumScreen(context)
                      ? height * 0.6
                      : height * 0.7,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 23,
                        color: ProfileTheme.navbarItemColor,
                      )
                      // boxShadow: [
                      //   BoxShadow(
                      //     offset: Offset(0,3),
                      //     color: ProfileTheme.navbarItemColor,
                      //     blurRadius: 10
                      //   ),
                      //   BoxShadow(
                      //     offset: Offset(3,0),
                      //     color: ProfileTheme.navbarItemColor,
                      //     blurRadius: 10
                      //   )
                      // ]
                      ),
                ),
                SizedBox(
                  width: width * 0.01,
                ),
                Container(
                  width: width * 0.23,
                  child: Text(
                    designation.toUpperCase(),
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    style: TextStyle(
                      letterSpacing: 2.2,
                      fontSize:
                          ResponsiveLayout.isMediumScreen(context) ? 25 : 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return Container(
        color: ProfileTheme.backgroundColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 65),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ProfileTheme.headingColor,
                    ),
                  );
                },
              ),
              AnimatedBuilder(
                animation: _name,
                builder: (BuildContext context, Widget child) {
                  String text = name.substring(0, _name.value);
                  return Center(
                    child: Text(
                      text,
                      style: TextStyle(
                        letterSpacing: 0.2,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
              AnimatedBuilder(
                animation: _designation,
                builder: (BuildContext context, Widget child) {
                  String text = designation.substring(0, _designation.value);
                  return Center(
                    child: Text(
                      text,
                      style: TextStyle(
                        letterSpacing: 2,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Center(
                child: FadeTransition(
                  opacity: _imgAnimation,
                  child: Container(
                    height: height * 0.55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(22.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              offset: Offset(0.0, 3.0),
                              blurRadius: 15)
                        ]),
                    child: TranslateOnHover(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.network(
                          'https://avatars0.githubusercontent.com/u/44980497?v=4',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
