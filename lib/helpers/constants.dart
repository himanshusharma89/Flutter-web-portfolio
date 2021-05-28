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
  SkillsItem('Dart',
      'https://firebasestorage.googleapis.com/v0/b/flutter-web-portfolio-website.appspot.com/o/tech%2Fdart.png?alt=media&token=a6957dd4-87a6-49be-9514-9208d2fa1df5'),
  SkillsItem('Javascript',
      'https://firebasestorage.googleapis.com/v0/b/flutter-web-portfolio-website.appspot.com/o/tech%2Fjs.png?alt=media&token=ac2ceead-86ed-45fd-b7e9-b0156677fa36'),
  SkillsItem('Java',
      'https://firebasestorage.googleapis.com/v0/b/flutter-web-portfolio-website.appspot.com/o/tech%2Fjava.png?alt=media&token=27318b73-2880-4d19-b1c8-8263b24ea71c'),
  SkillsItem('C',
      'https://firebasestorage.googleapis.com/v0/b/flutter-web-portfolio-website.appspot.com/o/tech%2Fc.png?alt=media&token=6c31016a-cbda-449d-8ad1-2f07fc9df6d5'),
  SkillsItem('Flutter',
      'https://firebasestorage.googleapis.com/v0/b/flutter-web-portfolio-website.appspot.com/o/tech%2Fflutter.png?alt=media&token=917d6379-e391-47d1-9fdf-d8a6176942a7'),
  SkillsItem('Git',
      'https://firebasestorage.googleapis.com/v0/b/flutter-web-portfolio-website.appspot.com/o/tech%2Fgit.png?alt=media&token=ef15e173-5c48-4282-a91b-5a6132c73279'),
  SkillsItem('Firebase',
      'https://firebasestorage.googleapis.com/v0/b/flutter-web-portfolio-website.appspot.com/o/tech%2Ffirebase.png?alt=media&token=40a9d525-e256-4293-ad0e-60026d347d6d'),
  SkillsItem('AWS Amplify',
      'https://firebasestorage.googleapis.com/v0/b/flutter-web-portfolio-website.appspot.com/o/tech%2Famplify.png?alt=media&token=292cd8ef-f901-4701-b413-280690f5a8f8'),
  SkillsItem('Azure',
      'https://firebasestorage.googleapis.com/v0/b/flutter-web-portfolio-website.appspot.com/o/tech%2Fazure.png?alt=media&token=cb2106da-1694-4706-9be7-66f1f292bca1'),
  SkillsItem('Node.js',
      'https://firebasestorage.googleapis.com/v0/b/flutter-web-portfolio-website.appspot.com/o/tech%2Fnode.png?alt=media&token=3d4e673b-33fc-426c-aa69-97ea3003fca2'),
  SkillsItem('GraphQL',
      'https://firebasestorage.googleapis.com/v0/b/flutter-web-portfolio-website.appspot.com/o/tech%2Fgraphql.png?alt=media&token=a7ddacab-eb3f-4648-826f-660132b7b660'),
  SkillsItem('MongoDB',
      'https://firebasestorage.googleapis.com/v0/b/flutter-web-portfolio-website.appspot.com/o/tech%2Fmongodb.png?alt=media&token=f37ab4ef-87b7-4436-aae0-729d2bbb34d0'),
  SkillsItem('GitHub Action',
      'https://firebasestorage.googleapis.com/v0/b/flutter-web-portfolio-website.appspot.com/o/tech%2Fgithub_action.png?alt=media&token=28edc651-0532-4d86-bda9-18abeb7347b5'),
  SkillsItem('Markdown',
      'https://firebasestorage.googleapis.com/v0/b/flutter-web-portfolio-website.appspot.com/o/tech%2Fmarkdown.png?alt=media&token=171fb144-1996-4d55-a955-5c2162a67567'),
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
