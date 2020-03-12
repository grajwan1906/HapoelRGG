import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:urdunbasket/shared/constants_and_widgets.dart';
import 'package:urdunbasket/shared/loading.dart';

class NextGameCard extends StatefulWidget {
  @override
  _NextGameCardState createState() => _NextGameCardState();
}

class _NextGameCardState extends State<NextGameCard> {

  String competition, title, time, homeTeamName, homeTeamIcon,
      awayTeamName, awayTeamIcon, address;
  Color homeColor, awayColor;

  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
      stream: Firestore.instance.collection('nextGame').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          competition = snapshot.data.documents[0]['competition'];
          title = snapshot.data.documents[0]['title'];
          time = snapshot.data.documents[0]['time'];
          homeTeamName = snapshot.data.documents[0]['homeTeamName'];
          homeTeamIcon = snapshot.data.documents[0]['homeTeamIcon'];
          awayTeamName = snapshot.data.documents[0]['awayTeamName'];
          awayTeamIcon = snapshot.data.documents[0]['awayTeamIcon'];
          address = snapshot.data.documents[0]['address'];
          if (homeTeamName == 'הפועל רמת גן גבעתיים'){
            homeColor = Colors.red[900];
            awayColor = Colors.black;
          } else {
            homeColor = Colors.black;
            awayColor = Colors.red[900];
          }
          return nextGameCardHelper(competition, title, time, homeTeamName, homeTeamIcon, awayTeamName, awayTeamIcon, homeColor, awayColor, address);
        } else {
          return new Loading();
        }
      },
    );
  }
}

