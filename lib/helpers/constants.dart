import '../main.dart';
import '../model/social_platform_item.dart';

const List<String> navBarItems = <String>[
  'HOME',
  'ABOUT',
  'SKILLS',
  'WORK',
  'PROJECTS'
];

List<SocialPlatformsItem> socialPlatforms = <SocialPlatformsItem>[
  SocialPlatformsItem(
      icon: 'https://img.icons8.com/fluent/50/000000/github.png',
      title: 'GitHub',
      onTap: () {
        launcher.launchURL('https://github.com/himanshusharma89');
      }),
  SocialPlatformsItem(
      icon: 'https://img.icons8.com/color/48/000000/linkedin.png',
      title: 'LinkedIn',
      onTap: () {
        launcher.launchURL('https://www.linkedin.com/in/himanshusharma89/');
      }),
  SocialPlatformsItem(
      icon: 'https://img.icons8.com/color/48/000000/twitter.png',
      title: 'Twitter',
      onTap: () {
        launcher.launchURL('https://twitter.com/_SharmaHimanshu');
      }),
  SocialPlatformsItem(
      icon: 'https://img.icons8.com/ios-filled/50/000000/codepen.png',
      title: 'Codepen',
      onTap: () {
        launcher.launchURL('https://codepen.io/himanshusharma89');
      }),
  SocialPlatformsItem(
      icon: 'https://img.icons8.com/color/48/000000/stackoverflow.png',
      title: 'Stackoverflow',
      onTap: () {
        launcher.launchURL(
            'https://stackoverflow.com/users/11545939/himanshu-sharma');
      }),
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

const String heroImage =
    'https://firebasestorage.googleapis.com/v0/b/flutter-web-portfolio-website.appspot.com/o/Himanshu%20Sharma.jpg?alt=media&token=89e96691-a349-4d5b-9b74-da736fcab72e';
const String aboutMeImage =
    'https://firebasestorage.googleapis.com/v0/b/flutter-web-portfolio-website.appspot.com/o/about.png?alt=media&token=f9588f27-4319-4866-861c-f1b8f48f774e';
