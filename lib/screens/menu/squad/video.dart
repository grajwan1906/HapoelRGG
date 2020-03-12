import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'dart:io' show Platform;

import 'package:urdunbasket/shared/custom_app_bar.dart' as prefix0;

class Video extends StatefulWidget {

  final String VIDEO_URL;
  Video({this.VIDEO_URL});

  @override
  _VideoState createState() => _VideoState(VIDEO_URL: VIDEO_URL);
}

class _VideoState extends State<Video> {

  final String VIDEO_URL;
  String API_KEY;

  _VideoState({this.VIDEO_URL});

  @override
  Widget build(BuildContext context) {

    if (Platform.isAndroid) {
      API_KEY = 'AIzaSyDG_k3Ee-G73dHo73DHMpjTkLriKmETVkw';
    } else if (Platform.isIOS) {
      API_KEY = 'AIzaSyBft_X4d9t_B7EIfE_a6opY4zG8qWygGIY';
    }

    Widget tab = FlutterYoutube.playYoutubeVideoByUrl(
        apiKey: API_KEY,
        videoUrl: VIDEO_URL,
        autoPlay: true,
        appBarColor: Colors.red[900],
        fullScreen: true

    );

    if (Navigator.canPop(context))
      Navigator.pop(context);
    return (API_KEY.length > 0 && VIDEO_URL.length > 0) ? tab : Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: prefix0.appBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/home_background.jpg"),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
