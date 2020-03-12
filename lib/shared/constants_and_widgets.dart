import 'package:flutter/material.dart';
import 'package:urdunbasket/models/article.dart';
import 'package:urdunbasket/models/game.dart';
import 'package:urdunbasket/models/ride.dart';
import 'package:urdunbasket/models/team.dart';
import 'package:urdunbasket/screens/article.dart';
import 'package:urdunbasket/screens/full_table.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:urdunbasket/screens/menu/ridesBoard/add_ride.dart';
import 'package:urdunbasket/services/auth.dart';
import 'package:urdunbasket/shared/delete_ride_base_alert_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

const List<String> history = <String>['שנות ה-60', 'שנות ה-70', 'שנות ה-80'];

const textInputDecoration = InputDecoration(
  focusColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 2.0)
  ),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.pink, width: 2.0)
  ),
);

Widget homeTableHelper(List<Team> teams, int indexMyTeam, int indexOfTable, BuildContext context){
  if (indexOfTable == 1){
    return firstTable(teams, indexMyTeam, context);
  } else if (indexOfTable == 2){
    return secondTable(teams, indexMyTeam, context);
  }else {
    return thirdTable(teams, indexMyTeam, context);
  }
}

Widget firstTable(List<Team> teams, int indexMyTeam, BuildContext context){
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Card(
      child: DataTable(
        columnSpacing: 1, dataRowHeight: 70,
        columns: <DataColumn>[
          DataColumn(label: Text('     מספר',
              style: TextStyle(fontFamily: 'OpenSansHebrew'))),
          DataColumn(label: Text('      קבוצה          ',
              style: TextStyle(fontFamily: 'OpenSansHebrew'))),
          DataColumn(label: Text('     משחקים',
              style: TextStyle(fontFamily: 'OpenSansHebrew'))),
          DataColumn(label: Text('     נקודות',
              style: TextStyle(fontFamily: 'OpenSansHebrew'))),
          DataColumn(label: Text('     הפרש',
              style: TextStyle(fontFamily: 'OpenSansHebrew'))),
        ], rows: <DataRow>[
        DataRow(cells: <DataCell>[
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam)
              .number, style: TextStyle(
              fontFamily: 'OpenSansHebrewBold',
              color: Colors.red[900]))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Text(teams
              .elementAt(indexMyTeam)
              .name, style: TextStyle(fontFamily: 'OpenSansHebrewBold',
              color: Colors.red[900])), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam)
              .games, style: TextStyle(fontFamily: 'OpenSansHebrewBold',
              color: Colors.red[900]))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam)
              .points, style: TextStyle(
              fontFamily: 'OpenSansHebrewBold',
              color: Colors.red[900]))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam)
              .difference, style: TextStyle(
              fontFamily: 'OpenSansHebrewBold',
              color: Colors.red[900]))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
        ]),
        DataRow(cells: <DataCell>[
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam + 1)
              .number, style: TextStyle(
              fontFamily: 'OpenSansHebrew'))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Text(teams
              .elementAt(indexMyTeam + 1)
              .name, style: TextStyle(fontFamily: 'OpenSansHebrew')), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam + 1)
              .games, style: TextStyle(fontFamily: 'OpenSansHebrew'))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam + 1)
              .points, style: TextStyle(
              fontFamily: 'OpenSansHebrew'))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam + 1)
              .difference, style: TextStyle(
              fontFamily: 'OpenSansHebrew'))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
        ]),
        DataRow(cells: <DataCell>[
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam + 2)
              .number, style: TextStyle(
              fontFamily: 'OpenSansHebrew'))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Text(teams
              .elementAt(indexMyTeam + 2)
              .name, style: TextStyle(fontFamily: 'OpenSansHebrew')), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam + 2)
              .games, style: TextStyle(fontFamily: 'OpenSansHebrew'))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam + 2)
              .points, style: TextStyle(
              fontFamily: 'OpenSansHebrew'))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam + 2)
              .difference, style: TextStyle(
              fontFamily: 'OpenSansHebrew'))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
        ]),
      ],
      ),
    ),
  );
}

