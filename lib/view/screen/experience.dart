import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_portfolio/helpers/translateOnHover.dart';
import 'package:my_portfolio/profile_theme.dart';
import 'package:my_portfolio/helpers/card.dart';
import 'package:my_portfolio/helpers/responsiveLayout.dart';
import 'package:my_portfolio/helpers/title.dart';
import 'package:my_portfolio/provider/expereince_provider.dart';
import 'package:provider/provider.dart';
import 'package:my_portfolio/model/experience/expereince.dart';

class Experience extends StatefulWidget {
  @override
  _ExperienceState createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {

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
            SizedBox(height: 50),
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
        color: ProfileTheme.backgroundColor,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 10),
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
                  return _gridView(exp.experience);
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
          return _gridView(exp.experience);
        else
          return _listView(exp.experience);
      }
    });
  }

  Widget _gridView(List list) {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 4,
            childAspectRatio:
                ResponsiveLayout.isMediumScreen(context) ? 1 / 0.22 : 1 / 0.15),
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
