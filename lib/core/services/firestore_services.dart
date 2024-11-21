import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  CollectionReference users = FirebaseFirestore.instance.collection("users");

  Future<void> addUser(String name, String email, String uid, String imageUrl,
      String phone) async {
    await users
        .add({
          "name": name,
          "email": email,
          "uid": uid,
          "imageUrl": imageUrl,
          "phone": phone
        })
        .then((value) => log("user added"))
        .catchError((error) => log("Failed to add user: $error"));
  }

  static Future<List<QueryDocumentSnapshot<Object?>>> getUsersData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("users").get();
    List<QueryDocumentSnapshot> usersData =[];
    usersData.addAll(querySnapshot.docs);
    return usersData;
  }
}
