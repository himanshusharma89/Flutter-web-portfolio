import 'package:flutter/material.dart';
import 'package:my_portfolio/helpers/translate_on_hover.dart';
import 'package:my_portfolio/model/card/card.dart';
import 'package:my_portfolio/widgets/card.dart';
import 'package:responsive_grid/responsive_grid.dart';

Widget gridView(List<CardModel> list, double width) {
  return ResponsiveGridList(
      minSpacing: 8,
      desiredItemWidth: width,
      children: list
          .map((e) => TranslateOnHover(
                child: listItem(e),
              ),)
          .toList(),);
}

Widget listView(List<CardModel> list) {
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

Widget listItem(CardModel cardModel) {
  return CardView(
    title: cardModel.title,
    imgURL: cardModel.imgURL,
    url: cardModel.url,
    desc: cardModel.desc,
    org: cardModel.org,
    startAt: cardModel.startAt,
    endAt: cardModel.endAt,
    projectLink: cardModel.projectLink,
  );
}