Widget thirdTable(List<Team> teams, int indexMyTeam, BuildContext context){
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Card(
      child: DataTable(
        columnSpacing: 1, dataRowHeight: 70,
        columns: <DataColumn>[
          DataColumn(label: Text('     מספר',
              style: TextStyle(fontFamily: 'OpenSansHebrew'))),
          DataColumn(label: Text('      קבוצה          ',
              style: TextStyle(fontFamily: 'OpenSansHebrew'))),
          DataColumn(label: Text('     משחקים',
              style: TextStyle(fontFamily: 'OpenSansHebrew'))),
          DataColumn(label: Text('     נקודות',
              style: TextStyle(fontFamily: 'OpenSansHebrew'))),
          DataColumn(label: Text('     הפרש',
              style: TextStyle(fontFamily: 'OpenSansHebrew'))),
        ], rows: <DataRow>[
        DataRow(cells: <DataCell>[
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam - 2)
              .number, style: TextStyle(
              fontFamily: 'OpenSansHebrew'))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Text(teams
              .elementAt(indexMyTeam - 2)
              .name, style: TextStyle(fontFamily: 'OpenSansHebrew')), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam - 2)
              .games, style: TextStyle(fontFamily: 'OpenSansHebrew'))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam - 2)
              .points, style: TextStyle(
              fontFamily: 'OpenSansHebrew'))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam - 2)
              .difference, style: TextStyle(
              fontFamily: 'OpenSansHebrew'))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
        ]),
        DataRow(cells: <DataCell>[
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam - 1)
              .number, style: TextStyle(
              fontFamily: 'OpenSansHebrew'))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Text(teams
              .elementAt(indexMyTeam - 1)
              .name, style: TextStyle(fontFamily: 'OpenSansHebrew')), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam - 1)
              .games, style: TextStyle(fontFamily: 'OpenSansHebrew'))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam - 1)
              .points, style: TextStyle(
              fontFamily: 'OpenSansHebrew'))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam - 1)
              .difference, style: TextStyle(
              fontFamily: 'OpenSansHebrew'))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
        ]),
        DataRow(cells: <DataCell>[
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam)
              .number, style: TextStyle(
              fontFamily: 'OpenSansHebrewBold',
              color: Colors.red[900]))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Text(teams
              .elementAt(indexMyTeam)
              .name, style: TextStyle(
              fontFamily: 'OpenSansHebrewBold', color: Colors
              .red[900])), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam)
              .games, style: TextStyle(fontFamily: 'OpenSansHebrewBold',
              color: Colors.red[900]))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam)
              .points, style: TextStyle(
              fontFamily: 'OpenSansHebrewBold',
              color: Colors.red[900]))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam)
              .difference, style: TextStyle(
              fontFamily: 'OpenSansHebrewBold',
              color: Colors.red[900]))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
        ]),
      ],
      ),
    ),
  );
}

Widget secondTable(List<Team> teams, int indexMyTeam, BuildContext context) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Card(
      child: DataTable(
        columnSpacing: 1, dataRowHeight: 70,
        columns: <DataColumn>[
          DataColumn(label: Text('     מספר',
              style: TextStyle(fontFamily: 'OpenSansHebrew'))),
          DataColumn(label: Text('      קבוצה          ',
              style: TextStyle(fontFamily: 'OpenSansHebrew'))),
          DataColumn(label: Text('     משחקים',
              style: TextStyle(fontFamily: 'OpenSansHebrew'))),
          DataColumn(label: Text('     נקודות',
              style: TextStyle(fontFamily: 'OpenSansHebrew'))),
          DataColumn(label: Text('     הפרש',
              style: TextStyle(fontFamily: 'OpenSansHebrew'))),
        ], rows: <DataRow>[
        DataRow(cells: <DataCell>[
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam - 1)
              .number, style: TextStyle(
              fontFamily: 'OpenSansHebrew'))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Text(teams
              .elementAt(indexMyTeam - 1)
              .name, style: TextStyle(fontFamily: 'OpenSansHebrew')), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam - 1)
              .games, style: TextStyle(fontFamily: 'OpenSansHebrew'))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam - 1)
              .points, style: TextStyle(
              fontFamily: 'OpenSansHebrew'))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam - 1)
              .difference, style: TextStyle(
              fontFamily: 'OpenSansHebrew'))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
        ]),
        DataRow(cells: <DataCell>[
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam)
              .number, style: TextStyle(
              fontFamily: 'OpenSansHebrewBold',
              color: Colors.red[900]))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Text(teams
              .elementAt(indexMyTeam)
              .name, style: TextStyle(
              fontFamily: 'OpenSansHebrewBold', color: Colors
              .red[900])), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam)
              .games, style: TextStyle(fontFamily: 'OpenSansHebrewBold',
              color: Colors.red[900]))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam)
              .points, style: TextStyle(
              fontFamily: 'OpenSansHebrewBold',
              color: Colors.red[900]))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam)
              .difference, style: TextStyle(
              fontFamily: 'OpenSansHebrewBold',
              color: Colors.red[900]))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
        ]),
        DataRow(cells: <DataCell>[
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam + 1)
              .number, style: TextStyle(
              fontFamily: 'OpenSansHebrew'))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Text(teams
              .elementAt(indexMyTeam + 1)
              .name, style: TextStyle(fontFamily: 'OpenSansHebrew')), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam + 1)
              .games, style: TextStyle(fontFamily: 'OpenSansHebrew'))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam + 1)
              .points, style: TextStyle(
              fontFamily: 'OpenSansHebrew'))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
          DataCell(Center(child: Text(teams
              .elementAt(indexMyTeam + 1)
              .difference, style: TextStyle(
              fontFamily: 'OpenSansHebrew'))), onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullTable()));
          }),
        ]),
      ],
      ),
    ),
  );
}

