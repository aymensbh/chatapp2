import 'package:chat_app/Screens/homepage.dart';
import 'package:chat_app/Screens/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'firebasehelper.dart';

class Router extends StatefulWidget {
  @override
  _RouterState createState() => _RouterState();
}

class _RouterState extends State<Router> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
      stream: firebaseAuth.onAuthStateChanged,
      builder: (context,snapshot){
        if(snapshot.hasData){
          firebaseUser=snapshot.data;
          return HomePage();
        }else{
          return WelcomePage();
        }
      },
    );
  }
}