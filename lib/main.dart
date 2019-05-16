import 'package:flutter/material.dart';

import 'Utils/router.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat app',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(80, 160, 160, 1),
        accentColor: Colors.white,
        appBarTheme: AppBarTheme(elevation: 1),
        canvasColor: Colors.transparent,
        tabBarTheme: TabBarTheme(
          labelStyle: TextStyle(fontFamily: "Baloo"),
          unselectedLabelStyle: TextStyle(fontFamily: "Baloo"),
          labelColor: Colors.white,

        ),
      ),
      home: Router(),
      debugShowCheckedModeBanner: false,
    );
  }
}