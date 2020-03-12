import 'package:flutter/material.dart';
import 'package:urdunbasket/services/auth.dart';
import 'package:urdunbasket/shared/constants_and_widgets.dart';
import 'package:urdunbasket/shared/support_base_alert_dialog.dart';

class Support extends StatefulWidget {

  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/register_background.jpeg"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 20.0),
                            TextFormField(
                              minLines: 8,
                              maxLines: null,
                              style: TextStyle(fontFamily: 'OpenSansHebrew'),
                              decoration: textInputDecoration.copyWith(hintText: 'תאר את הבעיה בה נתקלת', focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey[600])
                              ), enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey[600])
                              )),
                              validator: (val) => val.isEmpty ? 'הכנס טקסט' : null,
                              onChanged: (val) {
                                setState(() => text = val);
                              },
                            ),
                            SizedBox(height: 20.0,),
                            RaisedButton(
                              color: Colors.grey[600],
                              child: Text('כניסה למערכת ושליחה לתמיכה', style: TextStyle(fontFamily: 'OpenSansHebrew', color: Colors.white),),
                              onPressed: () async {
                                if (_formKey.currentState.validate()){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SupportBaseAlertDialog(title: '', yes: 'כן', no: 'לא', content: 'האם אתה בטוח שברצונך לפמות לתמיכה?', reason: text,)));
                                }
                              },
                            ),SizedBox(height: 20.0,),
                          ],
                        )
                    ),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}
