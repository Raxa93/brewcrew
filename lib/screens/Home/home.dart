// ignore_for_file: avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:brew_crew/Models/brew.dart';
import 'package:brew_crew/screens/Home/brew_list.dart';
import 'package:brew_crew/screens/Home/settingForm.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    void _showPanelSettings() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                child: FormSetting());
          });
    }

    return StreamProvider<List<Brew>>.value(
      value: DataBaseServices().brews,
      initialData: null,
      child: Scaffold(
          backgroundColor: Colors.brown[100],
          appBar: AppBar(
            backgroundColor: Colors.brown[400],
            title: Text('Brew Crew'),
            actions: <Widget>[
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(primary: Colors.brown[400]),
                  onPressed: () async {
                    await _auth.Sign_out();
                  },
                  icon: Icon(Icons.person),
                  label: Text('Log out')),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(primary: Colors.brown[400]),
                  onPressed: () async {
                    _showPanelSettings();
                  },
                  icon: Icon(Icons.settings),
                  label: Text('Settings'))
            ],
          ),
          body: Brewlist()),
    );
  }
}
