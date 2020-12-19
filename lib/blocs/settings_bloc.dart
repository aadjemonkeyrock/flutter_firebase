import 'dart:async';
import 'package:flutter_firebase/system/app_context.dart';

class SettingsData {
}

class SettingsBloc {
  final AppContext appContext;

  SettingsData _data;

  StreamController<SettingsData> _dataController = StreamController();

  SettingsBloc(this.appContext) {
    this._data = SettingsData();

    refresh();
  }

  void dispose() {
    _dataController.close();
  }

  Sink<SettingsData> get dataSink => _dataController.sink;
  Stream<SettingsData> get dataStream => _dataController.stream;

  void refresh() {
    return _checkData();
  }


  Future<void> signOut() async {
    // Then logout
    await appContext.signOut();
  }

  _checkData() {
    dataSink.add(_data);
  }
}
