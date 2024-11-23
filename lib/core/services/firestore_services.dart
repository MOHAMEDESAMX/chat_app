import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  CollectionReference users = FirebaseFirestore.instance.collection("users");

  Future<void> addUser(String name, String email, String uid, String imageUrl,
      String phone) async {
    try {
      await users
          .doc(uid)
          .set({
            "name": name,
            "email": email,
            "uid": uid,
            "imageUrl": imageUrl,
            "phone": phone
          })
          .then((value) => log("User added or updated"))
          .catchError((error) => log("Failed to add user: $error"));
    } catch (e) {
      log("Error adding user: $e");
    }
  }

  static Future<List<QueryDocumentSnapshot<Object?>>> getUsersData() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("users").get();
      List<QueryDocumentSnapshot> usersData = [];
      usersData.addAll(querySnapshot.docs);
      return usersData;
    } catch (e) {
      log("Error getting users data: $e");
      return [];
    }
  }
}
