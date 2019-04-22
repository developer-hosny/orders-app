import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// final GoogleSignIn _googleSignIn = GoogleSignIn();
// final FirebaseAuth _auth = FirebaseAuth.instance;

class User {
  final String id;
  final String email;
  final String password;

  User({@required this.id, @required this.email, this.password});
}