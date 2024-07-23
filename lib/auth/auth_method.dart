// ignore_for_file: deprecated_member_use

import 'dart:ffi';

import 'package:collab_notion_clone/auth/coreFireBaseProvider/coreFireBaseProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod/riverpod.dart';

final authMethodProvider = Provider(
  (ref) => AuthMethod(
    auth: ref.read(fireBaseAuthProvider),
    googleSignIn: ref.read(googleSignInProvider),
    firestore: ref.read(firebaseFirestoreProvider),
  ),
);

class AuthMethod extends ChangeNotifier {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firestore;

  AuthMethod({
    required FirebaseAuth auth,
    required GoogleSignIn googleSignIn,
    required FirebaseFirestore firestore,
  })  : _auth = auth,
        _googleSignIn = googleSignIn,
        _firestore = firestore;

  // Stream<User?> get authStateChange => _auth.authStateChanges();

  void signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCred = await _auth.signInWithCredential(credential);
      print(userCred.user?.displayName);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<String> newUserCreationUsingEmailAndPassword(String email, String password) async {
    String res = "User-Creation";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.createUserWithEmailAndPassword(email: email, password: password);
        res = "User-Created";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> oldUserLoginUsingEmailAndPassword(String email, String password) async {
    String res = "User-Logging";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        res = "OlduserEntry";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
