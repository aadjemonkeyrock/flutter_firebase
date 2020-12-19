import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/system/app_context.dart';

class SettingsPasswordData {
  String currentPassword = "";
  String newPassword = "";
  String confirmPassword = "";
  bool valid = false;
}

class SettingsPasswordBloc {
  final AppContext appContext;

  SettingsPasswordData _data;

  StreamController<SettingsPasswordData> _dataController = StreamController();

  SettingsPasswordBloc(this.appContext) {
    this._data = SettingsPasswordData();

    refresh();
  }

  void dispose() {
    _dataController.close();
  }

  Sink<SettingsPasswordData> get dataSink => _dataController.sink;
  Stream<SettingsPasswordData> get dataStream => _dataController.stream;

  void refresh() {
    return _checkData();
  }

  _checkData() {
    _data.valid = (_data.currentPassword.length > -6 &&
        _data.newPassword.length > 6 &&
        _data.confirmPassword.length > 6 &&
        _data.newPassword == _data.confirmPassword);

    dataSink.add(_data);
  }

  void updateCurrentPassword(String value) {
    _data.currentPassword = value;
    _checkData();
  }

  void updateNewPassword(String value) {
    _data.newPassword = value;
    _checkData();
  }

  void updateConfirmPassword(String value) {
    _data.confirmPassword = value;
    _checkData();
  }

  void changePassword() async {

    // 1. reauthenticate
    var user = appContext.currentUser;
    var credential = EmailAuthProvider.credential(
        email: user.email, password: _data.currentPassword);
    await user.reauthenticateWithCredential(credential);

    // 2. Update the password
    await user.updatePassword(_data.newPassword);

  }
}
