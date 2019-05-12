import 'package:chat_app/Screens/signup.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,  //work with design later
          children: <Widget>[
            Container(
              child: Text("Hello there!"),
            ),

            RaisedButton(
              child: Text("Login"),
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (ctx)=>new Login())),
            ),

            RaisedButton(
              child: Text("Signup"),
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (ctx)=>new Signup())),
            ),
          ],
        ),
      ),
      
    );
  }
}