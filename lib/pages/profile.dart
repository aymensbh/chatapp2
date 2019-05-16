import 'package:flutter/material.dart';
import 'package:chat_app/Utils/firebasehelper.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: RaisedButton(
          child: Text("disconnect"),
          onPressed: (){
            firebaseAuth.signOut();
          },
        ),
      ),
    );
  }
}