// ignore_for_file: unused_local_variable, avoid_print, use_key_in_widget_constructors

import 'package:brew_crew/Models/brew.dart';
import 'package:brew_crew/screens/Home/brew_tile.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Brewlist extends StatefulWidget {
  @override
  _BrewlistState createState() => _BrewlistState();
}

class _BrewlistState extends State<Brewlist> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context);
    return ListView.builder(
      itemCount: brews?.length,
      itemBuilder: (context, index) {
        return BrewTile(brew: brews[index]);
      },
    );
  }
}
