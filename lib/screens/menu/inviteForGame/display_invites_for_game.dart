import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:urdunbasket/screens/menu/drawer.dart';
import 'package:urdunbasket/services/auth.dart';
import 'package:urdunbasket/services/database.dart';
import 'package:urdunbasket/shared/constants_and_widgets.dart';
import 'package:url_launcher/url_launcher.dart';


class DisplayInvitesForGame extends StatefulWidget {
  @override
  _DisplayInvitesForGameState createState() => _DisplayInvitesForGameState();
}

class _DisplayInvitesForGameState extends State<DisplayInvitesForGame> {

  final _formKey = GlobalKey<FormState>();
  String email = '';
  String text = '';
  String phoneNumber = '';
  final DatabaseService databaseService = DatabaseService();
  List<String> emails = new List();

  @override
  Widget build(BuildContext context) {
    databaseService.updateUid();

    return StreamBuilder(
      stream: Firestore.instance.collection(
          'invitationGame').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          for (var doc in snapshot.data.documents) {
            if (!searchFor(doc['email'], emails)){
              text += 'שם: ' + doc['name'] + '\n';
              text += 'אימייל: ' + doc['email'] + '\n';
              text += 'מס\' ילדים: ' + doc['numberOfChildren'] + '\n';
              text += 'מס\' טלפון: ' + doc['phoneNumber'] + '\n';
              text += 'שם בית ספר: ' + doc['school'] + '\n';
              text += '********************\n';

              emails.add(doc['email']);
            }
          }
        } else {
          print('no Data');
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red[900],
            actions: <Widget>[
            ],
          ),
          endDrawer: AppDrawer(),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/home_background.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                Align(alignment: Alignment.centerRight,child: Text('ניהול הזמנות למשחקים  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold',fontSize: 38, color: Colors.red[900]))), SizedBox(height: 30,),
                Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextFormField(
                              decoration: textInputDecoration.copyWith(hintText: 'הכנס אימייל', focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey[600])
                              ), enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey[600])
                              )),
                              style: TextStyle(fontFamily: 'OpenSansHebrew'),
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                            )
                        ), SizedBox(height: 20.0,),
                        Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextFormField(
                              decoration: textInputDecoration.copyWith(hintText: 'הכנס מספר טלפון', focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey[600])
                              ), enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey[600])
                              )),
                              style: TextStyle(fontFamily: 'OpenSansHebrew'),
                              keyboardType: TextInputType.number,
                              onChanged: (val) {
                                setState(() => phoneNumber = val);
                              },
                            )
                        ), SizedBox(height: 20.0,),
                        RaisedButton(
                          color: Colors.grey[600],
                          child: Text('שלח', style: TextStyle(fontFamily: 'OpenSansHebrew', color: Colors.white),),
                          onPressed: () async {
                            if (text.length == 0){
                              if (phoneNumber.length == 10 && email.length == 0)
                                FlutterOpenWhatsapp.sendSingleMessage('+972' + phoneNumber.substring(1), 'לא נמצאו הזמנות במאגר');
                              else if (phoneNumber.length == 0 && email.length > 0)
                                _launchURL(email, 'ההזמנות למשחקים', 'לא נמצאו הזמנות במאגר');
                              else {
                                Fluttertoast.showToast(
                                    msg: "אנא מלא רק את אחד מהפרטים ובצורה תקינה",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIos: 1,
                                    backgroundColor: Colors.red[900],
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              }
                            } else {
                              if (phoneNumber.length == 10 && email.length == 0)
                                FlutterOpenWhatsapp.sendSingleMessage('+972' + phoneNumber.substring(1), text);
                              else if (phoneNumber.length == 0 && email.length > 0)
                                _launchURL(email, 'ההזמנות למשחקים', text);
                              else {
                                Fluttertoast.showToast(
                                    msg: "אנא מלא רק את אחד מהפרטים ובצורה תקינה",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIos: 1,
                                    backgroundColor: Colors.red[900],
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              }
                            }

                          },
                        ),
                      ],
                    )
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  _launchURL(String toMailId, String subject, String body) async {

    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  bool searchFor(String email, List<String> emails) {
    for (int i = 0; i < emails.length; i++){
      if (emails.elementAt(i) == email)
        return true;
    }
    return false;
  }
}

