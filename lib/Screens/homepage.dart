import 'package:chat_app/Utils/firebasehelper.dart';
import 'package:chat_app/pages/home.dart';
import 'package:chat_app/pages/profile.dart';
import 'package:chat_app/pages/search.dart';
import 'package:chat_app/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _controller;
  MenuPositionController _controller2;

  final List<BubbledNavigationBarItem> barItems = [
    BubbledNavigationBarItem(
        icon: Icon(LineIcons.home),
        activeIcon: Icon(LineIcons.home, color: Colors.white),
        title: Text(
          "Home",
          style: TextStyle(fontFamily: "Baloo", color: Colors.white),
        )),
    BubbledNavigationBarItem(
        bubbleColor: Colors.teal,
        icon: Icon(LineIcons.search),
        activeIcon: Icon(LineIcons.search, color: Colors.white),
        title: Text(
          "Search",
          style: TextStyle(fontFamily: "Baloo", color: Colors.white),
        )),
    BubbledNavigationBarItem(
        bubbleColor: Colors.green,
        icon: Icon(LineIcons.user),
        activeIcon: Icon(LineIcons.user, color: Colors.white),
        title: Text(
          "User",
          style: TextStyle(fontFamily: "Baloo", color: Colors.white),
        )),
    BubbledNavigationBarItem(
        bubbleColor: Colors.pink,
        icon: Icon(LineIcons.gear),
        activeIcon: Icon(LineIcons.gear, color: Colors.white),
        title: Text(
          "Gear",
          style: TextStyle(fontFamily: "Baloo", color: Colors.white),
        )),
  ];

  @override
  void initState() {
    _controller = new PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: PageView(
          controller: _controller,
          physics: NeverScrollableScrollPhysics(),
          // onPageChanged: (index) {
          //   print(index);
          //   _controller2.animateToPosition(index,
          //       duration: Duration(milliseconds: 300));
          // },
          children: <Widget>[
            Home(),
            Search(),
            Profile(),
            Settings(),
          ],
        ),
      ),
      bottomNavigationBar: BubbledNavigationBar(
        items: barItems,
        controller: _controller2,
        itemMargin: EdgeInsets.only(left: 4, right: 4),
        animationCurve: Curves.ease,
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: Colors.white,
        onTap: (index) {
          print(index);
          _controller.animateToPage(index,
              curve: Curves.ease, duration: Duration(milliseconds: 300));
        },
      ),
    );
  }
}
