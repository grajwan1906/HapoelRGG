import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:urdunbasket/screens/menu/drawer.dart';
import 'package:urdunbasket/screens/menu/squad/video.dart';
import 'package:urdunbasket/shared/custom_app_bar.dart' as prefix0;
import 'package:urdunbasket/shared/loading.dart';


class Player extends StatefulWidget {
  String name, height, position, date, image, text, videoURL, imageVideo;
  Player({this.name, this.height, this.position, this.date, this.image, this.text, this.videoURL, this.imageVideo});
  @override
  _PlayerState createState() => _PlayerState(name: name, height: height, position: position, date: date, image: image, text: text, videoURL: videoURL, imageVideo: imageVideo);
}

class _PlayerState extends State<Player> {
  String name, height, position, date, image, text, videoURL, imageVideo;
  _PlayerState({this.name, this.height, this.position, this.date, this.image, this.text, this.videoURL, this.imageVideo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: prefix0.appBar(),
      endDrawer: AppDrawer(),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/home_background.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                Card(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Image.asset(image,
                          fit: BoxFit.contain,
                          alignment: Alignment.bottomLeft,),
                      ),
                      Container(
                        height: 80,
                        child: Row(
                          children: <Widget>[
                            Expanded(child: Center(child: Column(
                              children: <Widget>[
                                SizedBox(height: 10,),
                                Text('גובה', style: TextStyle(
                                    fontFamily: 'OpenSansHebrew',
                                    fontSize: 20)), SizedBox(height: 10,),
                                Text(height, style: TextStyle(
                                    fontFamily: 'OpenSansHebrew',
                                    fontSize: 20)),
                              ],
                            ))),
                            Container(
                              width: 1,
                              height: 60,
                              color: Colors.grey,
                            ),
                            Expanded(child: Center(child: Column(
                              children: <Widget>[
                                SizedBox(height: 10,),
                                Text('עמדה', style: TextStyle(
                                    fontFamily: 'OpenSansHebrew',
                                    fontSize: 20)), SizedBox(height: 10,),
                                Text(position, style: TextStyle(
                                    fontFamily: 'OpenSansHebrew',
                                    fontSize: 20)),
                              ],
                            ))),
                            Container(
                              width: 1,
                              height: 60,
                              color: Colors.grey,
                            ),
                            Expanded(child: Center(child: Column(
                              children: <Widget>[
                                SizedBox(height: 10,),
                                Text('ת. לידה', style: TextStyle(
                                    fontFamily: 'OpenSansHebrew',
                                    fontSize: 20)), SizedBox(height: 10,),
                                Text(date, style: TextStyle(
                                    fontFamily: 'OpenSansHebrew',
                                    fontSize: 20)),
                              ],
                            ))),
                          ],
                        ),
                      )
                    ],
                  ),
                ), SizedBox(height: 15,),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: text.length == 0 ? Container() : Container(
                    child: Row(
                      children: <Widget>[
                        Align(alignment: Alignment.centerRight,
                            child: Text('קבוצות עבר:  ', style: TextStyle(
                                fontFamily: 'OpenSansHebrewBold',
                                fontSize: 20,
                                color: Colors.red[900]))),
                        Container(padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Align(alignment: Alignment.topRight,
                                child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text(text, style: TextStyle(
                                        fontFamily: 'OpenSansHebrew',
                                        fontSize: 20))))),
                        SizedBox(height: 10,),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Align(
                  alignment: Alignment.centerRight,
                  child: imageVideo.length == 0 ? SizedBox(height: 100,) : Text(
                      'לצפייה בסרטון השחקן לחץ', style: TextStyle(
                      fontFamily: 'OpenSansHebrew',
                      fontSize: 14,
                      color: Colors.black)),
                ),
                imageVideo.length == 0 ? SizedBox(height: 100,) : InkWell(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context) => Video(VIDEO_URL: videoURL)));
                    },
                    child: Image.asset(imageVideo)
                ),
                SizedBox(height: 50,)
              ],
            ),
          )
      ),
    );
  }
}