Widget fullTable(List<Team> teams, int indexMyTeam){
  List<TextStyle> styles = new List();
  for (int i = 0; i < 14; i++) {
    if (i != indexMyTeam) {
      styles.add(TextStyle(fontFamily: 'OpenSansHebrew', color: Colors.black));
    }
    else {
      styles.add(TextStyle(fontFamily: 'OpenSansHebrewBold', color: Colors.red[900]));
    }
  }
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Card(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columnSpacing: 1, dataRowHeight: 70,
            columns: <DataColumn>[
              DataColumn(label: Text('     מספר',
                  style: TextStyle(fontFamily: 'OpenSansHebrew'))),
              DataColumn(label: Text('      קבוצה          ',
                  style: TextStyle(fontFamily: 'OpenSansHebrew'))),
              DataColumn(label: Text('     משחקים',
                  style: TextStyle(fontFamily: 'OpenSansHebrew'))),
              DataColumn(label: Text('     נקודות',
                  style: TextStyle(fontFamily: 'OpenSansHebrew'))),
              DataColumn(label: Text('     הפרש',
                  style: TextStyle(fontFamily: 'OpenSansHebrew'))),
            ], rows: <DataRow>[
            DataRow(cells: <DataCell>[
              DataCell(Center(child: Text(teams.elementAt(0).number, style: styles.elementAt(0)))),
              DataCell(Text(teams.elementAt(0).name, style: styles.elementAt(0))),
              DataCell(Center(child: Text(teams.elementAt(0).games, style: styles.elementAt(0)))),
              DataCell(Center(child: Text(teams.elementAt(0).points, style: styles.elementAt(0)))),
              DataCell(Center(child: Text(teams.elementAt(0).difference, style: styles.elementAt(0)))),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Center(child: Text(teams.elementAt(1).number, style: styles.elementAt(1)))),
              DataCell(Text(teams.elementAt(1).name, style: styles.elementAt(1))),
              DataCell(Center(child: Text(teams.elementAt(1).games, style: styles.elementAt(1)))),
              DataCell(Center(child: Text(teams.elementAt(1).points, style: styles.elementAt(1)))),
              DataCell(Center(child: Text(teams.elementAt(1).difference, style: styles.elementAt(1)))),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Center(child: Text(teams.elementAt(2).number, style: styles.elementAt(2)))),
              DataCell(Text(teams.elementAt(2).name, style: styles.elementAt(2))),
              DataCell(Center(child: Text(teams.elementAt(2).games, style: styles.elementAt(2)))),
              DataCell(Center(child: Text(teams.elementAt(2).points, style: styles.elementAt(2)))),
              DataCell(Center(child: Text(teams.elementAt(2).difference, style: styles.elementAt(2)))),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Center(child: Text(teams.elementAt(3).number, style: styles.elementAt(3)))),
              DataCell(Text(teams.elementAt(3).name, style: styles.elementAt(3))),
              DataCell(Center(child: Text(teams.elementAt(3).games, style: styles.elementAt(3)))),
              DataCell(Center(child: Text(teams.elementAt(3).points, style: styles.elementAt(3)))),
              DataCell(Center(child: Text(teams.elementAt(3).difference, style: styles.elementAt(3)))),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Center(child: Text(teams.elementAt(4).number, style: styles.elementAt(4)))),
              DataCell(Text(teams.elementAt(4).name, style: styles.elementAt(4))),
              DataCell(Center(child: Text(teams.elementAt(4).games, style: styles.elementAt(4)))),
              DataCell(Center(child: Text(teams.elementAt(4).points, style: styles.elementAt(4)))),
              DataCell(Center(child: Text(teams.elementAt(4).difference, style: styles.elementAt(4)))),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Center(child: Text(teams.elementAt(5).number, style: styles.elementAt(5)))),
              DataCell(Text(teams.elementAt(5).name, style: styles.elementAt(5))),
              DataCell(Center(child: Text(teams.elementAt(5).games, style: styles.elementAt(5)))),
              DataCell(Center(child: Text(teams.elementAt(5).points, style: styles.elementAt(5)))),
              DataCell(Center(child: Text(teams.elementAt(5).difference, style: styles.elementAt(5)))),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Center(child: Text(teams.elementAt(6).number, style: styles.elementAt(6)))),
              DataCell(Text(teams.elementAt(6).name, style: styles.elementAt(6))),
              DataCell(Center(child: Text(teams.elementAt(6).games, style: styles.elementAt(6)))),
              DataCell(Center(child: Text(teams.elementAt(6).points, style: styles.elementAt(6)))),
              DataCell(Center(child: Text(teams.elementAt(6).difference, style: styles.elementAt(6)))),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Center(child: Text(teams.elementAt(7).number, style: styles.elementAt(7)))),
              DataCell(Text(teams.elementAt(7).name, style: styles.elementAt(7))),
              DataCell(Center(child: Text(teams.elementAt(7).games, style: styles.elementAt(7)))),
              DataCell(Center(child: Text(teams.elementAt(7).points, style: styles.elementAt(7)))),
              DataCell(Center(child: Text(teams.elementAt(7).difference, style: styles.elementAt(7)))),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Center(child: Text(teams.elementAt(8).number, style: styles.elementAt(8)))),
              DataCell(Text(teams.elementAt(8).name, style: styles.elementAt(8))),
              DataCell(Center(child: Text(teams.elementAt(8).games, style: styles.elementAt(8)))),
              DataCell(Center(child: Text(teams.elementAt(8).points, style: styles.elementAt(8)))),
              DataCell(Center(child: Text(teams.elementAt(8).difference, style: styles.elementAt(8)))),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Center(child: Text(teams.elementAt(9).number, style: styles.elementAt(9)))),
              DataCell(Text(teams.elementAt(9).name, style: styles.elementAt(9))),
              DataCell(Center(child: Text(teams.elementAt(9).games, style: styles.elementAt(9)))),
              DataCell(Center(child: Text(teams.elementAt(9).points, style: styles.elementAt(9)))),
              DataCell(Center(child: Text(teams.elementAt(9).difference, style: styles.elementAt(9)))),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Center(child: Text(teams.elementAt(10).number, style: styles.elementAt(10)))),
              DataCell(Text(teams.elementAt(10).name, style: styles.elementAt(10))),
              DataCell(Center(child: Text(teams.elementAt(10).games, style: styles.elementAt(10)))),
              DataCell(Center(child: Text(teams.elementAt(10).points, style: styles.elementAt(10)))),
              DataCell(Center(child: Text(teams.elementAt(10).difference, style: styles.elementAt(10)))),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Center(child: Text(teams.elementAt(11).number, style: styles.elementAt(11)))),
              DataCell(Text(teams.elementAt(11).name, style: styles.elementAt(11))),
              DataCell(Center(child: Text(teams.elementAt(11).games, style: styles.elementAt(11)))),
              DataCell(Center(child: Text(teams.elementAt(11).points, style: styles.elementAt(11)))),
              DataCell(Center(child: Text(teams.elementAt(11).difference, style: styles.elementAt(11)))),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Center(child: Text(teams.elementAt(12).number, style: styles.elementAt(12)))),
              DataCell(Text(teams.elementAt(12).name, style: styles.elementAt(12))),
              DataCell(Center(child: Text(teams.elementAt(12).games, style: styles.elementAt(12)))),
              DataCell(Center(child: Text(teams.elementAt(12).points, style: styles.elementAt(12)))),
              DataCell(Center(child: Text(teams.elementAt(12).difference, style: styles.elementAt(12)))),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Center(child: Text(teams.elementAt(13).number, style: styles.elementAt(13)))),
              DataCell(Text(teams.elementAt(13).name, style: styles.elementAt(13))),
              DataCell(Center(child: Text(teams.elementAt(13).games, style: styles.elementAt(13)))),
              DataCell(Center(child: Text(teams.elementAt(13).points, style: styles.elementAt(13)))),
              DataCell(Center(child: Text(teams.elementAt(13).difference, style: styles.elementAt(13)))),
            ]),
          ],
          ),
        ),
      ),
    ),
  );
}
Widget homeArticle(String articleImage, String homeImage, String articleTitle, String articleSubTitle, String date, String firstTitle, String firstText, String secondTitle, String secondText, String endText1, String endText2, BuildContext context){
  return Container(
    child: InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ArticleScreen(articleImage, homeImage, articleTitle, articleSubTitle, date, firstTitle, firstText, secondTitle, secondText, endText1, endText2)));
      },
      child: Card(
        child: Column(
          children: <Widget>[
            Image.network(homeImage,
              fit: BoxFit.contain,),
            SizedBox(height: 15.0,),
            Align(alignment: Alignment.centerRight, child: Text(date + "   ", style: TextStyle(fontFamily: 'OpenSansHebrew', fontSize: 14, color: Colors.grey)),),
            SizedBox(height: 2,),
            Align(alignment: Alignment.centerRight,
              child: Text(articleTitle + "  ", style: TextStyle(
                  fontFamily: 'OpenSansHebrew',
                  color: Colors.black,
                  fontSize: 20.0),),
            ),
            SizedBox(height: 15.0,)
          ],
        ),
      ),
    ),
  );
}
Widget nextGameCardHelper(String competition,String title,String time,String homeTeamName,String homeTeamIcon,
    String awayTeamName,String awayTeamIcon, Color homeColor,Color awayColor, String address){
  Image homeTeamImage, awayTeamImage;
  if (homeTeamIcon.isEmpty){
    homeTeamImage = nameToImageNextGameCard(homeTeamName);
  } else {
    homeTeamImage = Image.network(homeTeamIcon);
  }
  if (awayTeamIcon.isEmpty){
    awayTeamImage = nameToImageNextGameCard(awayTeamName);
  } else {
    awayTeamImage = Image.network(awayTeamIcon);
  }
  return Card(
    child: Column(
      children: <Widget>[
        SizedBox(height: 10,),
        Center(child: Text(competition, style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 22.0),)),
        SizedBox(height: 4,),
        Center(child: Text(address, style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 18.0),)),
        SizedBox(height: 4,),
        Center(child: Text(title, style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 18.0),)),
        SizedBox(height: 4,),
        Center(child: Text(time, style: TextStyle(fontFamily: 'OpenSansHebrew',color: Colors.black38, fontSize: 18.0),)),
        SizedBox(height: 25.0,),
        Row(
          children: <Widget>[
            Expanded(child: Column(children: <Widget>[Container(child: awayTeamImage, width: 60, height: 60,), SizedBox(height: 4,), Text(awayTeamName, style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 16, color: awayColor))],)),
            Center(child: Text('-', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 30),)),
            Expanded(child: Column(children: <Widget>[Container(child: homeTeamImage, width: 60, height: 60,), Text(homeTeamName, style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 16, color: homeColor),)],)),
          ],
        ),
        SizedBox(height: 15,)
      ],
    ),
  );
}

