import 'package:flutter/material.dart';
import 'package:my_portfolio/provider/drawer_controller.dart';
import 'package:my_portfolio/utilities/launcher.dart';
import 'package:my_portfolio/profile_theme.dart';
import 'package:provider/provider.dart';

final Launcher launcher = Launcher();
class DrawerScreen extends StatefulWidget {
  final BuildContext context;
  
  DrawerScreen(this.context);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {

  List<MenuItem> options;

  @override
  void initState() {
    super.initState();
    options = [
    MenuItem(
      icon: 'https://img.icons8.com/fluent/50/000000/github.png', 
      title: 'GitHub',
      onTap: (){
        launcher.launchURL('https://github.com/himanshusharma89');
      }
    ),
    MenuItem(
      icon: 'https://img.icons8.com/color/48/000000/linkedin.png', 
      title: 'LinkedIn',
      onTap: (){
        launcher.launchURL('https://www.linkedin.com/in/himanshusharma89/');
      }
    ),
    MenuItem(
      icon: 'https://img.icons8.com/color/48/000000/twitter.png', 
      title: 'Twitter',
      onTap: (){
        launcher.launchURL('https://twitter.com/_SharmaHimanshu');
      }
    ),
    MenuItem(
      icon: 'https://img.icons8.com/ios-filled/50/000000/codepen.png', 
      title: 'Codepen',
      onTap: (){
        launcher.launchURL('https://codepen.io/himanshusharma89');
      }
    ),
    MenuItem(
      icon: 'https://img.icons8.com/color/48/000000/stackoverflow.png', 
      title: 'Stackoverflow',
      onTap: (){
        launcher.launchURL('https://stackoverflow.com/users/11545939/himanshu-sharma');
      }
    ),
  ];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        //on swiping left
        if (details.delta.dx < -6) {
          Provider.of<MenuController>(context, listen: false).toggle();
        }
      },
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: MediaQuery.of(context).size.width / 2.9),
            color: ProfileTheme.drawerColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: options.map((item) {
                return ListTile(
                  leading: Image.network(
                    item.icon,
                    height: 50,
                    width: 50,
                  ),
                  title: Text(
                    item.title,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  onTap: item.onTap,
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12, left: 8, right: 8),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'THIS WEBSITE IS CREATED WITH FLUTTER WEB ❤',
                  style: TextStyle(
                    fontSize: 15, 
                    color: Colors.white,
                    fontWeight: FontWeight.w500
                  )
              )
            ),
          )
        ],
      ),
    );
  }
}

class MenuItem {
  String title;
  String icon;
  Function onTap;

  MenuItem({this.icon, this.title, this.onTap});
}