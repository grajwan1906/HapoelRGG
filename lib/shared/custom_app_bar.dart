import 'package:flutter/material.dart';

AppBar appBar(){
  return AppBar(
      backgroundColor: Colors.red[900],
      title: Align(
        alignment: Alignment.centerRight,
        child: Text('HapoelRGG app', style: TextStyle(
            fontFamily: 'OpenSansHebrewBold',
            fontSize: 20,
            color: Colors.white),),
      )
  );
}
