import '../model/skills.dart';

import '../model/social_platform_item.dart';

const List<String> navBarItems = <String>[
  'HOME',
  'ABOUT',
  'SKILLS',
  'WORK',
  'PROJECTS',
  'EXTRA'
];

const List<SocialPlatformsItem> socialPlatforms = <SocialPlatformsItem>[
  SocialPlatformsItem(
      icon: 'https://img.icons8.com/windows/64/000000/blog-logo.png',
      title: 'Blogs',
      url: 'https://blog.himanshusharma.tech/'),
  SocialPlatformsItem(
      icon: 'https://img.icons8.com/fluent/50/000000/github.png',
      title: 'GitHub',
      url: 'https://github.com/himanshusharma89'),
  SocialPlatformsItem(
      icon: 'https://img.icons8.com/color/48/000000/linkedin.png',
      title: 'LinkedIn',
      url: 'https://www.linkedin.com/in/himanshusharma89/'),
  SocialPlatformsItem(
      icon: 'https://img.icons8.com/color/48/000000/twitter.png',
      title: 'Twitter',
      url: 'https://twitter.com/_SharmaHimanshu'),
  SocialPlatformsItem(
      icon: 'https://img.icons8.com/ios-filled/50/000000/codepen.png',
      title: 'Codepen',
      url: 'https://codepen.io/himanshusharma89'),
  SocialPlatformsItem(
      icon: 'https://img.icons8.com/color/48/000000/stackoverflow.png',
      title: 'Stackoverflow',
      url: 'https://stackoverflow.com/users/11545939/himanshu-sharma')
];

List<SkillsItem> techSkills = <SkillsItem>[
  SkillsItem('Dart', 'dart.png'),
  SkillsItem('Javascript', 'js.png'),
  SkillsItem('Java', 'java.png'),
  SkillsItem('C', 'c.png'),
  SkillsItem('Flutter', 'flutter.png'),
  SkillsItem('Git', 'git.png'),
  SkillsItem('Firebase', 'firebase.png'),
  SkillsItem('AWS Amplify', 'amplify.png'),
  SkillsItem('Azure', 'azure.png'),
  SkillsItem('Node.js', 'node.png'),
  SkillsItem('GraphQL', 'graphql.png'),
  SkillsItem('MongoDB', 'mongodb.png'),
  SkillsItem('GitHub Action', 'github_action.png'),
  SkillsItem('Markdown', 'markdown.png'),
];

const String aboutMe = '''
Focused Computer Science major (9.91 CGPA) currently attending Chitkara University, with 2 years of mobile development experience with Flutter. 
A hard-working individual who is developing new applications and content for the community. Frequently praised as a hard-working and quick learner by my peers, I can be relied upon to help you achieve your goals.''';

const String skills = '''
The main area of my expertise is Flutter App Development and Firebase (analytics and growth).
I am proficient with programming languages like C/C++ and Java.
For web development, I work with Flutter web and also have experience with HTML, CSS, JS, jquery and Bootstrap.
I work with these tools on daily basis:\nVersion Control System: Git and GitHub.
Automate Work Flow: GitHub Actions.\nIDE: Android Studio.\nCode Editor: VS Code.,
''';

const String hi = 'Hey! I am';
const String name = 'HIMANSHU SHARMA';
const String role = 'MOBILE DEVELOPER';

const String heroImage =
    'https://firebasestorage.googleapis.com/v0/b/flutter-web-portfolio-website.appspot.com/o/Himanshu%20Sharma.jpg?alt=media&token=89e96691-a349-4d5b-9b74-da736fcab72e';
const String aboutMeImage =
    'https://firebasestorage.googleapis.com/v0/b/flutter-web-portfolio-website.appspot.com/o/about.png?alt=media&token=f9588f27-4319-4866-861c-f1b8f48f774e';
const String resumeWebsite = 'https://www.himanshusharma.tech/resume';
