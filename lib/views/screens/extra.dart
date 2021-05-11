import 'package:flutter/material.dart';
import '../../helpers/colors.dart';

class Extra extends StatelessWidget {
  const Extra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Center(
        child: Text(
          'Coming Soon',
          style: TextStyle(fontSize: 25, color: ProfileColors.dotOutlineColor),
        ),
      ),
    );
  }
}
