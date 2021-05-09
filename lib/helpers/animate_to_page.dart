import 'package:flutter/cupertino.dart';

Future<void> animateToPage(PageController controller, int index) async {
  if (controller.hasClients) {
    controller.animateToPage(index,
        duration: const Duration(milliseconds: 1000), curve: Curves.ease);
  }
}
