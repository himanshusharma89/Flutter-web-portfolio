import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../../helpers/colors.dart';
import '../../helpers/responsive_layout.dart';
import '../../helpers/translate_on_hover.dart';
import '../../model/experience/expereince.dart';
import '../../provider/expereince_provider.dart';
import '../../widgets/card.dart';
import '../../widgets/page_title.dart';

class Experience extends StatelessWidget {
  const Experience({Key? key}) : super(key: key);
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
              child: consumerWidget(),
            ),
          ),
        ],
      ),
      smallScreen: Container(
        color: ProfileColors.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Column(
            children: <Widget>[
              const PageTitle(title: 'Expereince'),
              const SizedBox(height: 10.0),
              consumerWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget consumerWidget() {
    return Consumer<ExperienceProvider>(
        builder: (BuildContext context, ExperienceProvider exp, Widget? child) {
      if (exp.experience.isEmpty) {
        return FutureBuilder<List<ExperienceModel>>(
            future: exp.getExperience(),
            builder: (_, AsyncSnapshot<List<ExperienceModel>> snapshot) {
              if (snapshot.hasData) {
                return ResponsiveLayout(
                  largeScreen: _gridView(exp.experience, context),
                  smallScreen: _listView(exp.experience),
                );
              } else {
                return const ResponsiveLayout(
                    largeScreen: CircularProgressIndicator(),
                    smallScreen: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator()));
              }
            });
      }
      return ResponsiveLayout(
        largeScreen: _gridView(exp.experience, context),
        smallScreen: _listView(exp.experience),
      );
    });
  }

  Widget _gridView(List<ExperienceModel> list, BuildContext context) {
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
        itemBuilder: (_, int index) {
          final experience = list[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TranslateOnHover(
              child: listItem(experience),
            ),
          );
        });
  }

  Widget _listView(List<ExperienceModel> list) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: list.length,
      itemBuilder: (_, int index) {
        final experience = list[index];
        return Padding(
          padding: const EdgeInsets.all(6.0),
          child: listItem(experience),
        );
      },
    );
  }

  Widget listItem(ExperienceModel experience) {
    return CardView(
      title: experience.title,
      imgURL: experience.imgURL,
      imgAlignment: Alignment.centerLeft,
      url: experience.url,
      desc: experience.desc,
      org: experience.org,
      trailingIcon: true,
      startAt: experience.startAt,
      endAt: experience.endAt,
    );
  }
}
