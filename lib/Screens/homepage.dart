import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:chat_app/Utils/firebasehelper.dart';
import 'package:chat_app/pages/home.dart';
import 'package:chat_app/pages/profile.dart';
import 'package:chat_app/pages/search.dart';
import 'package:chat_app/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _controller;
  int _selectedIndex;

  @override
  void initState() {
    _controller=new PageController(initialPage: 0);
    _selectedIndex=0;
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
              bottomNavigationBar: BottomNavyBar(
                currentIndex: _selectedIndex,
                
                // showElevation: true, // use this to remove appBar's elevation
                onItemSelected: (index) => setState(() {
                      _selectedIndex = index;
                      _controller.animateToPage(index,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease);
                    }),
                items: [
                  BottomNavyBarItem(
                    icon: Icon(LineIcons.home),
                    title: Text('Home',style: TextStyle(fontFamily: "Baloo"),),
                    activeColor: Colors.red,
                  ),
                  BottomNavyBarItem(
                      icon: Icon(LineIcons.search),
                      title: Text('search',style: TextStyle(fontFamily: "Baloo"),),
                      activeColor: Colors.purpleAccent),
                  BottomNavyBarItem(
                      icon: Icon(LineIcons.user),
                      title: Text('Profile',style: TextStyle(fontFamily: "Baloo"),),
                      activeColor: Colors.pink),
                  BottomNavyBarItem(
                      icon: Icon(LineIcons.gear),
                      title: Text('Settings',style: TextStyle(fontFamily: "Baloo"),),
                      activeColor: Colors.blue),
                ],
              ));
        }
      },
    );
  }
}
