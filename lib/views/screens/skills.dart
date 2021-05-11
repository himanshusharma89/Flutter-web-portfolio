import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../helpers/colors.dart';
import '../../helpers/constants.dart';
import '../../helpers/functions.dart';
import '../../helpers/responsive_layout.dart';
import '../../main.dart';
import '../../widgets/page_title.dart';

class Skills extends StatelessWidget {
  const Skills({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        largeScreen: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            const PageTitle(title: 'MY SKILLS'),
            FractionallySizedBox(
                widthFactor: 0.5,
                alignment: Alignment.centerRight,
                child: skillWidget(context)),
            FractionallySizedBox(
              widthFactor: 0.5,
              alignment: Alignment.centerLeft,
              child: Center(child: text(context)),
            ),
          ],
        ),
        smallScreen: Container(
          color: ProfileColors.backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Center(child: PageTitle(title: 'Skills')),
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 50.0, right: 50.0),
                child: text(context),
              ),
              const SizedBox(
                height: 20,
              ),
              skillWidget(context)
            ],
          ),
        ));
  }

  Widget text(BuildContext context) {
    return Text(
      skills,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: fontSize(context, 16),
          color: Colors.white,
          height: 1.2,
          letterSpacing: 0.2),
    );
  }

  Widget skillWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        tile(context,
            link: 'https://wakatime.com/@HimanshuSharma',
            imageURL: 'assets/wakatime_icon.png'),
        const SizedBox(
          width: 30,
        ),
        tile(context,
            link: 'https://github.com/himanshusharma89',
            imageURL: 'assets/github_icon.png')
      ],
    );
  }

  Widget tile(BuildContext context,
      {required String link, required String imageURL}) {
    return InkWell(
      onTap: () {
        launcher.launchURL(link);
      },
      child: Container(
        decoration: BoxDecoration(
            color: ProfileColors.cardColor,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            imageURL,
            height: ResponsiveLayout.isSmallScreen(context) ? 60 : 90,
            width: ResponsiveLayout.isSmallScreen(context) ? 60 : 90,
          ),
        ),
      ),
    );
  }
}
