import 'package:flutter/material.dart';
import 'mobile.dart';
import 'desktop.dart';
//homepage class is used to return a mobile designed website is the pixels of the users screen is
//less that the required and return desktop website if the pixels reqiurements are higher

class homepage extends StatefulWidget {
  const homepage({super.key});
//please know that i have something to say to these people i am the ethiopian greates developer and trying to teach you online
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      //returns the mobile() class if the width of the screen(in pixels) is less than 522.5 else it will return desktop() class
      child: width < 522.5 ? mobile() : desktop(),
    );
  }
}