Widget nextGameCardRidesBoardHelper(String address,String addressLink, String time,String homeTeamName,String homeTeamIcon,
    String awayTeamName,String awayTeamIcon, Color homeColor,Color awayColor){
  Image homeTeamImage, awayTeamImage;
  if (homeTeamIcon.isEmpty){
    homeTeamImage = nameToImageNextGameCard(homeTeamName);
  } else {
    homeTeamImage = Image.network(homeTeamIcon);
  }
  if (awayTeamIcon.isEmpty){
    awayTeamImage = nameToImageNextGameCard(awayTeamName);
  } else {
    awayTeamImage = Image.network(awayTeamIcon);
  }
  return Card(
    child: Column(
      children: <Widget>[
        SizedBox(height: 10,),
        Center(child: InkWell(child: Image.asset('assets/waze_icon.png', width: 60, height: 60), onTap: () => _launchURL(addressLink),),),
        SizedBox(height: 4,),
        Center(child: Text(address, style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 18.0),)),
        SizedBox(height: 4,),
        Center(child: Text(time, style: TextStyle(fontFamily: 'OpenSansHebrew',color: Colors.black38, fontSize: 18.0),)),
        SizedBox(height: 25.0,),
        Row(
          children: <Widget>[
            Expanded(child: Column(children: <Widget>[Container(child: awayTeamImage, width: 60, height: 60,), SizedBox(height: 4,), Text(awayTeamName, style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 16, color: awayColor))],)),
            Center(child: Text('-', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 30),)),
            Expanded(child: Column(children: <Widget>[Container(child: homeTeamImage, width: 60, height: 60,), Text(homeTeamName, style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 16, color: homeColor),)],)),
          ],
        ),
        SizedBox(height: 15,)
      ],
    ),
  );
}

