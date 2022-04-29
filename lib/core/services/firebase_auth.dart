import 'dart:developer';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<bool> signUpUserwithEmailAndPassword(String email, String password) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Fluttertoast.showToast(msg: 'User Created');
      return true;
    } on FirebaseAuthException catch (e) {
      log(e.toString(), name: 'Auth Exception');
      Fluttertoast.showToast(msg: e.message.toString());
      return false;
    }
  }

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Fluttertoast.showToast(msg: 'User Logged In');
      return true;
    } on FirebaseAuthException catch (e) {
      log(e.toString(), name: 'Auth Exception');
      Fluttertoast.showToast(msg: e.message.toString());
      return false;
    }
  }

  Future<bool> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await firebaseAuth.signInWithCredential(credential);
      return true;
    } on FirebaseAuthException catch (e) {
      log(e.toString(), name: 'Auth Exception');
      Fluttertoast.showToast(msg: e.message.toString());
      return false;
    }
  }

  Future<bool> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      switch (result.status) {
        case LoginStatus.success:
          final AuthCredential facebookCredential = FacebookAuthProvider.credential(result.accessToken!.token);
          final userCredential = await firebaseAuth.signInWithCredential(facebookCredential);

          Fluttertoast.showToast(msg: 'Facebook Signed In');
          return true;
        case LoginStatus.cancelled:
          return false;
        case LoginStatus.failed:
          return false;
        default:
          return false;
      }
    } on FirebaseAuthException catch (e) {
      log(e.toString(), name: 'Auth Exception');
      Fluttertoast.showToast(msg: e.message.toString());
      return false;
    }
  }
}
