import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_portfolio/helpers/translateOnHover.dart';
import 'package:my_portfolio/helpers/constants.dart';
import 'package:my_portfolio/widgets/card.dart';
import 'package:my_portfolio/helpers/responsiveLayout.dart';
import 'package:my_portfolio/widgets/title.dart';
import 'package:my_portfolio/provider/expereince_provider.dart';
import 'package:provider/provider.dart';
import 'package:my_portfolio/model/experience/expereince.dart';

class Experience extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    if (ResponsiveLayout.isLargeScreen(context) ||
        ResponsiveLayout.isMediumScreen(context)) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Center(child: PageTitle(title: "WORK EXPERIENCE")),
            SizedBox(height: height * 0.01),
            Flexible(
              fit: FlexFit.loose,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: consumerWidget(),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        color: ProfileColors.backgroundColor,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Column(
            children: <Widget>[
              PageTitle(title: 'Expereince'),
              SizedBox(height: 10.0),
              consumerWidget()
            ],
          ),
        ),
      );
    }
  }

  Widget consumerWidget() {
    return Consumer<ExperienceProvider>(builder: (context, exp, child) {
      if (exp.experience.length == 0) {
        return FutureBuilder(
            future: exp.getExperience(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (ResponsiveLayout.isLargeScreen(context) ||
                    ResponsiveLayout.isMediumScreen(context))
                  return _gridView(exp.experience, context);
                else
                  return _listView(exp.experience);
              } else {
                return Center(
                    child: ResponsiveLayout.isLargeScreen(context) ||
                            ResponsiveLayout.isMediumScreen(context)
                        ? CircularProgressIndicator()
                        : Container(
                            height: 50,
                            width: 50,
                            child: CircularProgressIndicator()));
              }
            });
      } else {
        if (ResponsiveLayout.isLargeScreen(context) ||
            ResponsiveLayout.isMediumScreen(context))
          return _gridView(exp.experience, context);
        else
          return _listView(exp.experience);
      }
    });
  }

  Widget _gridView(List list, BuildContext context) {
    return GridView.builder(
      primary: false,
        // physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 4,
            childAspectRatio:
                ResponsiveLayout.isMediumScreen(context) ? 1 / 0.22 : 1 / 0.18),
        itemCount: list.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          ExperienceModel experience = list[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TranslateOnHover(
              child: CardView(
                title: experience.title,
                imgURL: experience.imgURL,
                imgAlignment: Alignment.centerLeft,
                url: experience.URL,
                date: experience.date,
                desc: experience.desc,
                org: experience.org,
                trailingIcon: true,
                trailingIconData: Icons.launch_rounded,
              ),
            ),
          );
        });
  }

  Widget _listView(List list) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      scrollDirection: Axis.vertical,
      itemCount: list.length,
      itemBuilder: (context, index) {
        ExperienceModel experience = list[index];
        return Padding(
          padding: const EdgeInsets.all(6.0),
          child: CardView(
            title: experience.title,
            imgURL: experience.imgURL,
            imgAlignment: Alignment.centerLeft,
            url: experience.URL,
            date: experience.date,
            desc: experience.desc,
            org: experience.org,
            trailingIcon: true,
            trailingIconData: Icons.launch_rounded,
          ),
        );
      },
    );
  }
}
