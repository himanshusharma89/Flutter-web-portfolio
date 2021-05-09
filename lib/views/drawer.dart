import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/colors.dart';
import '../helpers/constants.dart';
import '../provider/drawer_controller.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        //on swiping left
        if (details.delta.dx < -6) {
          Provider.of<MenuController>(context, listen: false).toggle();
        }
      },
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                left: 15, right: MediaQuery.of(context).size.width / 2.9),
            color: ProfileColors.drawerColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: options.map((MenuItem item) {
                return ListTile(
                  leading: Image.network(
                    item.icon!,
                    height: 35,
                    width: 35,
                  ),
                  title: Text(
                    item.title!,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  onTap: item.onTap,
                );
              }).toList(),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 12, left: 8, right: 8),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Text('This wesite is created with Flutter Web ❤',
                    style: TextStyle(fontSize: 16, color: Colors.white))),
          )
        ],
      ),
    );
  }
}
