import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class desktop extends StatefulWidget {
  const desktop({super.key});
  @override
  State<desktop> createState() => _desktopState();
}

class _desktopState extends State<desktop> {
  ScrollController _controller = ScrollController();
  String text = "";
  String realtext =
      "Akilasya was founded by Demeke Tekola in 2002 E.C. why it was named Akilasiya? his wife was hoping that her first child will be a girl and before the child was born they named her akilasya. At that time his startup was going to begin so when they try to come up with a name they named it Akilasya.Sadly it turned out to be a boy, But the name hasn't changed.";
  double pixels = 0.0;
  bool isforward = true;
  late int textlength = realtext.length;
  Timer? time;
  int index = 0;

  @override
  //this is the function where we try to create a typewritting effect on it
  //cahange it give another funtion around this area so that you can diffrentiate the scroll controller from the type-writer
  void initState() {
    // TODO: implement initState
    time = Timer.periodic(Duration(milliseconds: 345), (timer) {
      if (isforward) {
        index += 2;
        if (index > realtext.length) {
          index--;
          isforward = false;
        }
      }
    });

    setState(() {
      text = realtext.substring(0, index);
      print("line 36:this is index $index");
    });
    ScrollController controller = _controller;
    controller.addListener(() {
      setState(() {
        //give the pixels from the top useful for creating animations
        pixels = _controller.position.pixels;
      });
    });
    super.initState();
  }

  AssetImage background = AssetImage("images/3.jpg");

  @override
  Widget build(BuildContext context) {
    double fromleft = -540;

    //width of the screen in pixels

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
        width: double.infinity,
        //makes our website scrollable: all of the widgets are contained in here
        child: ListView(controller: _controller, children: [
          Row(
            //this row contains all of the widgets on the top navigation bar
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //the logo

              Container(
                  child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Akilasya",
                  style: TextStyle(fontSize: 46, fontFamily: "logo"),
                ),
              )),
              //this is the navigation bar on topright corner
              Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 0, 0, 0),
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(54),
                        )),
                    child: GNav(gap: 15, tabBorderRadius: 357, tabs: [
                      GButton(
                        textColor: Colors.white,
                        iconActiveColor:
                            const Color.fromARGB(255, 125, 197, 255),
                        iconColor: Colors.white,
                        iconSize: 20,
                        icon: Icons.home,
                        text: "Home",
                      ),
                      GButton(
                        active: true,
                        textColor: Colors.white,
                        text: "Sites",
                        iconSize: 20,
                        iconActiveColor:
                            const Color.fromARGB(255, 125, 197, 255),
                        iconColor: Colors.white,
                        icon: Icons.construction_sharp,
                      ),
                      GButton(
                          active: false,
                          textColor: Colors.white,
                          text: "About-us",
                          iconSize: 20,
                          iconActiveColor:
                              const Color.fromARGB(255, 125, 197, 255),
                          iconColor: Colors.white,
                          icon: Icons.account_box_rounded)
                    ]),
                  )),
            ],
          ),

          //the image shown for the website homepage.desktop()
          Stack(
            children: [
              Container(
                height: width < 674.7 ? height + 189 : height - 60,
                width: width < 674.7 ? width - 58 : width + 58,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                      height: height - 55,
                      child: Image(
                          image: width > 1199.333
                              ? background
                              : AssetImage("images/tablet.jpg"))),
                ),
              ),
              //this widget will change the position of the our company text as the screen size get smaller
              //usefull for responsive web design
              Positioned(
                top: width < 716.0 ? 30.776 : 77.776,
                child: Column(
                  children: [
                    //Our company text
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Our company",
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 65,
                            fontFamily: "title"),
                      ),
                    ),

                    //the company's intro text
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 6,
                        ),
                        Container(
                          width: 450,
                          child: Text(
                            realtext,
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: "titletext",
                                fontSize: 23),
                          ),
                        ),
                      ],
                    ),
                    //the Learn more button
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            print(pixels);
                          });
                        },
                        child: Text("Learn-More"))
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 560,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            width: width,
            child: Container(
                width: width,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      //this will give the opacity of 100% in future if you wanna add animation of appearing you can use this widget
                      /*
                  this whill give the opactiy of 100% 
                  in future if you wanna add animation you can use an inside if statement to make a text appear from 0% oppacity
                  */
                      //History text will get animated it's opacity is zero below certain pixels
                      child: AnimatedOpacity(
                        opacity: pixels < 78 ? 0.0 : 1,
                        duration: Duration(milliseconds: 290),
                        child: Text(
                          "HISTORY".substring(0),
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "title",
                              fontSize: 56,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    //Using the expanded and stack widget together as the parent widget of animated postion helps to fix the null error
                    Expanded(
                      child: Stack(
                        children: <Widget>[
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 390),
                            child: Container(
                              width: width,
                              child: Column(
                                children: [
                                  Text(
                                    text,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    "  At 2008 E.C the company was at the verge of death as any other startup, there was no work for almost two years. But with the hard work of Demeke and Derege(his co-worker they have changed what will have been a devestating bankruptcy.",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          )
        ]));
  }
}