Image nameToImageNextGameCard(String teamName) {
  if (teamName == 'הפועל עפולה')
    return Image.asset('assets/teams/afula.png');
  else if (teamName == 'אליצור אשקלון')
    return Image.asset('assets/teams/ashkelon.png');
  else if (teamName == 'עירוני קריית אתא')
    return Image.asset('assets/teams/ata.png');
  else if (teamName == 'גליל עליון')
    return Image.asset('assets/teams/galil.png');
  else if (teamName == 'הפועל חיפה')
    return Image.asset('assets/teams/haifa.png');
  else if (teamName == 'בני הרצליה')
    return Image.asset('assets/teams/herzliya.png');
  else if (teamName == 'הוד השרון')
    return Image.asset('assets/teams/hodhasharon.png');
  else if (teamName == 'חבל מודיעין')
    return Image.asset('assets/teams/modiin.png');
  else if (teamName == 'קריית מוצקין')
    return Image.asset('assets/teams/motzkin.png');
  else if (teamName == 'אליצור נתניה')
    return Image.asset('assets/teams/netanya.png');
  else if (teamName == 'עירוני רעננה')
    return Image.asset('assets/teams/raanana.png');
  else if (teamName == 'רמת השרון')
    return Image.asset('assets/teams/ramathasharon.png');
  else if (teamName == 'אליצור יבנה')
    return Image.asset('assets/teams/yavne.png');
  else if (teamName == 'הפועל רמת גן גבעתיים')
    return Image.asset('assets/teams/ramatgg.jpeg');
  else if (teamName == 'הפועל רמת גן')
    return Image.asset('assets/teams/ramatgg.jpeg');
}

