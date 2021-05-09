import 'package:my_portfolio/main.dart';

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

  String? title;
  String? icon;
  void Function()? onTap;
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
