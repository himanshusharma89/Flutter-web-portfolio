import 'package:flutter/material.dart';
import 'package:my_portfolio/provider/drawer_controller.dart';
import 'package:my_portfolio/helpers/constants.dart';
import 'package:provider/provider.dart';

class DrawerScreen extends StatelessWidget {
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
                left: 20, right: MediaQuery.of(context).size.width / 2.9),
            color: ProfileColors.drawerColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: options.map((MenuItem item) {
                return ListTile(
                  leading: Image.network(
                    item.icon,
                    height: 50,
                    width: 50,
                  ),
                  title: Text(
                    item.title,
                    style: const TextStyle(
                        fontSize: 14,
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
                child: Text('THIS WEBSITE IS CREATED WITH FLUTTER WEB ❤',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w500))),
          )
        ],
      ),
    );
  }
}
