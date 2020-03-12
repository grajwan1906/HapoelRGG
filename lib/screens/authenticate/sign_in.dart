import 'package:flutter/material.dart';
import 'package:urdunbasket/screens/authenticate/support.dart';
import 'package:urdunbasket/services/auth.dart';
import 'package:urdunbasket/shared/constants_and_widgets.dart';
import 'package:urdunbasket/shared/loading.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
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
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: RaisedButton(
                      color: Colors.grey[600],
                      child: Text('תמיכה', style: TextStyle(
                          fontFamily: 'OpenSansHebrew', color: Colors.white),),
                      onPressed: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Support()));
                      },
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Align(alignment: Alignment.topLeft,
                        child: FlatButton.icon(onPressed: () {
                          widget.toggleView();
                        },
                            icon: Icon(Icons.person),
                            label: Text('הרשמה', style: TextStyle(
                                fontFamily: 'OpenSansHebrew')))),
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
                                  style: TextStyle(
                                      fontFamily: 'OpenSansHebrew'),
                                  decoration: textInputDecoration.copyWith(
                                      hintText: 'הכנס אימייל', focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey[600])
                                  ), enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey[600])
                                  )),
                                  validator: (val) =>
                                  val.isEmpty
                                      ? 'הכנס אימייל'
                                      : null,
                                  onChanged: (val) {
                                    setState(() => email = val);
                                  },
                                ), SizedBox(height: 20.0,),
                                TextFormField(
                                  style: TextStyle(
                                      fontFamily: 'OpenSansHebrew'),
                                  decoration: textInputDecoration.copyWith(
                                      hintText: 'הכנס סיסמה', focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey[600])
                                  ), enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey[600])
                                  )),
                                  obscureText: true,
                                  validator: (val) =>
                                  val.length < 6
                                      ? 'הסיסמה צריכה להיות בעלת 6+ תווים'
                                      : null,
                                  onChanged: (val) {
                                    setState(() => password = val);
                                  },),
                                SizedBox(height: 20.0,),
                                RaisedButton(
                                  color: Colors.grey[600],
                                  child: Text('כניסה למערכת', style: TextStyle(
                                      fontFamily: 'OpenSansHebrew',
                                      color: Colors.white),),
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      setState(() => loading = true);
                                      dynamic result = await _auth
                                          .signInWithEmailAndPassowrd(
                                          email, password);
                                      if (result == null) {
                                        setState(() {
                                          error = 'ההתחברות למערכת לא הצליחה';
                                          loading = false;
                                        });
                                      }
                                    }
                                  },
                                ), SizedBox(height: 20.0,),
                                SizedBox(height: 12.0),
                                Text(error, style: TextStyle(
                                    fontFamily: 'OpenSansHebrew',
                                    color: Colors.red,
                                    fontSize: 14.0),),
                              ],
                            )
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
        ),
      ),
    );
  }
}
