import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/system/app_context.dart';

class SettingsEmailData {
  String password = "";
  String email = "";
  bool verified = false;
  bool valid = false;

  SettingsEmailData();
}

class SettingsEmailBloc {
  final AppContext appContext;

  SettingsEmailData _data;

  StreamController<SettingsEmailData> _dataController = StreamController();

  SettingsEmailBloc(this.appContext) {
    var user = appContext.currentUser;

    this._data = SettingsEmailData();
    this._data.email = user.email;
    this._data.verified = user.emailVerified;

    refresh();
  }

  void dispose() {
    _dataController.close();
  }

  Sink<SettingsEmailData> get dataSink => _dataController.sink;
  Stream<SettingsEmailData> get dataStream => _dataController.stream;

  void refresh() {
    return _checkData();
  }

  _checkData() {
    // Must verify the data
    this._data.valid =
        (this._data.password.length >= 6 && this._data.email.length >= 5);

    print(this._data.valid);

    dataSink.add(_data);
  }

  void updatePassword(String name) {
    _data.password = name;

    _checkData();
  }

  void updateEmail(String name) {
    _data.email = name;
    _checkData();
  }

  void changeEmail() async {
    // this will update the user email

    // 1. reauthenticate
    var user = appContext.currentUser;
    var credential = EmailAuthProvider.credential(
        email: user.email, password: _data.password);
    await user.reauthenticateWithCredential(credential);

    // 2. update autentication email
    await user.updateEmail(_data.email);
    print('Updated the email');

    // 3. Update the user email
    // await FirebaseFirestore.instanceFor(app: appContext.fb)
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .update({'email': _data.email, 'updated': DateTime.now()});

    // 3. send email verification
    await user.sendEmailVerification();
  }
}
