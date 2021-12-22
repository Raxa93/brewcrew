// ignore_for_file: file_names, use_key_in_widget_constructors, unused_field, prefer_const_literals_to_create_immutables, avoid_print
import 'package:brew_crew/Models/myUser.dart';

import 'package:brew_crew/Shared/constants.dart';
import 'package:brew_crew/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormSetting extends StatefulWidget {
  @override
  _FormSettingState createState() => _FormSettingState();
}

class _FormSettingState extends State<FormSetting> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4', '5'];

  String _currentName;
  String _currentSugar = "0";
  dynamic _currentStrength;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);

    return StreamBuilder<UserData>(
        stream: DataBaseServices(uid: user?.Uid).userData,
        builder: (context, snapshot) {
          // if (snapshot.hasData) {
          // UserData userdata = snapshot.data;
          //print('Username ${userdata.name}');
          return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  'Update your Brew Settings',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 20),
                TextFormField(
                  initialValue: _currentName,
                  decoration:
                      textInputDecoration.copyWith(hintText: 'Enter Name'),
                  onChanged: (val) => setState(() => _currentName = val),
                  validator: (val) => val.isEmpty ? 'Please Enter value' : null,
                ),
                SizedBox(height: 20),
                DropdownButtonFormField(
                  decoration: textInputDecoration,
                  onChanged: (val) =>
                      setState(() => _currentSugar = val as String),
                  value: _currentSugar ?? _currentSugar,
                  items: sugars.map((sugar) {
                    return DropdownMenuItem(
                      value: sugar,
                      child: Text('$sugar Sugars'),
                    );
                  }).toList(),
                ),
                Slider(
                    value: (_currentStrength ?? 100).toDouble(),
                    min: 100,
                    max: 900,
                    divisions: 8,
                    activeColor: Colors.brown[_currentStrength ?? 100],
                    inactiveColor: Colors.brown[_currentStrength ?? 100],
                    onChanged: (val) =>
                        setState(() => _currentStrength = val.round())),
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () async {},
                    child: Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          );
          // } else {
          // return Loading();
          // }
        });
  }
}