Widget gamesThatWereTable(List<Game> gamesThatWere) {
  List<Map<String, String>> listOfColumns = new List();
  for (int i = 0; i < gamesThatWere.length; i++) {
    Map<String, String> map = {'homeTeamName': gamesThatWere.elementAt(i).homeTeamName, 'homeIcon': gamesThatWere
        .elementAt(i)
        .homeIcon, 'awayTeamName': gamesThatWere.elementAt(i).awayTeamName, 'awayIcon': gamesThatWere
        .elementAt(i)
        .awayIcon,
      'date': gamesThatWere.elementAt(i).date.day.toString() + "." +
          gamesThatWere.elementAt(i).date.month.toString() + "." +
          gamesThatWere.elementAt(i).date.year.toString().substring(2), 'result': gamesThatWere
          .elementAt(i)
          .result, 'title': gamesThatWere
          .elementAt(i)
          .title};
    listOfColumns.add(map);
  }
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Card(
      child: DataTable(
        columnSpacing: 15, dataRowHeight: 70,
        columns: <DataColumn>[
          DataColumn(label: Text('    תאריך',
              style: TextStyle(fontFamily: 'OpenSansHebrew',color: Colors.black38, fontSize: 14.0))),
          DataColumn(label: Text('    מסגרת',
              style: TextStyle(fontFamily: 'OpenSansHebrew',color: Colors.black38, fontSize: 14.0))),
          DataColumn(label: Text('    משחק    ',
              style: TextStyle(fontFamily: 'OpenSansHebrew',color: Colors.black38, fontSize: 14.0))),
          DataColumn(label: Text('    תוצאה',
              style: TextStyle(fontFamily: 'OpenSansHebrew',color: Colors.black38, fontSize: 14.0))),
        ],
        rows: listOfColumns.map((element) {
          Image homeImage, awayImage;
          if (element['homeIcon'].isEmpty)
            homeImage = nameToImageNextGameCard(element['homeTeamName']);
          else
            homeImage = Image.network(element['homeIcon']);
          if (element['awayIcon'].isEmpty)
            awayImage = nameToImageNextGameCard(element['awayTeamName']);
          else
            awayImage = Image.network(element['awayIcon']);
          return DataRow(
            cells: <DataCell>[
              DataCell(Center(child: Text(element['date'], style: TextStyle(fontFamily: 'OpenSansHebrew',color: Colors.black38, fontSize: 18.0)))),
              //Extracting from Map element the value
              DataCell(Center(child: Text(element['title'], style: TextStyle(fontFamily: 'OpenSansHebrew',color: Colors.black38, fontSize: 18.0)))),
              DataCell(Align(
                alignment: Alignment.center,
                child: Row(
                  children: <Widget>[
                    Container(child: homeImage, width: 40, height: 40,),
                    SizedBox(width: 2,),
                    Align(alignment: Alignment.center, child: Text('-',
                      style: TextStyle(
                          fontFamily: 'OpenSansHebrew', fontSize: 30),)),
                    SizedBox(width: 2,),
                    Container(child: awayImage, width: 40, height: 40,),
                  ],
                ),
              )),
              DataCell(Center(child: Text(element['result'], style: TextStyle(fontFamily: 'OpenSansHebrew',color: Colors.black38, fontSize: 18.0)))),
            ],
          );
        }).toList(),
      ),
    ),
  );
}

