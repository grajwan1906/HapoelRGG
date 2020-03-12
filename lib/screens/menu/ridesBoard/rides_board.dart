import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:urdunbasket/models/ride.dart';
import 'package:urdunbasket/screens/menu/ridesBoard/add_ride.dart';
import 'package:urdunbasket/services/auth.dart';
import 'package:urdunbasket/services/database.dart';
import 'package:urdunbasket/shared/constants_and_widgets.dart';
import 'package:urdunbasket/shared/custom_app_bar.dart' as prefix0;
import 'package:urdunbasket/shared/loading.dart';

import '../drawer.dart';

class RidesBoard extends StatefulWidget {
  @override
  _RidesBoardState createState() => _RidesBoardState();
}

class _RidesBoardState extends State<RidesBoard> {

  AuthService _auth = AuthService();

  List<Ride> rides = new List();
  String address, addressLink, time, homeTeamName, homeTeamIcon,
      awayTeamName, awayTeamIcon;
  Color homeColor, awayColor;

  String name = '', numberOfPeople = '', uid = '', phoneNumber = '', addressRide = '';
  bool looking = false, findRide = false;
  int returnAlsoInt = 1;

  @override
  void initState() {
    super.initState();
    checkIfMyRideExist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: prefix0.appBar(),
      endDrawer: AppDrawer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[900],
        child: Icon(findRide ? Icons.edit : Icons.add),
        onPressed: () {
          return Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddRide(name: name, numberOfPeople: numberOfPeople, uid: uid, phoneNumber: phoneNumber
            , returnAlsoInt: returnAlsoInt, looking: looking,)));
        },
      ),
      body: SizedBox.expand(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/home_background.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20,),
                  StreamBuilder(
                    stream: Firestore.instance.collection('nextGame')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        address = snapshot.data.documents[0]['address'];
                        addressLink = snapshot.data.documents[0]['addressLink'];
                        time = snapshot.data.documents[0]['time'];
                        homeTeamName =
                        snapshot.data.documents[0]['homeTeamName'];
                        homeTeamIcon =
                        snapshot.data.documents[0]['homeTeamIcon'];
                        awayTeamName =
                        snapshot.data.documents[0]['awayTeamName'];
                        awayTeamIcon =
                        snapshot.data.documents[0]['awayTeamIcon'];
                        if (homeTeamName == 'הפועל רמת גן גבעתיים') {
                          homeColor = Colors.red[900];
                          awayColor = Colors.black;
                        } else {
                          homeColor = Colors.black;
                          awayColor = Colors.red[900];
                        }
                        return nextGameCardRidesBoardHelper(
                            address,
                            addressLink,
                            time,
                            homeTeamName,
                            homeTeamIcon,
                            awayTeamName,
                            awayTeamIcon,
                            homeColor,
                            awayColor);
                      } else {
                        return new Loading();
                      }
                    },
                  ), SizedBox(height: 20,),
                  Align(alignment: Alignment.centerRight,
                      child: Text('לוח טרמפים  ', style: TextStyle(
                          fontFamily: 'OpenSansHebrewBold',
                          fontSize: 38,
                          color: Colors.red[900]))), SizedBox(height: 10,),
                  StreamBuilder(
                      stream: Firestore.instance.collection('ridesBoard')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          rides = new List();
                          for (var doc in snapshot.data.documents) {
                            if (doc['uid'] == uid){
                              name = doc['name'];
                              numberOfPeople = doc['numberOfPeople'];
                              uid = doc['uid'];
                              phoneNumber = doc['phoneNumber'];
                              returnAlsoInt = int.parse(doc['returnAlso']);
                              if (doc['looking'] == 'true')
                                looking = true;
                              else
                                looking = false;
                              addressRide = doc['address'];
                            }
                            rides.add(new Ride(name: doc['name'],
                                numberOfPeople: doc['numberOfPeople'],
                                uid: doc['uid'],
                                phoneNumber: doc['phoneNumber'],
                                returnAlsoInt: doc['returnAlso'],
                                looking: doc['looking'],
                                address: doc['address']));
                          }
                          return ridesBoardList(rides, context);
                        } else {
                          return new Loading();
                        }
                      }
                  ), SizedBox(height: 20,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  checkIfMyRideExist() async{
    _auth.currentUser().then((result) {
      setState(() {
        uid = result.uid;
      });
    });    DocumentSnapshot ds = await Firestore.instance.collection("ridesBoard").document('VSTy2nJHuFRIY02Rebk8OzPtAME3').get();
    this.setState(() {
      findRide = ds.exists;
      print('exist: ' + ds.exists.toString());
    });
  }
}
