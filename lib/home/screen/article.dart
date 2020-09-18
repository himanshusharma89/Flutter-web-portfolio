import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_portfolio/extensions/translateOnHover.dart';
import 'package:my_portfolio/model/medium/medium_model.dart';
import 'package:my_portfolio/provider/article_provider.dart';
import 'package:my_portfolio/utilities/launcher.dart';
import 'package:my_portfolio/utilities/responsiveLayout.dart';
import 'package:my_portfolio/utilities/title.dart';
import 'package:provider/provider.dart';

final Launcher launcher = Launcher();

class Article extends StatefulWidget {
  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<ArticleProvider>(context).getMediumArticles(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else {
            MediumModel mediumModel = snapshot.data;
            if (ResponsiveLayout.isLargeScreen(context) ||
                ResponsiveLayout.isMediumScreen(context)) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(height: 50),
                    Center(
                        child: PageTitle(title: "ARTICLES AND ACHEIVEMENTS")),
                    SizedBox(height: 30.0),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 4,
                                    mainAxisSpacing: 4,
                                    childAspectRatio: 1 / 0.2),
                            itemCount: mediumModel.items.length,
                            itemBuilder: (_, index) {
                              return _article(
                                  context: context,
                                  url: mediumModel.items[index].link,
                                  imgUrl: mediumModel.items[index].thumbnail,
                                  title: mediumModel.items[index].title);
                            }),
                      ),
                    )
                  ],
                ),
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
                          width: MediaQuery.of(context).size.width * 0.0625,
                          child: Divider(
                            color: Colors.white,
                            thickness: 3.0,
                          )),
                      SizedBox(height: 30.0),
                      GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 4,
                                  mainAxisSpacing: 4,
                                  crossAxisSpacing: 1 / 2),
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: mediumModel.items.length,
                          itemBuilder: (_, index) {
                            return _article(
                                context: context,
                                url: mediumModel.items[index].link,
                                imgUrl: mediumModel.items[index].thumbnail,
                                title: mediumModel.items[index].title);
                          })
                    ],
                  ),
                ),
              );
            }
          }
        });
  }

  Widget _article(
      {BuildContext context, String url, String imgUrl, String title}) {
    return TranslateOnHover(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            launcher.launchURL(url);
          },
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            color: Color(0xff2a2e35),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        title,
                        style: TextStyle(
                            color: Color.fromRGBO(178, 190, 205, 1),
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.network(
                      imgUrl,
                      // height: height*0.15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
