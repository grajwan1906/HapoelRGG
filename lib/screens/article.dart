import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:urdunbasket/models/article.dart';
import 'package:urdunbasket/shared/custom_app_bar.dart' as prefix0;

class ArticleScreen extends StatefulWidget {
  String articleImage, homeImage, articleTitle, articleSubTitle, date, firstTitle, firstText, secondTitle, secondText, endText1, endText2;
  ArticleScreen(String articleImage, String homeImage, String articleTitle, String articleSubTitle, String date, String firstTitle, String firstText, String secondTitle, String secondText, String endText1, String endText2){
    this.articleImage = articleImage;
    this.homeImage = homeImage;
    this.articleTitle = articleTitle;
    this.articleSubTitle = articleSubTitle;
    this.date = date;
    this.firstTitle = firstTitle;
    this.firstText = firstText;
    this.secondTitle = secondTitle;
    this.secondText = secondText;
    this.endText1 = endText1;
    this.endText2 = endText2;
  }
  @override
  _ArticleScreenState createState() => _ArticleScreenState(articleImage, homeImage, articleTitle, articleSubTitle, date, firstTitle, firstText, secondTitle, secondText, endText1, endText2);
}

class _ArticleScreenState extends State<ArticleScreen> {

  String articleImage, homeImage, articleTitle, articleSubTitle, date, firstTitle, firstText, secondTitle, secondText, endText1, endText2;
  _ArticleScreenState(String articleImage, String homeImage, String articleTitle, String articleSubTitle, String date, String firstTitle, String firstText, String secondTitle, String secondText, String endText1, String endText2){
    this.articleImage = articleImage;
    this.homeImage = homeImage;
    this.articleTitle = articleTitle;
    this.articleSubTitle = articleSubTitle;
    this.date = date;
    this.firstTitle = firstTitle;
    this.firstText = firstText;
    this.secondTitle = secondTitle;
    this.secondText = secondText;
    this.endText1 = endText1;
    this.endText2 = endText2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: prefix0.appBar(),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/home_background.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Flexible(
                    child: ListView(
                      children: <Widget>[
                        Container(
                          child: Image.network(articleImage,
                            fit: BoxFit.contain, alignment: Alignment.bottomLeft,),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          padding: EdgeInsets.fromLTRB(0,0,15,0),
                          child: Text(articleSubTitle, style: TextStyle(
                              fontFamily: 'OpenSansHebrewBold',
                              fontSize: 20,
                              color: Colors.black)),
                        ),
                        SizedBox(height: 25,),
                        Container(
                          padding: EdgeInsets.fromLTRB(0,0,15,0),
                          child: Text(firstTitle + " ", style: TextStyle(
                              fontFamily: 'OpenSansHebrewBold',
                              fontSize: 20,
                              color: Colors.black)),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0,0,15,0),
                          child: Text(firstText, style: TextStyle(
                              fontFamily: 'OpenSansHebrew',
                              fontSize: 20,
                              color: Colors.black)),
                        ),
                        SizedBox(height: 40,),
                        Container(
                          padding: EdgeInsets.fromLTRB(0,0,15,0),
                          child: Text(secondTitle + " ", style: TextStyle(
                              fontFamily: 'OpenSansHebrewBold',
                              fontSize: 20,
                              color: Colors.black)),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0,0,15,0),
                          child: Text(secondText, style: TextStyle(
                              fontFamily: 'OpenSansHebrew',
                              fontSize: 20,
                              color: Colors.black)),
                        ),
                        SizedBox(height: 20,),
                        Center(child: Text(endText1 + " ", style: TextStyle(
                            fontFamily: 'OpenSansHebrewBold',
                            fontSize: 20,
                            color: Colors.black))),
                        SizedBox(height: 5,),
                        Center(child: Text(endText2 + " ", style: TextStyle(
                            fontFamily: 'OpenSansHebrewBold',
                            fontSize: 26,
                            color: Colors.red[900]))),
                        SizedBox(height: 30,)
                      ],
                    ),
                  ),
                ),
              ]
          ),
        )
    );
  }
}
