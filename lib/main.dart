import 'package:flutter/material.dart';
import 'homepage.dart';

void main(List<String> args) {
  runApp(akilasyaproject());
}

class akilasyaproject extends StatefulWidget {
  const akilasyaproject({super.key});

  @override
  State<akilasyaproject> createState() => _akilasyaprojectState();
}

class _akilasyaprojectState extends State<akilasyaproject> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            //this will return the homepage that you see on the first screen
            body: homepage()));
  }
}
