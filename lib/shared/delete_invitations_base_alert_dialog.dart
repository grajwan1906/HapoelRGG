import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:urdunbasket/main.dart';
import 'package:urdunbasket/screens/authenticate/sign_in.dart';
import 'package:urdunbasket/services/auth.dart';
import 'package:urdunbasket/services/database.dart';

class DeleteInvitationsBaseAlertDialog extends StatelessWidget {

  String title, content, yes, no;

  DeleteInvitationsBaseAlertDialog({this.title, this.content, this.yes, this.no});

  BuildContext context;
  final AuthService _auth = AuthService();
  final DatabaseService databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    this.context = context;
    databaseService.updateUid();

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
                onPressed: () {
                  databaseService.deleteInvitations();
                  Fluttertoast.showToast(
                      msg: "המחיקה בוצעה בהצלחה",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIos: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                  while (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
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
}
