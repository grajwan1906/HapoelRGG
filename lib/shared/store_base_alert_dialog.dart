import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:urdunbasket/services/auth.dart';
import 'package:url_launcher/url_launcher.dart';

class StoreBaseAlertDialog extends StatelessWidget {

  String title, content, yes, no;

  StoreBaseAlertDialog({this.title, this.content, this.yes, this.no});

  BuildContext context;
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/dialog_background.jpeg"),
              fit: BoxFit.fill,
            ),
          ),
          child: AlertDialog(
            title: new Text(this.title, style: TextStyle(
                fontFamily: 'OpenSansHebrew',
                fontSize: 20,
                color: Colors.black)),
            content: Directionality(textDirection: TextDirection.rtl,
                child: new Text(this.content, style: TextStyle(
                    fontFamily: 'OpenSansHebrew',
                    fontSize: 20,
                    color: Colors.black))),
            shape:
            RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
            actions: <Widget>[
              new FlatButton(
                child: new Text(this.yes, style: TextStyle(
                    fontFamily: 'OpenSansHebrew',
                    fontSize: 20,
                    color: Colors.red[900])),
                onPressed: () async {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                  _launchURL('http://hapoelrgg.com/shop/');
                },
              ),
              new FlatButton(
                child: Text(this.no, style: TextStyle(
                    fontFamily: 'OpenSansHebrew',
                    fontSize: 20,
                    color: Colors.red[900])),
                onPressed: () {
                  if (Navigator.canPop(context))
                    Navigator.pop(context);
                },
              ),
            ],
          ),
        ));
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
