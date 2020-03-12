import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urdunbasket/models/article.dart';
import 'package:urdunbasket/screens/article.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:urdunbasket/shared/constants_and_widgets.dart';
import 'package:urdunbasket/shared/loading.dart';

class ArticleManager extends StatefulWidget {
  @override
  _ArticleManagerState createState() => _ArticleManagerState();
}

class _ArticleManagerState extends State<ArticleManager> {

  List<Article> articles = new List();

  String competition, title, time, homeTeamName, homeTeamIcon,
      awayTeamName, awayTeamIcon, address;
  Color homeColor, awayColor;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('article').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          for (var doc in snapshot.data.documents){
            articles.add(new Article(
              articleImage: doc['articleImage'],
              articleTitle: doc['articleTitle'],
              articleSubTitle: doc['articleSubTitle'],
              authorName: doc['authorName'],
              date: doc['date'],
              homeImage: doc['homeImage'],
              homeTitle: doc['homeTitle'],
              text: doc['text'],
              firstTitle: doc['firstTitle'],
              firstText: doc['firstText'],
              secondTitle: doc['secondTitle'],
              secondText: doc['secondText'],
              endText1: doc['endText1'],
              endText2: doc['endText2'],));
          }
          return Column(
            children: <Widget>[homeArticle(snapshot.data.documents[1]['articleImage'], snapshot.data.documents[1]['homeImage'], snapshot.data.documents[1]['articleTitle'], snapshot.data.documents[1]['articleSubTitle'], snapshot.data.documents[1]['date'], snapshot.data.documents[1]['firstTitle'], snapshot.data.documents[1]['firstText'], snapshot.data.documents[1]['secondTitle'], snapshot.data.documents[1]['secondText'], snapshot.data.documents[1]['endText1'], snapshot.data.documents[1]['endText2'], context),
              homeArticle(snapshot.data.documents[0]['articleImage'], snapshot.data.documents[0]['homeImage'], snapshot.data.documents[0]['articleTitle'], snapshot.data.documents[0]['articleSubTitle'], snapshot.data.documents[0]['date'], snapshot.data.documents[0]['firstTitle'], snapshot.data.documents[0]['firstText'], snapshot.data.documents[0]['secondTitle'], snapshot.data.documents[0]['secondText'], snapshot.data.documents[0]['endText1'], snapshot.data.documents[0]['endText2'], context)
            ],
          );
        } else {
          return Loading();
        }
      },
    );
  }
}
