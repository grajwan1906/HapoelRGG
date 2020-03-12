import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:urdunbasket/screens/menu/drawer.dart';
import 'package:urdunbasket/services/auth.dart';
import 'package:urdunbasket/shared/constants_and_widgets.dart';
import 'package:urdunbasket/shared/custom_app_bar.dart' as prefix0;
import 'package:url_launcher/url_launcher.dart';


class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {

  final _formKey = GlobalKey<FormState>();
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: prefix0.appBar(),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Container(
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
                Align(alignment: Alignment.centerRight,child: Text('צור קשר ', style: TextStyle(fontFamily: 'OpenSansHebrewBold',fontSize: 38, color: Colors.red[900]))), SizedBox(height: 30,),
                Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextFormField(
                            minLines: 8,
                            maxLines: null,
                            style: TextStyle(fontFamily: 'OpenSansHebrew'),
                            decoration: textInputDecoration.copyWith(hintText: 'מה רצית לכתוב לנו?', focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey[600])
                            ), enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey[600])
                            )),
                            validator: (val) => val.isEmpty ? 'הכנס טקסט' : null,
                            onChanged: (val) {
                              setState(() => text = val);
                            },
                          ),
                        ), SizedBox(height: 20.0,),
                        RaisedButton(
                          color: Colors.grey[600],
                          child: Text('שלח', style: TextStyle(fontFamily: 'OpenSansHebrew', color: Colors.white),),
                          onPressed: () async {
                            if (_formKey.currentState.validate()){
                              //FlutterOpenWhatsapp.sendSingleMessage('+972586304472', text);
                              _launchURL('hapoel.r.g.g@gmail.com', 'contact from app', text );
                            }
                          },
                        ),
                      ],
                    )
                ),
                SizedBox(height: 20,),
                Align(alignment: Alignment.centerRight,child: Text('פרטים כלליים ', style: TextStyle(fontFamily: 'OpenSansHebrewBold',fontSize: 38, color: Colors.red[900]))), SizedBox(height: 30,),
                Align(alignment: Alignment.centerRight,child: Text('hapoel.r.g.g@gmail.com' + ' :מייל', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 10,),
                Align(alignment: Alignment.centerRight,child: Text('כתובת האולם: דרך הטייסים 87, רמת גן', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 10,),
                Align(alignment: Alignment.centerRight,child: Text('כתובת אולם האימונים: צביה לובטקין 5, גבעתיים', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 10,),
                Align(alignment: Alignment.centerRight,child: Text('מספר טלפון: 0524503073', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 10,),
                Align(alignment: Alignment.centerRight,child: Text('עמותת מועדון כדורסל הפועל רמת גן מ.ע 580559623', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 10,),
                SizedBox(height: 150.0,),
              ],
            ),
        ),
      ),
    );
  }
  _launchURL(String toMailId, String subject, String body) async {

    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    body = 'שם: ' + user.displayName + '\n' + body;
    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

