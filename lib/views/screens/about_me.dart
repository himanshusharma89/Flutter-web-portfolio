import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../helpers/colors.dart';
import '../../helpers/constants.dart';
import '../../helpers/functions.dart';
import '../../helpers/responsive_layout.dart';
import '../../helpers/translate_on_hover.dart';
import '../../widgets/button.dart';
import '../../widgets/title.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        largeScreen: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            FractionallySizedBox(
              widthFactor: 0.5,
              alignment: Alignment.centerLeft,
              child: TranslateOnHover(
                  child: Image.network(
                // TODO: Update link
                'https://media-exp1.licdn.com/dms/image/C4E03AQEPWg_0mWYwaw/profile-displayphoto-shrink_400_400/0/1607276904548?e=1618444800&v=beta&t=_bm1lzC7rU7_G8_a2z5jDndXpuX-EazPDPaJakp2t28',
              )),
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
                  buttons()
                ],
              ),
            ),
            const PageTitle(title: 'ABOUT ME'),
          ],
        ),
        smallScreen: Container(
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
              buttons()
            ],
          ),
        ));
  }

  Widget text(BuildContext context) {
    return Text(
      aboutMe,
      textAlign: TextAlign.justify,
      style: TextStyle(fontSize: fontSize(context, 16), color: Colors.white),
    );
  }

  Widget buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        ProfileButton(
          text: 'CONTACT ME',
          link: 'mailto:contact@himanshusharma.tech',
        ),
        SizedBox(
          width: 10,
        ),
        ProfileButton(
          text: 'MY RESUME',
          link: 'mailto:contact@himanshusharma.tech',
        )
      ],
    );
  }
}
