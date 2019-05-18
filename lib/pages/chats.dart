import 'package:chat_app/widgets.dart/message.dart';
import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          Message(date: "3h",uimg: "url",lastmsg: "Hi<3",isactive: true,uname: "Aymen sbh",),
          Message(date: "3h",uimg: "url",lastmsg: "Hi<3",isactive: true,uname: "Aymen sbh",),
          Message(date: "3h",uimg: "url",lastmsg: "Hi<3",isactive: true,uname: "Abdelkader sbh",),
          Message(date: "3h",uimg: "url",lastmsg: "Hi<3",isactive: true,uname: "Merouani Abdelkader sactour",),
          Message(date: "3h",uimg: "url",lastmsg: "Hi<3",isactive: true,uname: "Sebihi abdennour",),
          Message(date: "3h",uimg: "url",lastmsg: "Hi<3",isactive: true,uname: "Rawr XDDD",),
          Message(date: "3h",uimg: "url",lastmsg: "Hi<3",isactive: true,uname: "Aymen sbh",),
          Message(date: "3h",uimg: "url",lastmsg: "Hi<3",isactive: true,uname: "Aymen sbh",),
          Message(date: "3h",uimg: "url",lastmsg: "Hi<3",isactive: true,uname: "Aymen sbh",),
        ],
      ),
    );
  }
}