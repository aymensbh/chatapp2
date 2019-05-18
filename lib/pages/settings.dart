import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("Settings"),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 12),
            child: Icon(LineIcons.gears))
        ],
      ),
    );
  }
}