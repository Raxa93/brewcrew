// ignore_for_file: non_constant_identifier_names, unused_element

import 'package:brew_crew/Models/brew.dart';
import 'package:brew_crew/Models/myUser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseServices {
  final String uid;
  DataBaseServices({this.uid});
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brew');

  Future UpdateUserData(String name, String sugar, int strength) async {
    return await brewCollection
        .doc(uid)
        .set({'name': name, 'sugars': sugar, 'strength': strength});
  }

//Brew list from snapshot

  List<Brew> _brewlistFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Brew(
          name: doc.get('name') ?? '',
          sugars: doc.get('sugars') ?? 0,
          strength: doc.get('strength') ?? '0');
    }).toList();
  }

//User data from snapshot
  UserData _userDataFromSnapShot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot['name'],
        sugar: snapshot['sugar'],
        strength: snapshot['strength']);
  }

//Get brew stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewlistFromSnapshot);
  }

  //Get user Doc stream
  Stream<UserData> get userData {
    return brewCollection.doc(uid).snapshots().map(_userDataFromSnapShot);
  }
}
