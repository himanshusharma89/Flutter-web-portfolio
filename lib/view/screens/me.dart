import 'package:flutter/material.dart';
import 'package:my_portfolio/helpers/translate_on_hover.dart';
import 'package:my_portfolio/helpers/constants.dart';
import 'package:my_portfolio/helpers/responsive_layout.dart';
import 'package:my_portfolio/widgets/text.dart';

import '../../helpers/responsive_layout.dart';

class Me extends StatefulWidget {
  @override
  _MeState createState() => _MeState();
}

class _MeState extends State<Me> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<int> _hi;
  Animation<int> _name;
  Animation<int> _designation;
  Animation<double> _imgAnimation;
  String hi = 'Hey! I am';
  String name = 'HIMANSHU SHARMA';
  String designation = 'Flutter Developer';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 5500));
    _hi = StepTween(begin: 0, end: hi.length).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.25, curve: Curves.easeIn)));
    _name = StepTween(begin: 0, end: name.length).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.7, curve: Curves.easeIn)));
    _designation = StepTween(begin: 0, end: designation.length).animate(
        CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.65, 1, curve: Curves.easeIn)));
    _imgAnimation = CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.6, curve: Curves.easeIn));
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
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    if (ResponsiveLayout.isLargeScreen(context) ||
        ResponsiveLayout.isMediumScreen(context)) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MeTextWidget(
            text: name,
            textAlign: TextAlign.right,
          ),
          Flexible(
            flex: ResponsiveLayout.isMediumScreen(context) ? 6 : 4,
            fit: FlexFit.tight,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: width - 10,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 23,
                      color: ProfileColors.navbarItemColor,
                    )
                    // boxShadow: [
                    //   BoxShadow(
                    //     offset: Offset(0,3),
                    //     color: ProfileColors.navbarItemColor,
                    //     blurRadius: 10
                    //   ),
                    //   BoxShadow(
                    //     offset: Offset(3,0),
                    //     color: ProfileColors.navbarItemColor,
                    //     blurRadius: 10
                    //   )
                    // ]
                    ),
              ),
            ),
          ),
          MeTextWidget(
            text: designation,
            textAlign: TextAlign.left,
          )
        ],
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 65),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedBuilder(
              animation: _hi,
              builder: (BuildContext context, Widget child) {
                final String text =
                    hi.substring(0, int.parse(_hi.value.toString()));
                return Text(
                  text,
                  style: const TextStyle(
                    letterSpacing: 0.2,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ProfileColors.headingColor,
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _name,
              builder: (BuildContext context, Widget child) {
                final String text =
                    name.substring(0, int.parse(_name.value.toString()));
                return Center(
                  child: Text(
                    text,
                    style: const TextStyle(
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
                final String text = designation.substring(
                    0, int.parse(_designation.value.toString()));
                return Center(
                  child: Text(
                    text,
                    style: const TextStyle(
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
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(22.0)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(offset: Offset(0.0, 3.0), blurRadius: 15)
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
      );
    }
  }
}
