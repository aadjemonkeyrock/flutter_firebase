import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/blocs/settings_bloc.dart';
import 'package:flutter_firebase/system/app_context.dart';
import 'package:flutter_firebase/ui/home/settings/settings.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppContext appContext = Provider.of<AppContext>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Provider<SettingsBloc>(
                  create: (context) => SettingsBloc(
                    appContext,
                  ),
                  child: SettingsView(),
                ),
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Text("Hello Flutter Firebase"),
      ),
    );
  }
}
