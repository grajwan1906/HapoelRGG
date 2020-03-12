import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:urdunbasket/models/team.dart';
import 'package:urdunbasket/shared/constants_and_widgets.dart';
import 'package:urdunbasket/shared/loading.dart';
import 'package:async/async.dart';

class HomeTable extends StatefulWidget {
  @override
  _HomeTableState createState() => _HomeTableState();
}

class _HomeTableState extends State<HomeTable> {

  List<Team> finalTeams;
  int indexOfTeam, indexOfTable;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('table').snapshots(),
      builder: (context, snapshot) {
        List<Team> teams = new List();
        if (snapshot.hasData) {
          for (int i = 0; i < 14; i++) {
            teams.add(new Team(name: snapshot.data.documents[i]['name'],
                points: snapshot.data.documents[i]['points'],
                difference: snapshot.data.documents[i]['difference'],
                games: snapshot.data.documents[i]['games'],
                number: snapshot.data.documents[i]['number']));
          }
          teams.sort((a, b) => a.number.compareTo(b.number));
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
          int indexMyTeam = 2;
          bool first = false;
          bool last = false;
          for (int i = 0; i < 14; i++) {
            if (newTeams
                .elementAt(i)
                .name == 'הפועל ר"ג גבעתיים')
              indexMyTeam = i;
          }
          if (indexMyTeam == 0) {
            first = true;
            last = false;
          }
          else if (indexMyTeam == 14 - 1) {
            first = false;
            last = true;
          }
          else {
            first = false;
            last = false;
          }

          if (first) {
            indexOfTeam = indexMyTeam;
            indexOfTable = 1;
            finalTeams = newTeams;
            return firstTable(newTeams, indexMyTeam, context);
          } else if (last) {
            indexOfTeam = indexMyTeam;
            indexOfTable = 3;
            finalTeams = newTeams;
            return thirdTable(newTeams, indexMyTeam, context);
          } else {
            indexOfTeam = indexMyTeam;
            indexOfTable = 2;
            finalTeams = newTeams;
            return secondTable(newTeams, indexMyTeam, context);
          }
        } else {
          return new Loading();
        }
      },
    );
  }
}


