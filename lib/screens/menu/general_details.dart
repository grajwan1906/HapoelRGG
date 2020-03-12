import 'package:flutter/material.dart';
import 'package:urdunbasket/shared/custom_app_bar.dart' as prefix0;
import 'package:webview_flutter/webview_flutter.dart';

import 'drawer.dart';

class GeneralDetails extends StatefulWidget {
  @override
  _GeneralDetailsState createState() => _GeneralDetailsState();
}

class _GeneralDetailsState extends State<GeneralDetails> {
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
            Align(alignment: Alignment.centerRight,child: Text('פרטים כלליים  ', style: TextStyle(fontFamily: 'OpenSansHebrewBold',fontSize: 38, color: Colors.red[900]))), SizedBox(height: 30,),
            Align(alignment: Alignment.centerRight,child: Text('hapoel.r.g.g@gmail.com' + ' :מייל', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 10,),
            Align(alignment: Alignment.centerRight,child: Text('כתובת האולם: דרך הטייסים 87, רמת גן', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 10,),
            Align(alignment: Alignment.centerRight,child: Text('כתובת אולם האימונים: צביה לובטקין 5, גבעתיים', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 10,),
            Align(alignment: Alignment.centerRight,child: Text('מספר טלפון: 0524503073', style: TextStyle(fontFamily: 'OpenSansHebrew',fontSize: 20))), SizedBox(height: 10,),
            SizedBox(height: 20.0,),
          ],
        ),
      ),
    );
  }
}
