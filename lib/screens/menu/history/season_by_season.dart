import 'package:flutter/material.dart';
import 'package:urdunbasket/shared/custom_app_bar.dart' as prefix0;
import 'package:webview_flutter/webview_flutter.dart';

import '../drawer.dart';

class SeasonBySeason extends StatefulWidget {
  @override
  _SeasonBySeasonState createState() => _SeasonBySeasonState();
}

class _SeasonBySeasonState extends State<SeasonBySeason> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: prefix0.appBar(),
      endDrawer: AppDrawer(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/home_background.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),
              Container(
                child: Image.asset('assets/season_by_season.jpeg',
                  fit: BoxFit.contain, alignment: Alignment.bottomLeft,),
              ),
              SizedBox(height: 20,),
              Align(alignment: Alignment.centerRight,child: Text('גרף התקדמות  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold',fontSize: 38, color: Colors.red[900]))), SizedBox(height: 30,),
              Card(child: Image.asset('assets/season_by_season.jpg')),
              SizedBox(height: 20,),
              Align(alignment: Alignment.centerRight,child: Text('עונה אחר עונה  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold',fontSize: 38, color: Colors.red[900]))), SizedBox(height: 30,),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Card(
                  child: DataTable(
                    columnSpacing: 1, dataRowHeight: 70,
                    columns: <DataColumn>[
                      DataColumn(label: Text('עונה',
                          style: TextStyle(
                              fontFamily: 'OpenSansHebrew'))),
                      DataColumn(label: Text('        ליגה',
                          style: TextStyle(
                              fontFamily: 'OpenSansHebrew'))),
                      DataColumn(label: Text('  מיקום',
                          style: TextStyle(
                              fontFamily: 'OpenSansHebrew'))),
                      DataColumn(label: Text('                     הישגים',
                          style: TextStyle(
                              fontFamily: 'OpenSansHebrew'))),
                    ], rows: <DataRow>[
                    DataRow(cells: <DataCell>[
                      DataCell(Center(child: Text('11/12   ', style: TextStyle(fontFamily: 'OpenSansHebrew', color: Colors.black)))),
                      DataCell(Text('ליגה ב מחוז תל אביב', style: TextStyle(fontFamily: 'OpenSansHebrew', color: Colors.black))),
                      DataCell(Center(child: Text('2', style: TextStyle(fontFamily: 'OpenSansHebrew', color: Colors.black)))),
                      DataCell(Text('העפלה לליגה א', style: TextStyle(fontFamily: 'OpenSansHebrewBold', color: Colors.red[900]))),
                    ]),
                    DataRow(cells: <DataCell>[
                      DataCell(Center(child: Text('12/13   ', style: TextStyle(fontFamily: 'OpenSansHebrew', color: Colors.black)))),
                      DataCell(Text('ליגה א מחוז שרון', style: TextStyle(fontFamily: 'OpenSansHebrew', color: Colors.black))),
                      DataCell(Center(child: Text('2', style: TextStyle(fontFamily: 'OpenSansHebrew', color: Colors.black)))),
                      DataCell(Text('העפלה לליגה ארצית', style: TextStyle(fontFamily: 'OpenSansHebrewBold', color: Colors.red[900]))),
                    ]),
                    DataRow(cells: <DataCell>[
                      DataCell(Center(child: Text('13/14   ', style: TextStyle(fontFamily: 'OpenSansHebrew', color: Colors.black)))),
                      DataCell(Text('ליגה ארצית מחוז צפון', style: TextStyle(fontFamily: 'OpenSansHebrew', color: Colors.black))),
                      DataCell(Center(child: Text('2', style: TextStyle(fontFamily: 'OpenSansHebrew', color: Colors.black)))),
                      DataCell(Center(child: Text('', style: TextStyle(fontFamily: 'OpenSansHebrewBold', color: Colors.red[900])))),
                    ]),
                    DataRow(cells: <DataCell>[
                      DataCell(Center(child: Text('14/15   ', style: TextStyle(fontFamily: 'OpenSansHebrew', color: Colors.black)))),
                      DataCell(Text('ליגה ארצית מחוז צפון', style: TextStyle(fontFamily: 'OpenSansHebrew', color: Colors.black))),
                      DataCell(Center(child: Text('1', style: TextStyle(fontFamily: 'OpenSansHebrew', color: Colors.black)))),
                      DataCell(Text('אליפות והעפלה לליגה לאומית', style: TextStyle(fontFamily: 'OpenSansHebrewBold', color: Colors.red[900]))),
                    ]),
                    DataRow(cells: <DataCell>[
                      DataCell(Center(child: Text('15/16   ', style: TextStyle(fontFamily: 'OpenSansHebrew', color: Colors.black)))),
                      DataCell(Text('ליגה לאומית', style: TextStyle(fontFamily: 'OpenSansHebrew', color: Colors.black))),
                      DataCell(Center(child: Text('11', style: TextStyle(fontFamily: 'OpenSansHebrew', color: Colors.black)))),
                      DataCell(Text('רבע גמר גביע המדינה', style: TextStyle(fontFamily: 'OpenSansHebrewBold', color: Colors.red[900]))),
                    ]),
                    DataRow(cells: <DataCell>[
                      DataCell(Center(child: Text('16/17   ', style: TextStyle(fontFamily: 'OpenSansHebrew', color: Colors.black)))),
                      DataCell(Text('ליגה לאומית', style: TextStyle(fontFamily: 'OpenSansHebrew', color: Colors.black))),
                      DataCell(Center(child: Text('5', style: TextStyle(fontFamily: 'OpenSansHebrew', color: Colors.black)))),
                      DataCell(Text('רבע גמר גביע המדינה', style: TextStyle(fontFamily: 'OpenSansHebrewBold', color: Colors.red[900]))),
                    ]),
                    DataRow(cells: <DataCell>[
                      DataCell(Center(child: Text('17/18   ', style: TextStyle(fontFamily: 'OpenSansHebrew', color: Colors.black)))),
                      DataCell(Text('ליגה לאומית', style: TextStyle(fontFamily: 'OpenSansHebrew', color: Colors.black))),
                      DataCell(Center(child: Text('7', style: TextStyle(fontFamily: 'OpenSansHebrew', color: Colors.black)))),
                      DataCell(Text('חצי גמר בליגה הלאומית', style: TextStyle(fontFamily: 'OpenSansHebrewBold', color: Colors.red[900]))),
                    ]),
                    DataRow(cells: <DataCell>[
                      DataCell(Center(child: Text('18/19   ', style: TextStyle(fontFamily: 'OpenSansHebrew', color: Colors.black)))),
                      DataCell(Text('ליגה לאומית', style: TextStyle(fontFamily: 'OpenSansHebrew', color: Colors.black))),
                      DataCell(Center(child: Text('12', style: TextStyle(fontFamily: 'OpenSansHebrew', color: Colors.black)))),
                      DataCell(Center(child: Text('', style: TextStyle(fontFamily: 'OpenSansHebrewBold', color: Colors.red[900])))),
                    ]),
                  ],
                  ),
                ),
              ),
              SizedBox(height: 40.0,),
            ],
          ),
        ),
      ),
    );
  }
}
