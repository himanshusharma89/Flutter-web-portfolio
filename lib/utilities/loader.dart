import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_portfolio/dashboard.dart';
import 'package:my_portfolio/utilities/profile_theme.dart';
import 'package:ripple_effect/ripple_effect.dart';

import 'responsiveLayout.dart';

class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {

  final pageKey = RipplePage.createGlobalKey();
  final effectKey = RippleEffect.createGlobalKey();

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    Future.delayed(Duration(milliseconds: 3000)).then((value) => {
      RippleEffect.start(effectKey, () => toNextPage()),
    });
  }

  Future<void> toNextPage() => Navigator.of(context).push(
    FadeRouteBuilder(
      page: Dashboard(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return RipplePage(
      pageKey: pageKey,
      child: Scaffold(
        body: Container(
          width: width,
          height: height,
          color: Colors.white,
          child: Stack(
            children: [
              Center(
                child: SpinKitFadingCube(
                  color: ProfileTheme.backgroundColor,
                  size: ResponsiveLayout.isSmallScreen(context)?47: 60,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: RippleEffect(
                  pageKey: pageKey, 
                  effectKey: effectKey, 
                  color: ProfileTheme.backgroundColor, 
                  child: Container(
                    width: 30,
                    height: 30,
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}