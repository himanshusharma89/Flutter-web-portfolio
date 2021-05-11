import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../main.dart';
import '../model/social_platform_item.dart';

class SocialWidget extends StatelessWidget {
  const SocialWidget({required this.socials, Key? key}) : super(key: key);
  final List<SocialPlatformsItem> socials;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      primary: false,
      itemCount: socials.length,
      itemBuilder: (_, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.5),
          child: _socialWidgetItem(context, socials[index]),
        );
      },
    );
  }

  Widget _socialWidgetItem(
      BuildContext context, SocialPlatformsItem socialPlatformsItem) {
    return Container(
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      padding: const EdgeInsets.all(2),
      child: InkWell(
        onTap: () {
          launcher.launchURL(socialPlatformsItem.url);
        },
        onLongPress: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.2,
                vertical: 2),
            content: Text(socialPlatformsItem.title.startsWith('B')
                ? 'Check out my ${socialPlatformsItem.title}'
                : 'Check out my ${socialPlatformsItem.title} Account'),
          ));
        },
        customBorder: const CircleBorder(),
        child: FadeInImage.memoryNetwork(
          width: 30.0,
          height: 30.0,
          placeholder: unit8ListPlaceholder,
          image: socialPlatformsItem.icon,
        ),
      ),
    );
  }
}
