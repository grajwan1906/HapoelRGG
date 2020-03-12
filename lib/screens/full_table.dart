import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:urdunbasket/models/team.dart';
import 'package:urdunbasket/screens/menu/drawer.dart';
import 'package:urdunbasket/shared/constants_and_widgets.dart';
import 'package:urdunbasket/shared/custom_app_bar.dart' as prefix0;
import 'package:urdunbasket/shared/loading.dart';

class FullTable extends StatefulWidget {
  @override
  _FullTableState createState() => _FullTableState();
}

class _FullTableState extends State<FullTable> {

  int indexMyTeam = 0;
  List<Team> teams = new List();

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
          child: StreamBuilder(
            stream: Firestore.instance.collection('table').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                teams = new List();
                for (int i = 0; i < 14; i++) {
                  teams.add(new Team(name: snapshot.data.documents[i]['name'],
                      points: snapshot.data.documents[i]['points'],
                      difference: snapshot.data.documents[i]['difference'],
                      games: snapshot.data.documents[i]['games'],
                      number: snapshot.data.documents[i]['number']));
                }
                teams.sort((a, b) {
                  return a.number.compareTo(b.number);
                });
                List<Team> newTeams = new List();
                newTeams.add(teams.elementAt(0));
                newTeams.add(teams.elementAt(6));
                newTeams.add(teams.elementAt(7));
                newTeams.add(teams.elementAt(8));
                newTeams.add(teams.elementAt(9));
                newTeams.add(teams.elementAt(10));
                newTeams.add(teams.elementAt(11));
                newTeams.add(teams.elementAt(12));
                newTeams.add(teams.elementAt(13));
                newTeams.add(teams.elementAt(1));
                newTeams.add(teams.elementAt(2));
                newTeams.add(teams.elementAt(3));
                newTeams.add(teams.elementAt(4));
                newTeams.add(teams.elementAt(5));

                for (int i = 0; i < 14; i++) {
                  if (newTeams
                      .elementAt(i)
                      .name == 'הפועל ר"ג גבעתיים')
                    indexMyTeam = i;
                }
                return fullTable(newTeams, indexMyTeam);
              } else {
                return new Loading();
              }
            },
          ),
        ),
      ),
    );
  }
}

