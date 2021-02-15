import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_portfolio/helpers/translate_on_hover.dart';
import 'package:my_portfolio/model/medium/medium.dart';
import 'package:my_portfolio/model/medium/medium_items.dart';
import 'package:my_portfolio/provider/article_provider.dart';
import 'package:my_portfolio/widgets/card.dart';
import 'package:my_portfolio/helpers/responsive_layout.dart';
import 'package:my_portfolio/widgets/title.dart';
import 'package:provider/provider.dart';

import '../../helpers/constants.dart';

class Article extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (ResponsiveLayout.isLargeScreen(context) ||
        ResponsiveLayout.isMediumScreen(context)) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Center(child: PageTitle(title: 'ARTICLES AND ACHEIVEMENTS')),
            const SizedBox(height: 30.0),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: FutureBuilder<dynamic>(
                    future: Provider.of<ArticleProvider>(context)
                        .getMediumArticles(),
                    builder: (_, AsyncSnapshot<dynamic> snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                            child: SizedBox(
                                height: 50,
                                width: 50,
                                child: CircularProgressIndicator()));
                      } else {
                        final MediumModel mediumModel =
                            snapshot.data as MediumModel;
                        return _gridView(mediumModel.items, context);
                      }
                    }),
              ),
            )
          ],
        ),
      );
    } else {
      return Container(
        color: ProfileColors.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const PageTitle(title: 'Articles'),
              const SizedBox(height: 10.0),
              Flexible(
                child: FutureBuilder<dynamic>(
                    future: Provider.of<ArticleProvider>(context)
                        .getMediumArticles(),
                    builder: (_, AsyncSnapshot<dynamic> snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                            child: SizedBox(
                                height: 50,
                                width: 50,
                                child: CircularProgressIndicator()));
                      } else {
                        final MediumModel mediumModel =
                            snapshot.data as MediumModel;
                        return _listView(mediumModel.items);
                      }
                    }),
              )
            ],
          ),
        ),
      );
    }
  }

  Widget _gridView(List<MediumItems> list, BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        primary: false,
        // physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: ResponsiveLayout.isMediumScreen(context) ? 2 : 3,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            childAspectRatio: 1 / 0.2),
        itemCount: list.length,
        itemBuilder: (_, int index) {
          return TranslateOnHover(
            child: object(list[index])
          );
        });
  }

  Widget _listView(List<MediumItems> list) {
    return ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: list.length,
        itemBuilder: (_, int index) {
          return object(list[index]);
        });
  }

  Widget object(MediumItems items) {
    return CardView(
      title: items.title.toString(),
      imgURL: items.thumbnail.toString(),
      imgAlignment: Alignment.centerRight,
      url: items.link.toString(),
      trailingIcon: false,
      articleLink: items.link,
    );
  }
}
