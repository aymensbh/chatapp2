import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'chats.dart';
import 'groups.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    _controller = new TabController(length: 2, vsync: this);

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
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text(
          "iChats",
          style: TextStyle(fontFamily: "Baloo"),
        ),
        bottom: TabBar(
          controller: _controller,
          tabs: <Widget>[
            Tab(
              text: "Messages",
              icon: Icon(LineIcons.comments_o),
            ),
            Tab(
              text: "Groups",
              icon: Icon(LineIcons.group),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[Chats(), Groups()],
      ),
      //floatin action button ????
    );
  }
}
