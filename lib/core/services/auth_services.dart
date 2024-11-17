import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthServices {
  final auth = FirebaseAuth.instance;
  Future<User?> createUserWithEmailAndPassword(
      String email, String password, context) async {
    try {
      final cred = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return cred.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text("Password is too weak. It must be at least 8 characters."),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("The email is already in use."),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
        log('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("The email address is not valid."),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
        log('Invalid email address.');
      }
    } catch (e) {
      log("$e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("An unexpected error occurred. Please try again."),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password, context) async {
    try {
      final cred = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return cred.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("No user found for that email."),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Wrong password provided."),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
        log('Wrong password provided for that user.');
      }
    } catch (e) {
      log("$e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("An unexpected error occurred. Please try again."),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
    return null;
  }

  Future<void> signout() async {
    try {
      await auth.signOut();
    } catch (e) {
      log(e.toString());
    }
  }
}
