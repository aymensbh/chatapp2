import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Search"),
        actions: <Widget>[
          IconButton(
            icon: Icon(LineIcons.search),
            onPressed: (){},
          )
        ],
      ),

      body: Container(),
    );
  }
}