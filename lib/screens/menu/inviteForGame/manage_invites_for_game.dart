import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:urdunbasket/screens/menu/drawer.dart';
import 'package:urdunbasket/screens/menu/inviteForGame/display_invites_for_game.dart';
import 'package:urdunbasket/services/auth.dart';
import 'package:urdunbasket/services/database.dart';
import 'package:urdunbasket/shared/constants_and_widgets.dart';
import 'package:urdunbasket/shared/delete_invitations_base_alert_dialog.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';



class ManageInvitesForGame extends StatefulWidget {
  @override
  _ManageInvitesForGameState createState() => _ManageInvitesForGameState();
}

class _ManageInvitesForGameState extends State<ManageInvitesForGame> {

  String email = '';
  String text = '';
  final DatabaseService databaseService = DatabaseService();
  List<String> emails = new List();

  @override
  Widget build(BuildContext context) {
    databaseService.updateUid();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        actions: <Widget>[
        ],
      ),
      endDrawer: AppDrawer(),
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
            Align(alignment: Alignment.centerRight,
                child: Text('ניהול הזמנות למשחקים  ', style: TextStyle(
                    fontFamily: 'OpenSansHebrewBold',
                    fontSize: 38,
                    color: Colors.red[900]))), SizedBox(height: 30,),
            RaisedButton(
              color: Colors.grey[600],
              child: Text('הצגת ההזמנות במייל', style: TextStyle(fontFamily: 'OpenSansHebrew', color: Colors.white),),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => DisplayInvitesForGame()));
              },
            ), SizedBox(height: 20,),
            RaisedButton(
              color: Colors.grey[600],
              child: Text('מחיקת ההזמנות', style: TextStyle(fontFamily: 'OpenSansHebrew', color: Colors.white),),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => DeleteInvitationsBaseAlertDialog(yes: 'כן', no: 'לא', title: '', content: 'האם אתה בטוח שברצונך למחוק את ההזמנות למשחקים?' ,)));
              },
            ),
          ],
        ),
      ),
    );
  }
}
