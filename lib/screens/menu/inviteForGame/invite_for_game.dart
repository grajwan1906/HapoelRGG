import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:urdunbasket/main.dart';
import 'package:urdunbasket/screens/menu/drawer.dart';
import 'package:urdunbasket/services/auth.dart';
import 'package:urdunbasket/services/database.dart';
import 'package:urdunbasket/shared/constants_and_widgets.dart';
import 'package:url_launcher/url_launcher.dart';


class InviteForGame extends StatefulWidget {
  @override
  _InviteForGameState createState() => _InviteForGameState();
}

class _InviteForGameState extends State<InviteForGame> {

  final _formKey = GlobalKey<FormState>();
  String name, school, phoneNumber, email, numberOfChildren;
  final DatabaseService databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    databaseService.updateUid();
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
              Align(alignment: Alignment.centerRight,child: Text('הזמנה למשחקים  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold',fontSize: 38, color: Colors.red[900]))), SizedBox(height: 30,),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 10.0),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(hintText: 'הכנס שם מלא', focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[600])
                          ), enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[600])
                          )),
                          style: TextStyle(fontFamily: 'OpenSansHebrew'),
                          validator: (val) => val.isEmpty ? 'הכנס שם מלא' : null,
                          onChanged: (val) {
                            setState(() => name = val);
                          },
                        ), SizedBox(height: 10.0,),
                        TextFormField(
                          style: TextStyle(fontFamily: 'OpenSansHebrew'),
                          decoration: textInputDecoration.copyWith(hintText: 'הכנס שם בית ספר', focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[600])
                          ), enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[600])
                          )),
                          validator: (val) => val.isEmpty ? 'הכנס שם בית ספר' : null,
                          onChanged: (val){
                          setState(() => school = val);
                        },),
                        SizedBox(height: 10.0,),
                        TextFormField(
                          style: TextStyle(fontFamily: 'OpenSansHebrew'),
                          decoration: textInputDecoration.copyWith(hintText: 'הכנס מספר טלפון', focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[600])
                          ), enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[600])
                          )),
                          validator: (val) => val.length != 10 ? 'הכנס מספר טלפון תקין' : null,
                          keyboardType: TextInputType.number,
                          onChanged: (val){
                          setState(() => phoneNumber = val);
                        },),
                        SizedBox(height: 10.0,),
                        TextFormField(
                          style: TextStyle(fontFamily: 'OpenSansHebrew'),
                          decoration: textInputDecoration.copyWith(hintText: 'הכנס כתובת מייל', focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[600])
                          ), enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[600])
                          )),
                          validator: (val) => val.isEmpty ? 'הכנס כתובת מייל' : null, onChanged: (val){
                          setState(() => email = val);
                        },),
                        SizedBox(height: 10.0,),
                        TextFormField(
                          style: TextStyle(fontFamily: 'OpenSansHebrew'),
                          decoration: textInputDecoration.copyWith(hintText: 'הכנס מספר ילדים', focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[600])
                          ), enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[600])
                          )),
                          validator: (val) => val.isEmpty ? 'הכנס מספר ילדים' : null,
                          keyboardType: TextInputType.number,
                          onChanged: (val){
                          setState(() => numberOfChildren = val);
                        },), SizedBox(height: 15,),
                        RaisedButton(
                          color: Colors.grey[600],
                          child: Text('הרשמה', style: TextStyle(fontFamily: 'OpenSansHebrew', color: Colors.white),),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              databaseService.updateUid();
                              dynamic result = await databaseService
                                  .addInvitationToTheGame(
                                  name, school, phoneNumber, email,
                                  numberOfChildren);
                              while (Navigator.canPop(context)) {
                                Navigator.pop(context);
                              }
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                      builder: (context) => MyApp()));
                            }
                          },
                        ),
                      ],
                    )
                ),
              ),
            ],
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

