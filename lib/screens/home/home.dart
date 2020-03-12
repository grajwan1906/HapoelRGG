import 'package:flutter/material.dart';
import 'package:urdunbasket/screens/authenticate/sign_in.dart';
import 'package:urdunbasket/screens/full_table.dart';
import 'package:urdunbasket/screens/home/article_manager.dart';
import 'package:urdunbasket/screens/home/home_table.dart';
import 'package:urdunbasket/screens/menu/squad/squad.dart';
import 'package:urdunbasket/services/auth.dart';
import 'package:urdunbasket/shared/constants_and_widgets.dart';
import 'package:urdunbasket/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:urdunbasket/screens/menu/drawer.dart';
import 'package:urdunbasket/shared/custom_app_bar.dart' as prefix0;
import 'package:urdunbasket/shared/exit_base_alert_dialog.dart';
import 'package:urdunbasket/shared/loading.dart';
import 'package:async/async.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:urdunbasket/shared/custom_app_bar.dart';


import 'next_game_card.dart';


class Home extends StatefulWidget {
  bool loading;
  Home(bool loading){
    this.loading = loading;
  }
  @override
  _HomeState createState() => _HomeState(loading);
}

class _HomeState extends State<Home> {


  final AuthService _auth = AuthService();
  bool loading;

  _HomeState(bool loading){
    this.loading = loading;
  }

  void setHomeScreen(){
    setState(() {
      loading = false;
    });
  }

  FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) {
        print(message);
      },
      onResume: (Map<String, dynamic> message) {
        print(message);
      },
      onLaunch: (Map<String, dynamic> message) {
        print(message);
      },
    );
    _firebaseMessaging.getToken().then((token) {
      print('token: ' + token);
    });
  }

  Future<bool> _willPopCallback() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) =>
        ExitBaseAlertDialog(title: '',
            content: 'האם ברצונך לצאת?',
            no: 'לא',
            yes: 'כן')));
    return false; // return true if the route to be popped
  }
  
  @override
  Widget build(BuildContext context) {


    Scaffold s = new Scaffold(
      appBar: prefix0.appBar(),
      endDrawer: AppDrawer(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/home_background.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: SingleChildScrollView(

          child: Column(
            children: <Widget>[
              ArticleManager(),
              //StreamProvider<QuerySnapshot>.value(value: DatabaseService().article, child: ArticleManager()),
              SizedBox(height: 25,),
              Align(alignment: Alignment.centerRight,child: Text('המשחק הבא  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold', fontSize: 38, color: Colors.red[900]))), SizedBox(height: 10,),
              NextGameCard(), SizedBox(height: 20,),
              Column(
                children: <Widget>[
                  Align(alignment: Alignment.centerRight,child: Text('טבלת הליגה  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold',fontSize: 38, color: Colors.red[900]))), SizedBox(height: 10,),
                  SizedBox(height: 5,), Align(
                    alignment: Alignment.centerRight,
                    child: Text('לטבלה המלאה לחץ על הטבלה  ', style: TextStyle(
                        fontFamily: 'OpenSansHebrew',
                        fontSize: 14,
                        color: Colors.black)),
                  ),
                  HomeTable(), SizedBox(height: 40,),
                ],
              ),
              Align(alignment: Alignment.centerRight,child: Text('האימפריה במדיה  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold',fontSize: 38, color: Colors.red[900]))), SizedBox(height: 30,),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(child: Image.asset('assets/facebook_icon.png', width: 60, height: 60), onTap: () => _launchURL('https://facebook.com/hrgg2011'),), SizedBox(width: 50,),
                    InkWell(child: Image.asset('assets/instagram_icon.png', width: 60, height: 60), onTap: () => _launchURL('https://instagram.com/urdungram?igshid=1esh33l24a4vr'),), SizedBox(width: 50,),
                    InkWell(child: Image.asset('assets/youtube_icon.png', width: 60, height: 60), onTap: () => _launchURL('https://www.youtube.com/channel/UCsH9FDq2jsjHEdoiBVcQJ_Q'),),
                  ],
                ),
              ), SizedBox(height: 50,),
              Align(alignment: Alignment.centerRight,child: Text('שותפים לדרך  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold',fontSize: 38, color: Colors.red[900]))), SizedBox(height: 10,),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Image.asset('assets/partners/logo1.png'),
                  ),
                  Expanded(
                    child: Image.asset('assets/partners/logo2.png'),
                  ),
                  Expanded(
                    child: Image.asset('assets/partners/logo3.png'),
                  ),
                  Expanded(
                    child: Image.asset('assets/partners/logo4.png'),
                  )
                ],
              ), SizedBox(height: 50,),
              Text('כל הזכויות שמורות למועדון כדורסל הפועל רמת גן', style: TextStyle(
                  fontFamily: 'OpenSansHebrew',
                  fontSize: 14,
                  color: Colors.black))
            ],
          ),
        ),
      ),
    );

    Duration _timerDuration = new Duration(seconds: 3);
    RestartableTimer _timer = new RestartableTimer(_timerDuration, setHomeScreen);
    return WillPopScope(child: loading ? Loading() : s, onWillPop: _willPopCallback,);
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}