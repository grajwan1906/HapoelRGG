import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:urdunbasket/screens/authenticate/support.dart';
import 'package:urdunbasket/screens/menu/ridesBoard/rides_board.dart';
import 'package:urdunbasket/services/auth.dart';
import 'package:urdunbasket/services/database.dart';
import 'package:urdunbasket/shared/constants_and_widgets.dart';
import 'package:urdunbasket/shared/loading.dart';

class AddRide extends StatefulWidget {

  String name, uid, phoneNumber, numberOfPeople;
  bool looking = false;
  int returnAlsoInt = 1;

  AddRide({this.name, this.uid, this.phoneNumber, this.numberOfPeople, this.returnAlsoInt, this.looking});

  @override
  _AddRideState createState() => _AddRideState(name: this.name, uid: this.uid, phoneNumber: this.phoneNumber, numberOfPeople: this.numberOfPeople, returnAlsoInt: this.returnAlsoInt, looking: this.looking);
}

class _AddRideState extends State<AddRide> {

  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  String name, uid, phoneNumber, numberOfPeople, city, street, address;
  bool looking = false;
  int lookingInt = 1, returnAlsoInt = 1;

  _AddRideState({this.name, this.uid, this.phoneNumber, this.numberOfPeople, this.returnAlsoInt, this.looking});

  @override
  Widget build(BuildContext context) {
    if (looking)
      lookingInt = 2;
    else
      lookingInt = 1;

    _auth.currentUser().then((result) {
      setState(() {
        uid = result.uid;
      });
    });
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/home_background.jpg"),
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
                            Row(
                              children: <Widget>[
                                Radio(
                                  value: 1,
                                  groupValue: lookingInt,
                                  activeColor: Colors.red[900],
                                  onChanged: (T) {
                                    setState(() {
                                      lookingInt = T;
                                      looking = false;
                                    });
                                  },
                                ),
                                Text(' מציע טרמפ', style: TextStyle(
                                    fontFamily: 'OpenSansHebrew',
                                    fontSize: 20,
                                    color: Colors.black)),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Radio(
                                  value: 2,
                                  groupValue: lookingInt,
                                  activeColor: Colors.red[900],
                                  onChanged: (T) {
                                    setState(() {
                                      lookingInt = T;
                                      looking = true;
                                    });
                                  },
                                ),
                                Text(' מחפש טרמפ', style: TextStyle(
                                    fontFamily: 'OpenSansHebrew',
                                    fontSize: 20,
                                    color: Colors.black)),
                              ],
                            ), SizedBox(height: 10,),
                            TextFormField(
                              initialValue: name,
                              style: TextStyle(
                                  fontFamily: 'OpenSansHebrew'),
                              decoration: textInputDecoration.copyWith(
                                  hintText: 'הכנס שם מלא', focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey[600])
                              ), enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey[600])
                              )),
                              validator: (val) =>
                              val.isEmpty
                                  ? 'הכנס שם מלא'
                                  : null,
                              onChanged: (val) {
                                setState(() => name = val);
                              },
                            ), SizedBox(height: 20.0,),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: TextFormField(
                                    style: TextStyle(
                                        fontFamily: 'OpenSansHebrew'),
                                    decoration: textInputDecoration.copyWith(
                                        hintText: 'הכנס שם רחוב ומספר', focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey[600])
                                    ), enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey[600])
                                    )),
                                    validator: (val) =>
                                    val.isEmpty
                                        ? 'הכנס שם רחוב ומספר'
                                        : null,
                                    onChanged: (val) {
                                      setState(() => street = val);
                                    },
                                  ),
                                ),SizedBox(width: 10,),
                                Expanded(
                                  child: TextFormField(
                                    style: TextStyle(
                                        fontFamily: 'OpenSansHebrew'),
                                    decoration: textInputDecoration.copyWith(
                                        hintText: 'הכנס שם עיר', focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey[600])
                                    ), enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey[600])
                                    )),
                                    validator: (val) =>
                                    val.isEmpty
                                        ? 'הכנס שם עיר'
                                        : null,
                                    onChanged: (val) {
                                      setState(() => city = val);
                                    },
                                  ),
                                )
                              ],
                            ), SizedBox(height: 20.0,),
                            TextFormField(
                              initialValue: phoneNumber,
                              style: TextStyle(
                                  fontFamily: 'OpenSansHebrew'),
                              decoration: textInputDecoration.copyWith(
                                  hintText: 'הכנס מספר טלפון', focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey[600])
                              ), enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey[600])
                              )),
                              validator: (val) =>
                              val.length != 10
                                  ? 'הכנס מספר טלפון תקין'
                                  : null,
                              keyboardType: TextInputType.number,
                              onChanged: (val) {
                                setState(() => phoneNumber = val);
                              },
                            ), SizedBox(height: 20.0,),
                            TextFormField(
                              initialValue: numberOfPeople,
                              style: TextStyle(
                                  fontFamily: 'OpenSansHebrew'),
                              decoration: textInputDecoration.copyWith(
                                  hintText: looking == false ? 'מספר מקומות פנויים: ' : 'מספר מקומות רצוי:', focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey[600])
                              ), enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey[600])
                              )),
                              keyboardType: TextInputType.number,
                              validator: (val) =>
                              val.isEmpty
                                  ? 'הכנס מספר מקומות פנויים'
                                  : null,
                              onChanged: (val) {
                                setState(() => numberOfPeople = val);
                              },
                            ), SizedBox(height: 10.0,),
                            Row(
                              children: <Widget>[
                                Radio(
                                  value: 1,
                                  groupValue: returnAlsoInt,
                                  activeColor: Colors.red[900],
                                  onChanged: (T) {
                                    setState(() {
                                      returnAlsoInt = T;
                                    });
                                  },
                                ),
                                Text('הלוך וחזור', style: TextStyle(
                                    fontFamily: 'OpenSansHebrew',
                                    fontSize: 20,
                                    color: Colors.black)),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Radio(
                                  value: 2,
                                  groupValue: returnAlsoInt,
                                  activeColor: Colors.red[900],
                                  onChanged: (T) {
                                    setState(() {
                                      returnAlsoInt = T;
                                    });
                                  },
                                ),
                                Text('הלוך', style: TextStyle(
                                    fontFamily: 'OpenSansHebrew',
                                    fontSize: 20,
                                    color: Colors.black)),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Radio(
                                  value: 3,
                                  groupValue: returnAlsoInt,
                                  activeColor: Colors.red[900],
                                  onChanged: (T) {
                                    setState(() {
                                      returnAlsoInt = T;
                                    });
                                  },
                                ),
                                Text('חזור', style: TextStyle(
                                    fontFamily: 'OpenSansHebrew',
                                    fontSize: 20,
                                    color: Colors.black)),
                              ],
                            ), SizedBox(height: 10,),
                            RaisedButton(
                              color: Colors.grey[600],
                              child: Text('הוספת טרמפ', style: TextStyle(
                                  fontFamily: 'OpenSansHebrew',
                                  color: Colors.white),),
                              onPressed: () async {
                                address = street + ', ' + city;
                                if (_formKey.currentState.validate()) {
                                  await DatabaseService(uid: uid).updateRide(returnAlsoInt.toString(), numberOfPeople, name,
                                  uid, phoneNumber, looking ? 'true' : 'false', address);
                                  Navigator.pop(context);
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RidesBoard()));
                                }
                              },
                            ), SizedBox(height: 20.0,),
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
