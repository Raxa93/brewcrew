// ignore_for_file: unused_field, avoid_print, unused_local_variable, unused_element, unnecessary_null_comparison, non_constant_identifier_names

import 'package:brew_crew/Models/myUser.dart';
import 'package:brew_crew/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create user obj
  MyUser _userfromFirebase(User user) {
    return user != null ? MyUser(Uid: user.uid) : null;
  }

  //auth change user stream
  Stream<MyUser> get user {
    return _auth.authStateChanges().map(_userfromFirebase);
  }

  //Singin Ann
  Future signInAnom() async {
    try {
      await Firebase.initializeApp();
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userfromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Register with username and Password
  Future registerWithEmailandPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      //Create document for new user using UID
      if (user != null) {
        await DataBaseServices(uid: user.uid)
            .UpdateUserData('NewMember', '0', 100);
      }
      return _userfromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //SignIn with credentia
  Future SigninWithEmailandPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userfromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //signout
  Future Sign_out() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
