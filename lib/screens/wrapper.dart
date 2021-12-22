// ignore_for_file: unnecessary_null_comparison

import 'package:brew_crew/Models/myUser.dart';
import 'package:brew_crew/screens/Authenticate/authenticate.dart';
import 'package:brew_crew/screens/Home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);

    if (user == null) {
      return authenticate();
    } else {
      return Home();
    }
  }
}
