import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as FA;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase/models/user.dart';
import 'package:flutter_firebase/system/authorization.dart';

class AppContext {
  Auth _auth;
  User _user;

  Map<String, dynamic> _config;
  FirebaseApp _fb;

  StreamController<User> _onUserChanged = StreamController();

  AppContext();

  void init() async {
    _fb = await Firebase.initializeApp();

    // Create the authorization
    _auth = Auth();

    // Set listener on the Auth changes
    FA.FirebaseAuth.instance
        .authStateChanges()
        .listen((firebaseUser) async {
      // If authenticated (we have a user) fetch the user from Firestore
      print("onAuthStateChange: $firebaseUser");
      if (firebaseUser != null) {
        print(" - got user: ${firebaseUser.displayName}");
        try {
          // Need to fetch the matching user,
          var document = await FirebaseFirestore.instance
              .collection("users")
              .doc(firebaseUser.uid)
              .get();
          _user = User.fromDocument(document);

          _onUserChanged.sink.add(_user);
        } catch (exception, stackTrace) {
          print("problem: $exception");
          _user = null;
          _onUserChanged.addError(exception, stackTrace);
        }
      } else {
        print(" -- no user");
        _user = null;
        _onUserChanged.sink.add(_user);
      }
    });
  }

  void dispose() {
    _onUserChanged.close();
  }

  User get user => _user;
  FirebaseApp get fb => _fb;

  Stream<User> get onUserChanged => _onUserChanged.stream;

  FA.User get currentUser => _auth.currentUser;

  Future<String> getIdToken() async {
    return await currentUser.getIdToken();
  }

  String get apiUrl => _config['apiUrl'];

  // Authentication
  // --------------
  Future<void> signUp(String email, String password, String name) async {
    // Call the signup
    FA.UserCredential result = await _auth.signUp(email, password, name);

    // Create the 'user' in the database
    DateTime now = DateTime.now();
    Map<String, Object> data = {
      'name': name,
      'email': email,
      'created': now,
      'updated': now,
    };

    await FirebaseFirestore.instance
        .collection("users")
        .doc(result.user.uid)
        .set(data);

    if (result.user != null) {
      result.user.sendEmailVerification();
    }
  }

  Future<void> signIn(String email, String password) async {
    await _auth.signIn(email, password);
  }

  Future<void> signOut() {
    return _auth.signOut();
  }

  Future<void> sendPasswordReset(String email) {
    return _auth.sendPasswordReset(email);
  }
}
