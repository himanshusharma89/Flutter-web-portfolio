import 'package:flutter/material.dart';
import 'package:my_portfolio/helpers/launcher.dart';
import 'package:my_portfolio/helpers/responsive_layout.dart';

final Launcher launcher = Launcher();

class ProfileColors {
  ProfileColors._();
  static const Color backgroundColor = Color(0xff1B1C1E);
  static const Color navBarColor = Color.fromRGBO(42, 46, 53, 1);
  static const Color cardColor = Color(0xff2a2e35);
  static const Color cardTextColor = Color.fromRGBO(178, 190, 205, 1);
  static const Color headingColor = Color(0xffe9c14a);
  static const Color navbarItemColor = Color(0xff50f5aa);
  static const Color cardHeadingColor = Color(0xffe9c14a);
  static const Color circleShadow = Color(0xff86fac5);
  static const Color drawerColor = cardColor;
  static const Color dotOutlineColor = Color(0xff9d39f5);
  static const Color pageIndicatorColor = Color(0xff50f5aa);

  // static const Color color1 = Color(0xff4e2ec2);
  // static const Color color2 = Color(0xff51a5cf);
  // static const Color color5 = Color(0xff18313e);
  // static const Color color6 = Color(0xff47b6e7);
  // static const Color color8 = Color(0xffd31952);
  // static const Color color9 = Color(0xff17323f);
  // static const Color color10 = Color(0xff18313e);
  // static const Color color11 = Color(0xffe9c14a);
  // static const Color color12 = Color(0xff24f6ff);
}

double fontSize(BuildContext context, double size) =>
    ResponsiveLayout.isLargeScreen(context)
        ? size
        : ResponsiveLayout.isMediumScreen(context)
            ? size - 2
            : size - 4;

double navBarWidth(BuildContext context) =>
    ResponsiveLayout.isLargeScreen(context) ? 20 : 25;

List<Map<String, String>> navBarItems = <Map<String, String>>[
  {
    'title': 'HOME',
  },
  {
    'title': 'ABOUT',
  },
  {
    'title': 'SKILLS',
  },
  {
    'title': 'WORK',
  },
  {
    'title': 'PROJECTS',
  },
  {
    'title': 'ARTICLES',
  }
];

List<MenuItem> options = <MenuItem>[
  MenuItem(
      icon: 'https://img.icons8.com/fluent/50/000000/github.png',
      title: 'GitHub',
      onTap: () {
        launcher.launchURL('https://github.com/himanshusharma89');
      }),
  MenuItem(
      icon: 'https://img.icons8.com/color/48/000000/linkedin.png',
      title: 'LinkedIn',
      onTap: () {
        launcher.launchURL('https://www.linkedin.com/in/himanshusharma89/');
      }),
  MenuItem(
      icon: 'https://img.icons8.com/color/48/000000/twitter.png',
      title: 'Twitter',
      onTap: () {
        launcher.launchURL('https://twitter.com/_SharmaHimanshu');
      }),
  MenuItem(
      icon: 'https://img.icons8.com/ios-filled/50/000000/codepen.png',
      title: 'Codepen',
      onTap: () {
        launcher.launchURL('https://codepen.io/himanshusharma89');
      }),
  MenuItem(
      icon: 'https://img.icons8.com/color/48/000000/stackoverflow.png',
      title: 'Stackoverflow',
      onTap: () {
        launcher.launchURL(
            'https://stackoverflow.com/users/11545939/himanshu-sharma');
      }),
];

class MenuItem {
  MenuItem({this.icon, this.title, this.onTap});

  String title;
  String icon;
  void Function() onTap;
}

List<Map<String, String>> socialPlatforms = <Map<String, String>>[
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
