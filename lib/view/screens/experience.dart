import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_portfolio/helpers/translate_on_hover.dart';
import 'package:my_portfolio/helpers/constants.dart';
import 'package:my_portfolio/widgets/card.dart';
import 'package:my_portfolio/helpers/responsive_layout.dart';
import 'package:my_portfolio/widgets/title.dart';
import 'package:my_portfolio/provider/expereince_provider.dart';
import 'package:provider/provider.dart';
import 'package:my_portfolio/model/experience/expereince.dart';

class Experience extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    if (ResponsiveLayout.isLargeScreen(context) ||
        ResponsiveLayout.isMediumScreen(context)) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Column(
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
      );
    } else {
      return Container(
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
      );
    }
  }

  Widget consumerWidget() {
    return Consumer<ExperienceProvider>(builder: (BuildContext context, ExperienceProvider exp, Widget child) {
      if (exp.experience.isEmpty) {
        return FutureBuilder<List<ExperienceModel>>(
            future: exp.getExperience(),
            builder: (_, AsyncSnapshot<List<ExperienceModel>> snapshot) {
              if (snapshot.hasData) {
                if (ResponsiveLayout.isLargeScreen(context) ||
                    ResponsiveLayout.isMediumScreen(context)) {
                  return _gridView(exp.experience, context);
                } else {
                  return _listView(exp.experience);
                }
              } else {
                return Center(
                    child: ResponsiveLayout.isLargeScreen(context) ||
                            ResponsiveLayout.isMediumScreen(context)
                        ? const CircularProgressIndicator()
                        : const SizedBox(
                            height: 50,
                            width: 50,
                            child: CircularProgressIndicator()));
              }
            });
      } else {
        if (ResponsiveLayout.isLargeScreen(context) ||
            ResponsiveLayout.isMediumScreen(context)) {
          return _gridView(exp.experience, context);
        } else {
          return _listView(exp.experience);
        }
      }
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
          final ExperienceModel experience = list[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TranslateOnHover(
              child: CardView(
                title: experience.title,
                imgURL: experience.imgURL,
                imgAlignment: Alignment.centerLeft,
                url: experience.url,
                date: experience.date,
                desc: experience.desc,
                org: experience.org,
                trailingIcon: true,
              ),
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
        final ExperienceModel experience = list[index];
        return Padding(
          padding: const EdgeInsets.all(6.0),
          child: CardView(
            title: experience.title,
            imgURL: experience.imgURL,
            imgAlignment: Alignment.centerLeft,
            url: experience.url,
            date: experience.date,
            desc: experience.desc,
            org: experience.org,
            trailingIcon: true,
          ),
        );
      },
    );
  }
}
