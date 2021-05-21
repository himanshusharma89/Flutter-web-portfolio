import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../../helpers/colors.dart';
import '../../helpers/responsive_layout.dart';
import '../../model/card/card.dart';
import '../../provider/project_provider.dart';
import '../../widgets/lists_view.dart';
import '../../widgets/page_title.dart';

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
                  child: consumerWidget(context)),
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
                Expanded(
                    child:
                        SingleChildScrollView(child: consumerWidget(context))),
                const SizedBox(height: 30.0),
              ],
            ),
          ),
        ));
  }

  Widget consumerWidget(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Consumer<ProjectProvider>(
        builder: (BuildContext context, ProjectProvider prjt, Widget? child) {
      if (prjt.project.isEmpty) {
        return FutureBuilder<List<CardModel>>(
            future: prjt.getProjects(),
            builder: (_, AsyncSnapshot<List<CardModel>> snapshot) {
              if (snapshot.hasData) {
                return ResponsiveLayout(
                  largeScreen: gridView(prjt.project, width * 0.25),
                  smallScreen: listView(prjt.project),
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
        largeScreen: gridView(prjt.project, width * 0.25),
        smallScreen: listView(prjt.project),
      );
    });
  }
}
