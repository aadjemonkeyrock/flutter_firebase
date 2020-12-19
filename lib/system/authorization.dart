import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {

  FirebaseAuth _firebaseAuth;

  Auth() {
    _firebaseAuth = FirebaseAuth.instance;
  }

  Future<UserCredential> signIn(String email, String password) async {
    // return just the result
    return await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> signUp(String email, String password, String name) async {
    // Create the auth user
    UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

    // Set the display name
    var user = result.user;
    if (user != null) {
      user.updateProfile(displayName: name);
    }

    return result;
  }

  User get currentUser => _firebaseAuth.currentUser;
  
  Future<void> sendPasswordReset(String email) async {
    return _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}
