import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_portfolio/helpers/constants.dart';
import 'package:my_portfolio/main.dart';

class SocialWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.02 + 20,
      alignment: Alignment.bottomCenter,
      child: ListView.builder(
        // physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        primary: false,
        itemCount: socialPlatforms.length,
        itemBuilder: (_, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 7, bottom: 7),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  launcher.launchURL(socialPlatforms[index]['URL'].toString());
                },
                child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: FadeInImage(
                      width: 30.0,
                      height: 30.0,
                      // color: ProfileTheme.dotOutlineColor,
                      placeholder: const AssetImage('assets/placeholder.gif'),
                      image: NetworkImage(
                        socialPlatforms[index]['iconURL'].toString(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
