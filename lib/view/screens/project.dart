import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_portfolio/helpers/translateOnHover.dart';
import 'package:my_portfolio/widgets/card.dart';
import 'package:my_portfolio/helpers/responsiveLayout.dart';
import 'package:my_portfolio/widgets/title.dart';
import 'package:my_portfolio/model/project/project.dart';
import 'package:my_portfolio/provider/project_provider.dart';
import 'package:provider/provider.dart';

import '../../helpers/constants.dart';

class Project extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    if (ResponsiveLayout.isLargeScreen(context) ||
        ResponsiveLayout.isMediumScreen(context)) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Center(child: PageTitle(title: "PROJECTS")),
            SizedBox(height: height * 0.01),
            Flexible(
              fit: FlexFit.loose,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: consumerWidget()
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        color: ProfileColors.backgroundColor,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              PageTitle(title: 'Projects'),
              SizedBox(height: 10.0),
              consumerWidget()
            ],
          ),
        ),
      );
    }
  }

  Widget consumerWidget() {
    return Consumer<ProjectProvider>(builder: (context, prjt, child) {
      if (prjt.project.length == 0)
        return FutureBuilder(
            future: prjt.getProjects(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (ResponsiveLayout.isLargeScreen(context) ||
                    ResponsiveLayout.isMediumScreen(context))
                  return _gridView(prjt.project, context);
                else
                  return _listView(prjt.project, context);
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
      else if (ResponsiveLayout.isLargeScreen(context) ||
          ResponsiveLayout.isMediumScreen(context))
        return _gridView(prjt.project, context);
      else
        return _listView(prjt.project, context);
    });
  }

  Widget _gridView(List list, BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      // physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: ResponsiveLayout.isMediumScreen(context) ? 2 : 3,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          childAspectRatio: 1 / 0.2),
      itemCount: list.length,
      itemBuilder: (context, index) {
        ProjectModel projects = list[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TranslateOnHover(
            child: CardView(
              title: projects.title,
              imgURL: projects.imgURL,
              imgAlignment: Alignment.centerLeft,
              url: projects.URL,
              desc: projects.desc,
              trailingIcon: false,
            ),
          ),
        );
      },
    );
  }

  Widget _listView(List list, BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height - 140,
      child: ListView.builder(
        shrinkWrap: true,
        primary: false,
        scrollDirection: Axis.vertical,
        itemCount: list.length,
        itemBuilder: (context, index) {
          ProjectModel projects = list[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CardView(
              title: projects.title,
              imgURL: projects.imgURL,
              imgAlignment: Alignment.centerLeft,
              url: projects.URL,
              desc: projects.desc,
              trailingIcon: false,
            ),
          );
        },
      ),
    );
  }
}
