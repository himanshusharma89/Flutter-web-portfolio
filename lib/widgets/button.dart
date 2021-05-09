import 'package:flutter/material.dart';
import '../helpers/colors.dart';

import '../main.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({required this.text, required this.link, Key? key})
      : super(key: key);
  final String text, link;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launcher.launchURL(link);
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: ProfileColors.dotOutlineColor)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: const TextStyle(color: ProfileColors.dotOutlineColor),
          ),
        ),
      ),
    );
  }
}
