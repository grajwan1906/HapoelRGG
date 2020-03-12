import 'package:flutter/material.dart';
import 'package:urdunbasket/shared/custom_app_bar.dart' as prefix0;

import 'drawer.dart';

class Partners extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: prefix0.appBar(),
      endDrawer: AppDrawer(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/home_background.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Align(alignment: Alignment.centerRight,child: Text('שותפים לדרך  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold',fontSize: 38, color: Colors.red[900]))), SizedBox(height: 30,),
            Row(
              children: <Widget>[
                Expanded(
                  child: Image.asset('assets/partners/logo1.jpeg'),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: Image.asset('assets/partners/logo2.jpeg'),
                )
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: <Widget>[
                Expanded(
                  child: Image.asset('assets/partners/logo3.jpeg'),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: Image.asset('assets/partners/logo4.jpeg'),
                )
              ],
            ),
            SizedBox(height: 30.0,),
          ],
        ),
      ),
    );
  }
}
