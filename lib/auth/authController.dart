// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

import 'package:collab_notion_clone/Screens/HomePart/home_screen.dart';
import 'package:collab_notion_clone/auth/auth_method.dart';

final authControllerProvider = Provider(
  (ref) => AuthController(
    authMethod: ref.read(authMethodProvider),
  ),
);

class AuthController {
  final AuthMethod _authMethod;
  AuthController({required AuthMethod authMethod}) : _authMethod = authMethod;

  Future<void> googleSignIn(context) async {
    String res = await _authMethod.signInWithGoogle();
    if (res == "GoogleSignIn") {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      print("GoogleSignIN mai issue");
    }
  }

  Future<void> newUserCreation(String email, String password, context) async {
    String res = await _authMethod.newUserCreationUsingEmailAndPassword(email, password);
    if (res == "User-Created") {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      print("User creation failed: $res");
    }
  }

  Future<void> oldUserEntry(String email, String password, context) async {
    String res = await _authMethod.oldUserLoginUsingEmailAndPassword(email, password);
    if (res == "OlduserEntry") {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      print("Old user login failed: $res");
    }
  }
}
