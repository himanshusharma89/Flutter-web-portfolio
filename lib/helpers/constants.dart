import '../main.dart';

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

const String aboutMe = '''
Focused Computer Science major (9.89 CGPA) currently attending Chitkara University. 
I am a Flutter Application Developer, an Open Source contributor and a writer. I like to contribute to the community a lot. 
I am a writer at Flutter Community and IEEE CIET Branch. I also like to work on Alexa Skill and Google Assistant App development sometimes.
\nI am a hard-working individual who is developing new applications and content for the community and trying to stay occupied all the time. 
Also, I am a Microsoft Learn Student Ambassador and learning new skills. I am a quick learner and frequently praised as hard-working by my peers.''';

const String skills = '''
The main area of my expertise is Flutter App Development and Firebase (analytics and growth).
I am proficient with programming languages like C/C++ and Java.
For web development, I work with Flutter web and also have experience with HTML, CSS, JS, jquery and Bootstrap.
I work with these tools on daily basis:\nVersion Control System: Git and GitHub.
Automate Work Flow: GitHub Actions.\nIDE: Android Studio.\nCode Editor: VS Code.,
''';

const String hi = 'Hey! I am';
const String name = 'HIMANSHU SHARMA';
const String role = 'FLUTTER DEVELOPER';
