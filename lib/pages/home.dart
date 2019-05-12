import 'package:flutter/material.dart';

import 'chats.dart';
import 'groups.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  TabController _controller;

  @override
  void initState() {

      _controller=new TabController(length: 2,vsync: this);

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
        title: Text("Chats"),
        bottom: TabBar(
          controller: _controller,
          tabs: <Widget>[
          Tab(text: "Messages",),
          Tab(text: "Groups",),            
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,

        children: <Widget>[
          Chats(),
          Groups()
        ],

      ),
      //floatin action button ????
    );
  }
}