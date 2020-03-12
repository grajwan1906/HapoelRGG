import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:urdunbasket/screens/home/home.dart';
import 'package:urdunbasket/screens/menu/about.dart';
import 'package:urdunbasket/screens/menu/club_holders.dart';
import 'package:urdunbasket/screens/menu/contact.dart';
import 'package:urdunbasket/screens/menu/games_table.dart';
import 'package:urdunbasket/screens/menu/history/history.dart';
import 'package:urdunbasket/screens/menu/history/season_by_season.dart';
import 'package:urdunbasket/screens/menu/history/the60s.dart';
import 'package:urdunbasket/screens/menu/history/the70s.dart';
import 'package:urdunbasket/screens/menu/history/the80s.dart';
import 'package:urdunbasket/screens/menu/inviteForGame/invite_for_game.dart';
import 'package:urdunbasket/screens/menu/partners.dart';
import 'package:urdunbasket/screens/menu/ridesBoard/rides_board.dart';
import 'package:urdunbasket/screens/menu/squad/squad.dart';
import 'package:urdunbasket/services/auth.dart';
import 'package:urdunbasket/shared/sign_out_base_alert_dialog.dart';
import 'package:urdunbasket/shared/store_base_alert_dialog.dart';
import 'package:url_launcher/url_launcher.dart';
import 'inviteForGame/manage_invites_for_game.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {

  BuildContext context;
  int type = 0;

  String uid;
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    this.context = context;
    _auth.currentUser().then((result) {
      setState(() {
        uid = result.uid;
      });
    });

    Widget drawer = Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0.0),
        children: <Widget>[
          InkWell(
            onTap: () {
              while (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home(false)));
            },
            child: DrawerHeader(
              child: Image.asset(
                'assets/menu_icon.png', width: 80, height: 80,),
              decoration: BoxDecoration(color: Colors.red[900]),
              padding: EdgeInsets.symmetric(vertical: 23),
            ),
          ),
          /*
          ListTile(
            title: Align(
                alignment: Alignment.centerRight, child: Text("דף הבית")),
            trailing: Icon(Icons.home),
            onTap: () {
              while (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
          */
          ListTile(
            title: Align(
                alignment: Alignment.centerRight, child: Text("נתונים מהפרקט")),
            trailing: Icon(Icons.assessment),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GamesTable()));
            },
          ),
          ListTile(
            title: Align(
                alignment: Alignment.centerRight, child: Text("סגל הקבוצה")),
            trailing: Icon(Icons.people),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Squad()));
            },
          ),
          ListTile(
            title: Align(
                alignment: Alignment.centerRight, child: Text("לוח טרמפים")),
            trailing: Icon(Icons.directions_car),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RidesBoard()));
            },
          ),
          PopupMenuButton<String>(
            onSelected: historyAction,
            child: ListTile(
              title: Align(
                  alignment: Alignment.centerRight, child: Text("היסטוריה")),
              trailing: Icon(Icons.import_contacts),
            ),
            itemBuilder: (BuildContext context) =>
            <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'עונה אחר עונה',
                child: Align(alignment: Alignment.centerRight,
                    child: Text('עונה אחר עונה')),
              ),
              const PopupMenuItem<String>(
                value: 'היסטוריה',
                child: Align(alignment: Alignment.centerRight,
                    child: Text('מורשת המועדון')),
              ),
              const PopupMenuItem<String>(
                value: '60',
                child: Align(
                    alignment: Alignment.centerRight, child: Text('שנות ה-60')),
              ),
              const PopupMenuItem<String>(
                value: '70',
                child: Align(
                    alignment: Alignment.centerRight, child: Text('שנות ה-70')),
              ),
              const PopupMenuItem<String>(
                value: '80',
                child: Align(
                    alignment: Alignment.centerRight, child: Text('שנות ה-80')),
              ),
            ],
          ),
          PopupMenuButton<String>(
            onSelected: aboutAction,
            child: ListTile(
              title: Align(
                  alignment: Alignment.centerRight, child: Text("אודות")),
              trailing: Icon(Icons.info_outline),
            ),
            itemBuilder: (BuildContext context) =>
            <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'מי אנחנו',
                child: Align(
                    alignment: Alignment.centerRight, child: Text('מי אנחנו')),
              ),
              const PopupMenuItem<String>(
                value: 'בעלי תפקידים במועדון',
                child: Align(alignment: Alignment.centerRight,
                    child: Text('בעלי תפקידים במועדון')),
              ),
            ],
          ),
          ListTile(
            title: Align(
                alignment: Alignment.centerRight, child: Text("חנות")),
            trailing: Icon(Icons.store),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  StoreBaseAlertDialog(title: '',
                      content: 'כניסה אל החנות תצא מהאפליקציה.\nהאם ברצונך לצאת?',
                      no: 'לא',
                      yes: 'כן')));
            },
          ),
          ListTile(
            title: Align(
                alignment: Alignment.centerRight, child: Text("צור קשר")),
            trailing: Icon(Icons.call),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Contact()));
            },
          ),
          /*(type == 1) ? ListTile(
            title: Align(
                alignment: Alignment.centerRight, child: Text("הזמנה למשחקים")),
            trailing: Icon(Icons.format_list_bulleted),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => InviteForGame()));
            },
          ) : Container(),
          (type == 2) ? ListTile(
            title: Align(
                alignment: Alignment.centerRight, child: Text("ניהול הזמנות למשחקים")),
            trailing: Icon(Icons.format_list_bulleted),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ManageInvitesForGame()));
            },
          ) : Container(),*/
          /*ListTile(
            title: Align(
                alignment: Alignment.centerRight, child: Text("שותפים לדרך")),
            trailing: Image.asset('assets/hand.png', width: 23, height: 23,),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Partners()));
            },
          ),*/
          ListTile(
            title: Align(
                alignment: Alignment.centerRight, child: Text("התנתק")),
            trailing: Icon(Icons.person),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  SignOutBaseAlertDialog(title: '',
                      content: 'האם ברצונך להתנתק?',
                      no: 'לא',
                      yes: 'כן')));
            },
          ),
        ],
      ),
    );

    return StreamBuilder(
      stream: Firestore.instance.collection('users').document(uid).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var userDocument = snapshot.data;
          type = userDocument['type'];
          return drawer;
        } else {
          return Container();
        }
      },
    );
  }

  void historyAction(String choice) {
    if (choice == 'עונה אחר עונה')
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SeasonBySeason()));
    else if (choice == 'היסטוריה')
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => History()));
    else if (choice == '60')
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => The60s()));
    else if (choice == '70')
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => The70s()));
    else if (choice == '80')
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => The80s()));
  }

  void aboutAction(String choice) {
    if (choice == 'מי אנחנו')
      Navigator.push(context, MaterialPageRoute(builder: (context) => About()));
    else if (choice == 'בעלי תפקידים במועדון')
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ClubHolders()));
  }
}