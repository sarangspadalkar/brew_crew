import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  final CollectionReference brewCollection = FirebaseFirestore.instance
      .collection('brews');

  Future updateUserDate(int sugars, int strength, String name) async {
    return await brewCollection.doc(uid).set({
      'sugars': sugars,
      'strength': strength,
      'name': name,
    });
  }
}
