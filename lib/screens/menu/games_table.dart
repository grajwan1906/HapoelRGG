import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:urdunbasket/models/game.dart';
import 'package:urdunbasket/models/team.dart';
import 'package:urdunbasket/screens/menu/drawer.dart';
import 'package:urdunbasket/shared/constants_and_widgets.dart';
import 'package:urdunbasket/shared/custom_app_bar.dart' as prefix0;
import 'package:urdunbasket/shared/loading.dart';
import 'package:charts_flutter/flutter.dart' as charts;



class GamesTable extends StatefulWidget {
  @override
  _GamesTableState createState() => _GamesTableState();
}

class _GamesTableState extends State<GamesTable> {

  List<Game> gamesThatWere = new List();
  List<Game> gamesToBe = new List();
  List<int> positions = new List();

  int w, l, ptsPlus, ptsMinus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: prefix0.appBar(),
      endDrawer: AppDrawer(),
      body: SizedBox.expand(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/home_background.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20,),
                  Container(
                    child: Image.asset('assets/games_table.jpg',
                      fit: BoxFit.contain, alignment: Alignment.bottomLeft,),
                  ),
                  SizedBox(height: 20,),
                  Align(alignment: Alignment.centerRight,
                      child: Text('תוצאות אחרונות  ', style: TextStyle(
                          fontFamily: 'OpenSansHebrewBold',
                          fontSize: 38,
                          color: Colors.red[900]))), SizedBox(height: 30,),
                  Container(width: double.infinity, child:
                  StreamBuilder(
                    stream: Firestore.instance.collection('tableGames')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        gamesToBe = new List();
                        gamesThatWere = new List();
                        for (var doc in snapshot.data.documents) {
                          if (doc['result']
                              .toString()
                              .isNotEmpty) {
                            DateTime date = new DateTime(int.parse(
                                '20' + doc['date'].toString().substring(6)),
                                int.parse(
                                    doc['date'].toString().substring(3, 5)),
                                int.parse(
                                    doc['date'].toString().substring(0, 2)));
                            gamesThatWere.add(new Game(
                                homeTeamName: doc['homeTeamName'],
                                homeIcon: doc['homeIcon'],
                                awayTeamName: doc['awayTeamName'],
                                awayIcon: doc['awayIcon'],
                                date: date,
                                result: doc['result'],
                                title: doc['title']));
                          }
                        }
                        if (gamesThatWere.length > 0) {
                          gamesThatWere.sort((a, b) {
                            return a.date.compareTo(b.date);
                          });
                        }
                        return gamesThatWereTable(gamesThatWere);
                      } else {
                        return new Loading();
                      }
                    },
                  )
                  ), SizedBox(height: 30,),
                  Align(alignment: Alignment.centerRight,
                      child: Text('לוח משחקים  ', style: TextStyle(
                          fontFamily: 'OpenSansHebrewBold',
                          fontSize: 38,
                          color: Colors.red[900]))), SizedBox(height: 30,),
                  Container(width: double.infinity, child: StreamBuilder(
                    stream: Firestore.instance.collection('tableGames')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        for (var doc in snapshot.data.documents) {
                          if (doc['result']
                              .toString()
                              .isEmpty) {
                            DateTime date = new DateTime(int.parse(
                                '20' + doc['date'].toString().substring(6)),
                                int.parse(
                                    doc['date'].toString().substring(3, 5)),
                                int.parse(
                                    doc['date'].toString().substring(0, 2)));
                            gamesToBe.add(new Game(
                                homeTeamName: doc['homeTeamName'],
                                homeIcon: doc['homeIcon'],
                                awayTeamName: doc['awayTeamName'],
                                awayIcon: doc['awayIcon'],
                                date: date,
                                result: doc['result'],
                                title: doc['title']));
                          }
                        }
                        if (gamesToBe.length > 0) {
                          gamesToBe.sort((a, b) {
                            return a.date.compareTo(b.date);
                          });
                        }
                        return gamesToBeTable(gamesToBe);
                      } else {
                        return new Loading();
                      }
                    },
                  )), SizedBox(height: 30,),
                  Align(alignment: Alignment.centerRight,
                      child: Text('נתונים נוספים  ', style: TextStyle(
                          fontFamily: 'OpenSansHebrewBold',
                          fontSize: 38,
                          color: Colors.red[900]))), SizedBox(height: 30,),
                  Container(
                      width: double.infinity, height: 250, child: StreamBuilder(
                    stream: Firestore.instance.collection('gamesData')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        w = snapshot.data.documents[0]['w'];
                        l = snapshot.data.documents[0]['l'];
                      }
                      return pieChart(w, 'נצחונות', l, 'הפסדים', 'W/L');
                    },
                  )), SizedBox(height: 30,),
                  Container(
                      width: double.infinity, height: 250, child: StreamBuilder(
                    stream: Firestore.instance.collection('gamesData')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        ptsPlus = snapshot.data.documents[0]['pts+'];
                        ptsMinus = snapshot.data.documents[0]['pts-'];
                      }
                      return pieChart(
                          ptsPlus, 'נקודות זכות', ptsMinus, 'נקודות חובה',
                          'Pts+/Pts-');
                    },
                  )), SizedBox(height: 30,),
                  /*Align(alignment: Alignment.centerRight,
                      child: Text('מיקום לפי מחזור  ', style: TextStyle(
                          fontFamily: 'OpenSansHebrewBold',
                          fontSize: 38,
                          color: Colors.red[900]))), SizedBox(height: 10,),
                  Container(
                      width: double.infinity, height: 250, child: StreamBuilder(
                    stream: Firestore.instance.collection('leaguePositions')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        positions = new List();
                        for (var doc in snapshot.data.documents) {
                          positions.add(doc['position']);
                        }
                      }
                      return pointLineChart(positions, 'מיקום בליגה');
                    },
                  )), SizedBox(height: 30,)*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