Widget gamesToBeTable(List<Game> gamesToBe) {
  List<Map<String, String>> listOfColumns = new List();
  for (int i = 0; i < gamesToBe.length; i++) {
    Map<String, String> map = {'homeTeamName': gamesToBe.elementAt(i).homeTeamName, 'homeIcon': gamesToBe
        .elementAt(i)
        .homeIcon, 'awayTeamName': gamesToBe.elementAt(i).awayTeamName, 'awayIcon': gamesToBe
        .elementAt(i)
        .awayIcon,
      'date': gamesToBe.elementAt(i).date.day.toString() + "." +
          gamesToBe.elementAt(i).date.month.toString() + "." +
          gamesToBe.elementAt(i).date.year.toString().substring(2), 'title': gamesToBe
          .elementAt(i)
          .title};
    listOfColumns.add(map);
  }
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Card(
      child: DataTable(
        columnSpacing: 15, dataRowHeight: 70,
        columns: <DataColumn>[
          DataColumn(label: Text('            תאריך',
              style: TextStyle(fontFamily: 'OpenSansHebrew',color: Colors.black38, fontSize: 14.0))),
          DataColumn(label: Text('       מסגרת',
              style: TextStyle(fontFamily: 'OpenSansHebrew',color: Colors.black38, fontSize: 14.0))),
          DataColumn(label: Text('              משחק',
              style: TextStyle(fontFamily: 'OpenSansHebrew',color: Colors.black38, fontSize: 14.0))),
        ],
        rows: listOfColumns.map((element) {
          Image homeImage, awayImage;
          if (element['homeIcon'].isEmpty)
            homeImage = nameToImageNextGameCard(element['homeTeamName']);
          else
            homeImage = Image.network(element['homeIcon']);
          if (element['awayIcon'].isEmpty)
            awayImage = nameToImageNextGameCard(element['awayTeamName']);
          else
            awayImage = Image.network(element['awayIcon']);
          return DataRow(
            cells: <DataCell>[
              DataCell(Center(child: Text(element['date'], style: TextStyle(fontFamily: 'OpenSansHebrew',color: Colors.black38, fontSize: 18.0)))),
              //Extracting from Map element the value
              DataCell(Center(child: Text(element['title'], style: TextStyle(fontFamily: 'OpenSansHebrew',color: Colors.black38, fontSize: 18.0)))),
              DataCell(Align(
                alignment: Alignment.center,
                child: Row(
                  children: <Widget>[
                    Container(child: homeImage, width: 40, height: 40,), SizedBox(width: 2,),
                    Align(alignment: Alignment.center,child: Text('-', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 30),)), SizedBox(width: 2,),
                    Container(child: awayImage, width: 40, height: 40,),
                  ],
                ),
              )),
            ],
          );
        }).toList()
      ),
    ),
  );
}

Widget pieChart(int firstValue, String firstName, int secondValue, String secondName, String id) {
  List<Task> piedata = new List();
  piedata.add(new Task(firstName, firstValue, Colors.red[900]));
  piedata.add(new Task(secondName, secondValue, Colors.grey[700]));

  List<charts.Series<Task, String>> _seriesPieData = List<charts.Series<Task, String>>();
  _seriesPieData.add(
    charts.Series(
      domainFn: (Task task, _) => task.task,
      measureFn: (Task task, _) => task.taskvalue,
      colorFn: (Task task, _) =>
          charts.ColorUtil.fromDartColor(task.colorval),
      id: id,
      data: piedata,
      labelAccessorFn: (Task row, _) => '${row.taskvalue}',
    ),
  );
  return Directionality(
    textDirection: TextDirection.rtl,
    child: new charts.PieChart(
        _seriesPieData,
        animate: true,
        animationDuration: Duration(seconds: 2),
        behaviors: [
          new charts.DatumLegend(
            outsideJustification: charts.OutsideJustification.endDrawArea,
            horizontalFirst: false,
            desiredMaxRows: 2,
            cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
            entryTextStyle: charts.TextStyleSpec(
                color: charts.MaterialPalette.black,
                fontFamily: 'OpenSansHebrewBold',
                fontSize: 11),
          )
        ],
        defaultRenderer: new charts.ArcRendererConfig(
            arcWidth: 100,
            arcRendererDecorators: [
              new charts.ArcLabelDecorator(
                  labelPosition: charts.ArcLabelPosition.inside)
            ])),
  );
}

