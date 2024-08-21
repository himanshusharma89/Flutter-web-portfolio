import 'package:flutter/material.dart';

import 'package:my_portfolio/helpers/colors.dart';
import 'package:my_portfolio/helpers/constants.dart';
import 'package:my_portfolio/helpers/functions.dart';
import 'package:my_portfolio/helpers/responsive_layout.dart';
import 'package:my_portfolio/helpers/translate_on_hover.dart';
import 'package:my_portfolio/main.dart';
import 'package:my_portfolio/widgets/button.dart';
import 'package:my_portfolio/widgets/contact_me_dialog.dart';
import 'package:my_portfolio/widgets/page_title.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        largeScreen: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            FractionallySizedBox(
              widthFactor: 0.5,
              heightFactor: 0.45,
              alignment: Alignment.centerLeft,
              child: TranslateOnHover(
                child: FadeInImage.memoryNetwork(
                    placeholderCacheHeight: 80,
                    placeholder: unit8ListPlaceholder,
                    image: aboutMeImage,),
              ),
            ),
            FractionallySizedBox(
              widthFactor: 0.5,
              alignment: Alignment.centerRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text(context),
                  const SizedBox(
                    height: 20,
                  ),
                  buttons(context),
                ],
              ),
            ),
            const PageTitle(title: 'ABOUT ME'),
          ],
        ),
        smallScreen: ColoredBox(
          color: ProfileColors.backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const PageTitle(title: 'About Me'),
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 50.0, right: 50.0),
                child: text(context),
              ),
              const SizedBox(
                height: 20,
              ),
              buttons(context),
            ],
          ),
        ),);
  }

  Widget text(BuildContext context) {
    return Text(
      aboutMe,
      textAlign: TextAlign.justify,
      style: TextStyle(fontSize: fontSize(context, 16), color: Colors.white),
    );
  }

  Widget buttons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ProfileButton(
          text: 'CONTACT ME',
          onTap: () {
            showDialog(
                context: context, builder: (_) => const ContactMeDialog(),);
          },
        ),
        const SizedBox(
          width: 10,
        ),
        ProfileButton(
          text: 'MY RESUME',
          onTap: () => launcher.launchURL(resumeWebsite),
        ),
      ],
    );
  }
}
