import 'package:flutter/material.dart';
import 'package:my_portfolio/extensions/translateOnHover.dart';
import 'package:my_portfolio/utilities/launcher.dart';
import 'package:my_portfolio/utilities/responsiveLayout.dart';
import 'package:my_portfolio/extensions/hoverExtensions.dart';

final Launcher launcher = Launcher();
class Article extends StatefulWidget {
  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {

  List article=[];

  @override
  void initState() {
    super.initState();
    article=[
      {
        'url': 'https://medium.com/@rageremix/how-to-create-card-carousel-in-flutter-979bc8ecf19',
        'imgURL': 'assets/social/medium.png',
        'title': 'HOW TO CREATE CARD CAROUSEL IN FLUTTER?'
      },
      {
        'url': 'https://www.geeksforgeeks.org/blockchain-in-brief/',
        'imgURL': 'assets/social/gfg1.png',
        'title': 'HOW TO CREATE CARD CAROUSEL IN FLUTTER?'
      },
      {
        'url': 'https://medium.com/@rageremix/my-story-of-app-development-with-flutter-dart-ed6b41cc8226',
        'imgURL': 'assets/social/medium.png',
        'title': 'HOW TO CREATE CARD CAROUSEL IN FLUTTER?'
      },
      {
        'url': 'https://medium.com/@rageremix/how-to-create-card-carousel-in-flutter-979bc8ecf19',
        'imgURL': 'assets/social/medium.png',
        'title': 'HOW TO CREATE CARD CAROUSEL IN FLUTTER?'
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    if(ResponsiveLayout.isLargeScreen(context) || ResponsiveLayout.isMediumScreen(context)) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height:height*0.05),
          Text(
            "ARTICLES",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 30.0,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.0625,
            child: Divider(
              color: Colors.white,
              thickness: 3.0,
            )
          ),
          SizedBox(height:30.0),
          Center(
            child: Container(
              width: width*0.82,
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  childAspectRatio: 1.5/0.5
                ),
                itemCount: article.length,
                itemBuilder: (_, index){
                  return _article(
                    context: context,
                    url: article[index]['url'],
                    imgUrl: article[index]['imgURL'],
                    title: article[index]['title']
                  );
                }
              ),
            ),
          )
        ],
      );
    } else {
      return Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "ARTICLES",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.0625,
                child: Divider(
                  color: Colors.white,
                  thickness: 3.0,
                )
              ),
              SizedBox(height:30.0),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 4,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 1/2
                ),
                physics: NeverScrollableScrollPhysics(),
                itemCount: article.length,
                itemBuilder: (_, index){
                  return _article(
                    context: context,
                    url: article[index]['url'],
                    imgUrl: article[index]['imgURL'],
                    title: article[index]['title']
                  );
                }
              )
            ],
          ),
        ),
      );
    }
  }

  Widget _article({
    BuildContext context,
    String url,
    String imgUrl,
    String title
    }){
    final height=MediaQuery.of(context).size.height;
    return TranslateOnHover(
      child: HandCursor(
        child: GestureDetector(
          onTap: () {
            launcher.launchURL(url);
          },
          child: Container(
            height: height*0.16,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              color: Color(0xff2a2e35),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          title,
                          style: TextStyle(
                            color: Color.fromRGBO(178, 190, 205,1),
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Image.asset(
                      imgUrl,
                      // height: height*0.15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}