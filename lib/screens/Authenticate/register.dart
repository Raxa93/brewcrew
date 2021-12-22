// ignore_for_file: use_key_in_widget_constructors, unused_field, avoid_print, prefer_const_constructors_in_immutables

import 'package:brew_crew/Shared/Loading.dart';
import 'package:brew_crew/Shared/constants.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleview;
  Register({@required this.toggleview});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              title: Text('Register to Brew Crew'),
              backgroundColor: Colors.brown[400],
              actions: <Widget>[
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(primary: Colors.brown[400]),
                    onPressed: () {
                      widget.toggleview();
                    },
                    icon: Icon(Icons.person),
                    label: Text('Sign in'))
              ],
            ),
            body: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Email'),
                        validator: (String value) {
                          if (value != null && value.isEmpty) {
                            return "Username can't be empty";
                          }
                          return null;
                        },
                        onChanged: (val) {
                          setState(() {
                            username = val;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Password'),
                        validator: (String value) {
                          if (value != null && value.length < 6) {
                            return "Password must be 6 char long";
                          }
                          return null;
                        },
                        obscureText: true,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.brown[400]),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              dynamic result =
                                  await _auth.registerWithEmailandPassword(
                                      username, password);
                              setState(() {
                                loading = true;
                              });
                              if (result == null) {
                                setState(() {
                                  loading = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Failed to Register !')));
                              }
                            }
                          },
                          child: Text('Register'))
                    ],
                  )),
            ));
  }
}
