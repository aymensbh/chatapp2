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
  Color color0 = Colors.indigoAccent,
      color1 = Colors.black,
      color2 = Colors.black,
      color3 = Colors.black;

  void change(int index) {
    color0 = Colors.black;
    color1 = Colors.black;
    color2 = Colors.black;
    color3 = Colors.black;

    setState(() {
      switch (index) {
      case 0:
      color0=Colors.indigoAccent;
        break;
      case 1:
      color2=Colors.indigoAccent;
        break;
      case 2:
      color2=Colors.indigoAccent;
        break;
      case 3:
      color3=Colors.indigoAccent;
        break;
    }
    });

    
  }

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
              onPageChanged: (index){
                change(index);
              },
              controller: _controller,
              children: <Widget>[
                Home(),
                Search(),
                Profile(),
                Settings(),
              ],
            ),
            bottomNavigationBar: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height / 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        LineIcons.home,
                        color: color0,
                      ),
                      onPressed: () {
                        _controller.animateToPage(
                          0,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      }),
                  IconButton(
                      icon: Icon(
                        LineIcons.search,
                        color: color1,
                      ),
                      onPressed: () {
                        _controller.animateToPage(
                          1,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      }),
                  IconButton(
                      icon: Icon(
                        LineIcons.user,
                        color: color2,
                      ),
                      onPressed: () {
                        _controller.animateToPage(
                          2,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      }),
                  IconButton(
                      icon: Icon(
                        LineIcons.cogs,
                        color: color3,
                      ),
                      onPressed: () {
                        _controller.animateToPage(
                          3,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      }),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
