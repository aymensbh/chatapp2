import 'package:chat_app/Utils/firebasehelper.dart';
import 'package:chat_app/pages/home.dart';
import 'package:chat_app/pages/profile.dart';
import 'package:chat_app/pages/search.dart';
import 'package:chat_app/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:splashy_bottom_app_bar/splashy_bottom_app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _controller;
  int _currentIndex = 0;
  final List<BarItem> barItems = [
    BarItem(
      text: "Home",
      iconData: LineIcons.home,
      color: Colors.indigo,
    ),
    BarItem(
      text: "Search",
      iconData: LineIcons.search,
      color: Colors.indigo,
    ),
    BarItem(
      text: "Profile",
      iconData: LineIcons.user,
      color: Colors.indigo,
    ),
    BarItem(
      text: "Settings",
      iconData: LineIcons.gear,
      color: Colors.teal,
    ),
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
            bottomNavigationBar: SplashyBottomAppBar(
              iconSize: MediaQuery.of(context).size.width * 0.08,
              currentIndex: _currentIndex,
              items: barItems,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                  _controller.animateToPage(index, curve: Curves.ease,duration: Duration(milliseconds: 300));
                });
              },
            ),
          );
        }
      },
    );
  }
}
