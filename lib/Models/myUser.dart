// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

class MyUser {
  final String Uid;

  MyUser({this.Uid});
}

class UserData {
  String uid;
  String name;
  String sugar;
  int strength;

  UserData(
      {@required this.uid,
      @required this.name,
      @required this.sugar,
      @required this.strength});
}
