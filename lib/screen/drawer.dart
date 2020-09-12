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
    final height = MediaQuery.of(context).size.width;
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
            padding: EdgeInsets.only(top: 62, left: 32, bottom: 8, right: MediaQuery.of(context).size.width / 2.9),
            color: ProfileTheme.drawerColor,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      height: height*0.2,
                      width: height*0.2,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2
                        ),
                      ),
                      child: Icon(
                        Icons.image
                      ),
                    ),
                    SizedBox(width: height*0.02,),
                    Text(
                      'Tatiana',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                Spacer(),
                Column(
                  children: options.map((item) {
                    return ListTile(
                      leading: Image.network(
                        item.icon,
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
                Spacer(),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 20,
                  ),
                  title: Text('Support',
                      style: TextStyle(fontSize: 14, color: Colors.white)),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'THIS WEBSITE IS CREATED WITH FLUTTER WEB ❤',
                style: TextStyle(fontSize: 14, color: Colors.white,)
            )
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