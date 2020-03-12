import 'package:flutter/material.dart';
import 'package:urdunbasket/services/auth.dart';
import 'package:urdunbasket/shared/constants_and_widgets.dart';
import 'package:urdunbasket/shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  int typeInt = 1;
  String email = '';
  String password = '';
  String error = '';
  String name = '';
  String phoneNumber = '';
  int type = 0; //0 - אורח, 1 - הורה

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      resizeToAvoidBottomPadding: false,
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
                Align(alignment: Alignment.topLeft,child: FlatButton.icon(onPressed: () {widget.toggleView();}, icon: Icon(Icons.person), label: Text('כניסה', style: TextStyle(fontFamily: 'OpenSansHebrew')))),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Form(
                      key: _formKey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 10.0),
                            TextFormField(
                              decoration: textInputDecoration.copyWith(hintText: 'הכנס אימייל', focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey[600])
                              ), enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey[600])
                              )),
                              style: TextStyle(fontFamily: 'OpenSansHebrew'),
                              validator: (val) => val.isEmpty ? 'הכנס אימייל' : null,
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                            ), SizedBox(height: 10.0,),
                            TextFormField(
                              style: TextStyle(fontFamily: 'OpenSansHebrew'),
                              decoration: textInputDecoration.copyWith(hintText: 'הכנס סיסמה', focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey[600])
                              ), enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey[600])
                              )),
                              validator: (val) => val.length < 6 ? 'הסיסמה צריכה להיות בעלת 6+ תווים' : null,
                              obscureText: true, onChanged: (val){
                              setState(() => password = val);
                            },),
                            SizedBox(height: 10.0,),
                            TextFormField(
                              style: TextStyle(fontFamily: 'OpenSansHebrew'),
                              decoration: textInputDecoration.copyWith(hintText: 'הכנס שם מלא', focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey[600])
                              ), enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey[600])
                              )),
                              validator: (val) => val.isEmpty ? 'הכנס שם מלא' : null, onChanged: (val){
                              setState(() => name = val);
                            },),
                            SizedBox(height: 10.0,),
                            TextFormField(
                              style: TextStyle(fontFamily: 'OpenSansHebrew'),
                              decoration: textInputDecoration.copyWith(hintText: 'הכנס מספר טלפון', focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey[600])
                              ), enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey[600])
                              )),
                              keyboardType: TextInputType.number,
                              validator: (val) => val.length != 10 ? 'הכנס מספר תלפון תקין' : null, onChanged: (val){
                              setState(() => phoneNumber = val);
                            },),
                            Row(
                              children: <Widget>[
                                Radio(
                                  value: 1,
                                  groupValue: typeInt,
                                  activeColor: Colors.red[900],
                                  onChanged: (T) {
                                    setState(() {
                                      typeInt = T;
                                      type = 0;
                                    });
                                  },
                                ),
                                Text('אוהד', style: TextStyle(
                                    fontFamily: 'OpenSansHebrew',
                                    fontSize: 20,
                                    color: Colors.black)),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Radio(
                                  value: 2,
                                  groupValue: typeInt,
                                  activeColor: Colors.red[900],
                                  onChanged: (T) {
                                    setState(() {
                                      typeInt = T;
                                      type = 1;
                                    });
                                  },
                                ),
                                Text('הורה', style: TextStyle(
                                    fontFamily: 'OpenSansHebrew',
                                    fontSize: 20,
                                    color: Colors.black)),
                                SizedBox(width: 30,),
                                Expanded(
                                  child: (typeInt == 2) ? TextFormField(
                                    style: TextStyle(fontFamily: 'OpenSansHebrew'),
                                    decoration: textInputDecoration.copyWith(hintText: 'הכנס קוד הורה', focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey[600])
                                    ), enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey[600])
                                    )),
                                    validator: (val) => val != '10' ? 'הכנס קוד תקין' : null,) : Container(),
                                )
                              ],
                            ), SizedBox(height: 10,),
                            RaisedButton(
                              color: Colors.grey[600],
                              child: Text('הרשמה', style: TextStyle(fontFamily: 'OpenSansHebrew', color: Colors.white),),
                              onPressed: () async {
                                if (_formKey.currentState.validate()){
                                  setState(() => loading = true);
                                  dynamic result = await _auth.registerWithEmailAndPassowrd(email, password, name, phoneNumber, type);
                                  if (result == null){
                                    setState(() {
                                      error = 'הכנס אימייל תקין';
                                      loading = false;
                                    });
                                  }
                                }
                              },
                            ),
                            SizedBox(height: 12.0),
                            Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0),),
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
