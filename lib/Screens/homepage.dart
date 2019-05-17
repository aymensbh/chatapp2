import 'package:chat_app/Utils/firebasehelper.dart';
import 'package:chat_app/pages/home.dart';
import 'package:chat_app/pages/profile.dart';
import 'package:chat_app/pages/search.dart';
import 'package:chat_app/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _controller;
  int _currentIndex = 0;

  final List<BubbledNavigationBarItem> barItems = [
    BubbledNavigationBarItem(
        icon: Icon(LineIcons.home),
        activeIcon: Icon(LineIcons.home, color: Colors.indigo),
        title: Text(
          "Home",
          style: TextStyle(fontFamily: "Baloo"),
        )),
    BubbledNavigationBarItem(
        icon: Icon(LineIcons.search),
        activeIcon: Icon(LineIcons.search, color: Colors.indigo),
        title: Text(
          "Search",
          style: TextStyle(fontFamily: "Baloo"),
        )),
    BubbledNavigationBarItem(
        icon: Icon(LineIcons.user),
        activeIcon: Icon(LineIcons.user, color: Colors.indigo),
        title: Text(
          "User",
          style: TextStyle(fontFamily: "Baloo"),
        )),
    BubbledNavigationBarItem(
        icon: Icon(LineIcons.gear),
        activeIcon: Icon(LineIcons.gear, color: Colors.indigo),
        title: Text(
          "Gear",
          style: TextStyle(fontFamily: "Baloo"),
        )),
  ];

  @override
  void initState() {
    _controller = new PageController(initialPage: 0);
    _currentIndex = 0;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebaseAuth.currentUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
              child: Scaffold(
            appBar: AppBar(
              title: Text(
                //we can work with this later
                "Loading..",
              ),
              elevation: 0,
            ),
            body: Container(
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
            ),
          ));
        } else {
          return Scaffold(
            body: PageView(
              controller: _controller,
              children: <Widget>[
                Home(),
                Search(),
                Profile(),
                Settings(),
              ],
            ),
            bottomNavigationBar: BubbledNavigationBar(
              items: barItems,
              backgroundColor: Colors.white,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });

                // _controller.animateToPage(index,
                //     curve: Curves.ease, duration: Duration(milliseconds: 300));
              },
            ),
          );
        }
      },
    );
  }
}
