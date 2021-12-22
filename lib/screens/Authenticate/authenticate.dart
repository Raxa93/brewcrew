// ignore_for_file: camel_case_types, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:brew_crew/screens/Authenticate/register.dart';
import 'package:brew_crew/screens/Authenticate/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class authenticate extends StatefulWidget {
  @override
  _authenticateState createState() => _authenticateState();
}

class _authenticateState extends State<authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return signIn(toggleview: toggleView);
    } else {
      return Register(toggleview: toggleView);
    }
  }
}
