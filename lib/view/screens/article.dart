import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_portfolio/helpers/translateOnHover.dart';
import 'package:my_portfolio/model/medium/medium.dart';
import 'package:my_portfolio/provider/article_provider.dart';
import 'package:my_portfolio/widgets/card.dart';
import 'package:my_portfolio/helpers/responsiveLayout.dart';
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
            Center(child: PageTitle(title: "ARTICLES AND ACHEIVEMENTS")),
            SizedBox(height: 30.0),
            Flexible(
              fit: FlexFit.loose,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: FutureBuilder(
                    future: Provider.of<ArticleProvider>(context)
                        .getMediumArticles(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                            child: Container(
                                height: 50,
                                width: 50,
                                child: CircularProgressIndicator()));
                      } else {
                        MediumModel mediumModel = snapshot.data;
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
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              PageTitle(title: 'Articles'),
              SizedBox(height: 10.0),
              Flexible(
                child: FutureBuilder(
                    future: Provider.of<ArticleProvider>(context)
                        .getMediumArticles(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                            child: Container(
                                height: 50,
                                width: 50,
                                child: CircularProgressIndicator()));
                      } else {
                        MediumModel mediumModel = snapshot.data;
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

  Widget _gridView(List list, BuildContext context) {
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
        itemBuilder: (_, index) {
          return TranslateOnHover(
            child: CardView(
              title: list[index].title,
              imgURL: list[index].thumbnail,
              imgAlignment: Alignment.centerRight,
              url: list[index].link,
              trailingIcon: false,
            ),
          );
        });
  }

  Widget _listView(List list) {
    return ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: list.length,
        itemBuilder: (_, index) {
          return CardView(
            title: list[index].title,
            imgURL: list[index].thumbnail,
            imgAlignment: Alignment.centerRight,
            url: list[index].link,
            trailingIcon: false,
          );
        });
  }
}
