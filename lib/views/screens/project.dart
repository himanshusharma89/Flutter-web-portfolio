import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../../helpers/colors.dart';
import '../../helpers/responsive_layout.dart';
import '../../helpers/translate_on_hover.dart';
import '../../model/project/project.dart';
import '../../provider/project_provider.dart';
import '../../widgets/card.dart';
import '../../widgets/title.dart';

class Project extends StatelessWidget {
  const Project({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return ResponsiveLayout(
        largeScreen: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Center(child: PageTitle(title: 'PROJECTS')),
            SizedBox(height: height * 0.01),
            Flexible(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: consumerWidget()),
            ),
          ],
        ),
        smallScreen: Container(
          color: ProfileColors.backgroundColor,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const PageTitle(title: 'Projects'),
                const SizedBox(height: 10.0),
                consumerWidget()
              ],
            ),
          ),
        ));
  }

  Widget consumerWidget() {
    return Consumer<ProjectProvider>(
        builder: (BuildContext context, ProjectProvider prjt, Widget? child) {
      if (prjt.project.isEmpty) {
        return FutureBuilder<List<ProjectModel>>(
            future: prjt.getProjects(),
            builder: (_, AsyncSnapshot<List<ProjectModel>> snapshot) {
              if (snapshot.hasData) {
                return ResponsiveLayout(
                  largeScreen: _gridView(prjt.project, context),
                  smallScreen: _listView(prjt.project, context),
                );
              } else {
                return const ResponsiveLayout(
                  largeScreen: CircularProgressIndicator(),
                  smallScreen: SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator()),
                );
              }
            });
      }
      return ResponsiveLayout(
        largeScreen: _gridView(prjt.project, context),
        smallScreen: _listView(prjt.project, context),
      );
    });
  }

  Widget _gridView(List<ProjectModel> list, BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      // physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: ResponsiveLayout.isMediumScreen(context) ? 2 : 3,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          childAspectRatio: 1 / 0.2),
      itemCount: list.length,
      itemBuilder: (_, int index) {
        final projects = list[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TranslateOnHover(
            child: listItem(projects),
          ),
        );
      },
    );
  }

  Widget _listView(List<ProjectModel> list, BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height - 140,
      child: ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: list.length,
        itemBuilder: (_, int index) {
          final projects = list[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: listItem(projects),
          );
        },
      ),
    );
  }

  Widget listItem(ProjectModel projects) {
    return CardView(
      title: projects.title,
      imgURL: projects.imgURL,
      imgAlignment: Alignment.centerLeft,
      url: projects.url,
      desc: projects.desc,
      trailingIcon: false,
      startAt: projects.startAt,
      endAt: projects.endAt,
      projectLink: projects.projectLink,
    );
  }
}
