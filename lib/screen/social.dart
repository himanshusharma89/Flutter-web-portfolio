import 'package:flutter/material.dart';
import 'package:my_portfolio/extensions/hoverExtensions.dart';
import 'package:my_portfolio/profile_theme.dart';
import 'package:my_portfolio/utilities/launcher.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final Launcher launcher = Launcher();

class SocialWidget extends StatefulWidget {
  final PageController pageController;

  SocialWidget({this.pageController});
  @override
  _SocialWidgetState createState() => _SocialWidgetState();
}

class _SocialWidgetState extends State<SocialWidget> {
  List socialPlatforms = [];

  @override
  void initState() {
    super.initState();
    socialPlatforms = [
      {
        'URL': 'https://github.com/himanshusharma89',
        'iconURL': 'https://img.icons8.com/fluent/50/000000/github.png'
      },
      {
        'URL': 'https://twitter.com/_SharmaHimanshu',
        'iconURL': 'https://img.icons8.com/color/48/000000/twitter.png'
      },
      {
        'URL': 'https://www.linkedin.com/in/himanshusharma89/',
        'iconURL': 'https://img.icons8.com/color/48/000000/linkedin.png'
      },
      {
        'URL': 'https://stackoverflow.com/users/11545939/himanshu-sharma',
        'iconURL': 'https://img.icons8.com/color/48/000000/stackoverflow.png'
      },
      {
        'URL': 'https://codepen.io/himanshusharma89',
        'iconURL': 'https://img.icons8.com/ios-filled/50/000000/codepen.png'
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.02 + 20,
      alignment: Alignment.bottomCenter,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: socialPlatforms.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(7),
            child: HandCursor(
              child: GestureDetector(
                onTap: () {
                  launcher.launchURL(socialPlatforms[index]['URL']);
                },
                child: Image.network(
                  socialPlatforms[index]['iconURL'],
                  width: 28.0,
                  height: 28.0,
                  color: ProfileTheme.dotOutlineColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
