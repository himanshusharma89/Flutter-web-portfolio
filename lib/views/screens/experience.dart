import 'package:flutter/material.dart';
import 'package:my_portfolio/helpers/colors.dart';
import 'package:my_portfolio/helpers/responsive_layout.dart';
import 'package:my_portfolio/model/card/card.dart';
import 'package:my_portfolio/provider/expereince_provider.dart';
import 'package:my_portfolio/widgets/lists_view.dart';
import 'package:my_portfolio/widgets/page_title.dart';
import 'package:provider/provider.dart';

class Experience extends StatelessWidget {
  const Experience({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return ResponsiveLayout(
      largeScreen: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Center(child: PageTitle(title: 'WORK EXPERIENCE')),
          SizedBox(height: height * 0.01),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: consumerWidget(context),
            ),
          ),
        ],
      ),
      smallScreen: ColoredBox(
        color: ProfileColors.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Column(
            children: <Widget>[
              const PageTitle(title: 'Experience'),
              const SizedBox(height: 10.0),
              consumerWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget consumerWidget(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Consumer<ExperienceProvider>(
        builder: (BuildContext context, ExperienceProvider exp, Widget? child) {
      if (exp.experience.isEmpty) {
        return FutureBuilder<List<CardModel>>(
            future: exp.getExperience(),
            builder: (_, AsyncSnapshot<List<CardModel>> snapshot) {
              if (snapshot.hasData) {
                return ResponsiveLayout(
                  largeScreen: gridView(exp.experience, width * 0.32),
                  smallScreen: listView(exp.experience),
                );
              } else {
                return const ResponsiveLayout(
                    largeScreen: CircularProgressIndicator(),
                    smallScreen: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(),),);
              }
            },);
      }
      return ResponsiveLayout(
        largeScreen: gridView(exp.experience, width * 0.32),
        smallScreen: listView(exp.experience),
      );
    },);
  }
}
