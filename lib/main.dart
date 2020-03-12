import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:urdunbasket/models/user.dart';
import 'package:urdunbasket/screens/wrapper.dart';
import 'package:urdunbasket/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:urdunbasket/shared/loading.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }

}


