import 'package:flutter/material.dart';
import 'package:my_portfolio/helpers/colors.dart';
import 'package:my_portfolio/helpers/constants.dart';
import 'package:my_portfolio/helpers/functions.dart';
import 'package:my_portfolio/helpers/responsive_layout.dart';
import 'package:my_portfolio/main.dart';
import 'package:my_portfolio/widgets/page_title.dart';
import 'package:responsive_grid/responsive_grid.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          const PageTitle(title: 'MY SKILLS'),
          FractionallySizedBox(
            widthFactor: 0.4,
            alignment: Alignment.centerRight,
            child: skillStatsWidget(
              context,
            ),
          ),
          FractionallySizedBox(
            widthFactor: 0.55,
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 2,
                ),
                text(context, 'Programming Langugaes'),
                Flexible(child: skillWidget(context, end: 6)),
                text(context, 'Tools and Technology'),
                Flexible(
                  flex: 2,
                  child: skillWidget(
                    context,
                    start: 6,
                    end: techSkills.length,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
      smallScreen: ColoredBox(
        color: ProfileColors.backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Center(child: PageTitle(title: 'Skills')),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text(context, 'Programming Langugaes'),
                  Flexible(child: skillWidget(context, end: 6)),
                  const SizedBox(
                    height: 10,
                  ),
                  text(context, 'Tools and Technology'),
                  Flexible(
                    // flex: 2,
                    child: skillWidget(
                      context,
                      start: 6,
                      end: techSkills.length,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            skillStatsWidget(context),
          ],
        ),
      ),
    );
  }

  Widget text(BuildContext context, String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontSize(context, 16),
        color: Colors.white,
        height: 1.2,
        letterSpacing: 0.2,
      ),
    );
  }

  Widget skillStatsWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        statsTile(
          context,
          link: 'https://wakatime.com/@HimanshuSharma',
          imageURL: 'assets/wakatime_icon.png',
        ),
        const SizedBox(
          width: 30,
        ),
        statsTile(
          context,
          link: 'https://github.com/himanshusharma89',
          imageURL: 'assets/github_icon.png',
        ),
      ],
    );
  }

  Widget statsTile(
    BuildContext context, {
    required String link,
    required String imageURL,
  }) {
    return InkWell(
      onTap: () {
        launcher.launchURL(link);
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: ProfileColors.cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            imageURL,
            height: ResponsiveLayout.isSmallScreen(context) ? 60 : 80,
            width: ResponsiveLayout.isSmallScreen(context) ? 60 : 80,
          ),
        ),
      ),
    );
  }
}

Widget skillWidget(BuildContext context, {required int end, int? start = 0}) {
  return ResponsiveGridList(
    minSpacing: 8,
    desiredItemWidth: ResponsiveLayout.isSmallScreen(context) ? 45 : 75,
    squareCells: true,
    scroll: false,
    children: [
      for (int i = start!; i < end; i++)
        tile(
          context,
          imageURL: techSkills[i].imgURL,
          title: techSkills[i].name,
        ),
    ],
  );
}

Widget tile(
  BuildContext context, {
  required String imageURL,
  required String title,
}) {
  return Tooltip(
    message: title,
    child: DecoratedBox(
      decoration: BoxDecoration(
        color: ProfileColors.cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FadeInImage.memoryNetwork(
          image: imageURL,
          placeholder: unit8ListPlaceholder,
        ),
      ),
    ),
  );
}
