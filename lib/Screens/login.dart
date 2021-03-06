import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';
import 'package:chat_app/Utils/firebasehelper.dart';
// import 'package:line_icons/line_icons.dart';

GlobalKey<FormState> formKey = GlobalKey<FormState>();
String password, email;
bool obs = false;

void showLoginSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (builder) {
        return new Container(
          margin: EdgeInsets.only(left: 2, right: 2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          ),
          child: new Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(8),
                width: 120,
                height: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color.fromRGBO(222, 222, 230, .6),
                ),
              ),
              Container(
                child: Text("Login",
                    style: TextStyle(fontSize: 28, fontFamily: "Baloo")),
              ),
              GestureDetector(
                child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 16,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(240, 240, 255, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width / 20,
                                left: 8),
                            child: Icon(
                              GroovinMaterialIcons.facebook,
                              color: Colors.blueAccent,
                            )),
                        Container(
                            child: Text(
                          "Facebook Login",
                          style: TextStyle(
                              color: Colors.blueAccent, fontFamily: "Baloo"),
                        ))
                      ],
                    )),
              ),
              GestureDetector(
                onTap: ()=>_googleSignin(context),
                              child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 16,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 240, 240, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width / 20,
                              left: 8),
                          child: Icon(GroovinMaterialIcons.google,
                              color: Colors.deepOrange),
                        ),
                        Container(
                            child: Text(
                          "Google Login",
                          style: TextStyle(
                              color: Colors.deepOrange, fontFamily: "Baloo"),
                        ))
                      ],
                    )),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (ctx) {
                        return SimpleDialog(
                          backgroundColor: Colors.white,
                          contentPadding:
                              EdgeInsets.only(left: 20, right: 20, bottom: 20),
                          title: Text(
                            "Login",
                            style: TextStyle(fontFamily: "Baloo", fontSize: 28),
                          ),
                          children: <Widget>[
                            Form(
                              key: formKey,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(top: 8, bottom: 4),
                                    child: TextFormField(
                                      onSaved: (input) {
                                        email = input;
                                      },
                                      validator: (input) {
                                        if (input.isEmpty)
                                          return 'Provide an email';
                                      },
                                      cursorColor: Colors.indigoAccent,
                                      cursorWidth: 1,
                                      decoration: InputDecoration(
                                        fillColor:
                                            Color.fromRGBO(240, 240, 240, .8),
                                        filled: true,
                                        contentPadding: EdgeInsets.only(
                                            top: 10,
                                            bottom: 10,
                                            left: 12,
                                            right: 6),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        hintText: "Email",
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 4),
                                    child: TextFormField(
                                      obscureText: obs,
                                      onSaved: (input) {
                                        password = input;
                                      },
                                      validator: (input) {
                                        if (input.length < 6)
                                          return 'Provide 6 characters';
                                      },
                                      cursorColor: Colors.indigoAccent,
                                      cursorWidth: 1,
                                      decoration: InputDecoration(
                                        fillColor:
                                            Color.fromRGBO(240, 240, 240, .8),
                                        filled: true,
                                        contentPadding: EdgeInsets.only(
                                            top: 10,
                                            bottom: 10,
                                            left: 12,
                                            right: 6),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        hintText: "Password",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            RaisedButton(
                              textColor: Colors.white,
                              color: Colors.indigoAccent,
                              child: Text("Get Started",
                                  style: TextStyle(fontFamily: "Baloo")),
                              onPressed: () {
                                _login(context);
                              },
                            ),
                          ],
                        );
                      });
                },
                child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 16,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(240, 240, 240, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width / 20,
                                left: 8),
                            child: Icon(
                              Icons.person,
                              color: Colors.black,
                            )),
                        Container(
                            child: Text(
                          "Email & Password",
                          style: TextStyle(
                              color: Colors.black, fontFamily: "Baloo"),
                        ))
                      ],
                    )),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 18, left: 60, right: 60),
                child: Text(
                  "You can now chose one way to login and chat with freinds",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black26),
                ),
              )
            ],
          )),
        );
      });
}

Future<void> _login(BuildContext context) async {
  if (formKey.currentState.validate()) {
    formKey.currentState.save();
    firebaseUser = await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((onValue) {
      print(onValue.uid);
      Navigator.pop(context);
    }).catchError((onError) {
      print(onError);
      showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              contentPadding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              title:
                  Text("Login error!", style: TextStyle(fontFamily: "Baloo")),
              children: <Widget>[
                Text("Failed to log you in with these email & password"),
              ],
            );
          });
    });
  }
}

Future<void> _googleSignin(BuildContext context) async {

    googleSignIn=GoogleSignIn(scopes: ["email",'https://www.googleapis.com/auth/contacts.readonly',]);
    await googleSignIn.signIn().then((onValue){
      print(onValue.email);
    }).catchError((onError){
      showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              contentPadding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              title:
                  Text("Login error!", style: TextStyle(fontFamily: "Baloo")),
              children: <Widget>[
                Text("Failed to log you in :("),
              ],
            );
          });
    });
  
}


  Future<void> googleSignOut() async {
    googleSignIn.disconnect();
  }