Widget pointLineChart(List<int> positions, String id) {
  List<Task2> piedata = new List();
  piedata.add(new Task2(0, 0));
  int i = 1;
  for (var pos in positions){
    piedata.add(new Task2(i, pos));
    i++;
  }

  List<charts.Series<Task2, int>> _seriesPieData = List<charts.Series<Task2, int>>();
  _seriesPieData.add(
    charts.Series(
      colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.red[900]),
      domainFn: (Task2 task, _) => task.time,
      measureFn: (Task2 task, _) => task.taskvalue,
      id: id,
      data: piedata.sublist(1),
    ),
  );
  return new charts.LineChart(
      _seriesPieData,
      primaryMeasureAxis: new charts.NumericAxisSpec(
        tickProviderSpec: new charts.StaticNumericTickProviderSpec(
          <charts.TickSpec<num>>[
            charts.TickSpec<num>(0),
            charts.TickSpec<num>(4),
            charts.TickSpec<num>(8),
            charts.TickSpec<num>(8),
            charts.TickSpec<num>(14),
          ],
        ),
      ),
      flipVerticalAxis: true,
      animate: true,
      animationDuration: Duration(seconds: 2),
      defaultRenderer: new charts.LineRendererConfig(
        includePoints: true,));
}

class Task {
  String task;
  int taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}

class Task2 {
  int time;
  int taskvalue;

  Task2(this.time, this.taskvalue);
}

Widget ridesBoardList(List<Ride> rides, BuildContext context) {
  AuthService authService = AuthService();
  String uid;
  authService.currentUser().then((result) {
    uid = result.uid;
  });
  List<Map<String, String>> listOfColumns = new List();
  for (int i = 0; i < rides.length; i++) {
    Map<String, String> map = {'name': rides.elementAt(i).name, 'numberOfPeople' : rides.elementAt(i).numberOfPeople, 'phoneNumber': rides.elementAt(i).phoneNumber,
      'uid': rides.elementAt(i).uid, 'looking' : rides.elementAt(i).looking, 'returnAlso': rides.elementAt(i).returnAlsoInt, 'address' : rides.elementAt(i).address};
    listOfColumns.add(map);
  }
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Card(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: listOfColumns.map((element) {
            return InkWell(
              onTap: () {
                if (element['uid'] == uid){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DeleteRideBaseAlertDialog(title: '', content: 'האם ברצונך למחוק את המודעה?', no: 'לא', yes: 'כן', uid: uid,)));
                }
              },
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[ SizedBox(height: 15,),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(element['looking'] == 'false' ? element['name'] +
                              ' מציע טרמפ, ' + (element['returnAlso'] == '1' ? 'הלוך וחזור!' : (element['returnAlso'] == '2' ? 'הלוך!' : 'חזור!')) : element['name'] + ' מחפש טרמפ, ' + (element['returnAlso'] == '1' ? 'הלוך וחזור!' : (element['returnAlso'] == '2' ? 'הלוך!' : 'חזור!')),
                              style: TextStyle(
                                  fontFamily: 'OpenSansHebrew',
                                  color: Colors.black38,
                                  fontSize: 18.0)),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text((element['looking'] == 'false' ? 'הטרמפ יוצא מ' + element['address'] : element['name'] + ' צריך טרמפ מ'+ element['address']),
                              style: TextStyle(
                                  fontFamily: 'OpenSansHebrew',
                                  color: Colors.black38,
                                  fontSize: 18.0)),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(element['looking'] == 'false' ? 'מספר מקומות פנויים: ' + element['numberOfPeople'] : 'מספר מקומות רצוי: ' + element['numberOfPeople'],
                              style: TextStyle(
                                  fontFamily: 'OpenSansHebrew',
                                  color: Colors.black38,
                                  fontSize: 18.0)),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text('מספר טלפון: ' + element['phoneNumber'], style: TextStyle(
                              fontFamily: 'OpenSansHebrew',
                              color: Colors.black38,
                              fontSize: 18.0)),
                        ), SizedBox(height: 15,), Divider()
                      ],
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    ),
  );
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}