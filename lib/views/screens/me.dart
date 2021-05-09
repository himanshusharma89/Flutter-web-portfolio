import 'package:flutter/material.dart';

import '../../helpers/colors.dart';
import '../../helpers/constants.dart';
import '../../helpers/responsive_layout.dart';
import '../../helpers/translate_on_hover.dart';
import '../../widgets/text.dart';

class Me extends StatefulWidget {
  const Me({Key? key}) : super(key: key);
  @override
  _MeState createState() => _MeState();
}

class _MeState extends State<Me> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _hi;
  late Animation<int> _name;
  late Animation<int> _role;
  late Animation<double> _imgAnimation;

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
    _role = StepTween(begin: 0, end: role.length).animate(
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
    final height = MediaQuery.of(context).size.height;
    return ResponsiveLayout(
        largeScreen: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //TODO: Add Responsive
            const MeTextWidget(
              text: name,
              textAlign: TextAlign.right,
            ),
            Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: centerImageDecoration(),
                ),
              ),
            ),
            //TODO: Add Responsive
            const MeTextWidget(
              text: role,
              textAlign: TextAlign.left,
            )
          ],
        ),
        smallScreen: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 65),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedBuilder(
                animation: _hi,
                builder: (BuildContext context, Widget? child) {
                  final text = hi.substring(0, int.parse(_hi.value.toString()));
                  return Text(
                    text,
                    style: const TextStyle(
                        letterSpacing: 0.2,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: ProfileColors.headingColor,
                        height: 1.5),
                  );
                },
              ),
              AnimatedBuilder(
                animation: _name,
                builder: (BuildContext context, Widget? child) {
                  final text =
                      name.substring(0, int.parse(_name.value.toString()));
                  return Center(
                    child: Text(
                      text,
                      style: const TextStyle(
                          letterSpacing: 0.2,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.5),
                    ),
                  );
                },
              ),
              AnimatedBuilder(
                animation: _role,
                builder: (BuildContext context, Widget? child) {
                  final text = role.substring(
                      0, int.parse(_role.value.toString()));
                  return Center(
                    child: Text(
                      text,
                      style: const TextStyle(
                          letterSpacing: 2,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          height: 1.5),
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
                  child: TranslateOnHover(
                    child: Container(
                      height: height * 0.55,
                      decoration: centerImageDecoration(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  BoxDecoration centerImageDecoration() {
    return BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 20,
          color: ProfileColors.navbarItemColor,
        ),
        boxShadow: const <BoxShadow>[
          BoxShadow(offset: Offset(0.0, 3.0), blurRadius: 15)
        ],
        image: const DecorationImage(
            fit: BoxFit.contain,
            image: NetworkImage(
                'https://avatars.githubusercontent.com/u/44980497?v=4')));
  }
}
