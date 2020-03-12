import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'custom_app_bar.dart' as prefix0;
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/loading_background.jpeg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Align(
            alignment: Alignment.center,
            child: Container(
              child: Image.asset('assets/icon/no_background.png',
                fit: BoxFit.contain, alignment: Alignment.bottomLeft,),
            ),
          ),
        ),
      ),
    );
  }
}
