import 'package:flutter/material.dart';
import 'package:chat_app/Utils/firebasehelper.dart';
import 'package:line_icons/line_icons.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Profile"),
        actions: <Widget>[
          Container(
              padding: EdgeInsets.only(right: 12), child: Icon(LineIcons.user))
        ],
      ),
    );
  }
}
