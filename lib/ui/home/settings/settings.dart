import 'package:flutter/material.dart';
import 'package:flutter_firebase/blocs/settings_bloc.dart';
import 'package:flutter_firebase/blocs/settings_email_bloc.dart';
import 'package:flutter_firebase/blocs/settings_password_bloc.dart';
import 'package:flutter_firebase/system/app_context.dart';
import 'package:flutter_firebase/ui/home/settings/settings-email.dart';
import 'package:flutter_firebase/ui/home/settings/settings-password.dart';
import 'package:flutter_firebase/ui/system/forms/button-row.dart';
import 'package:flutter_firebase/ui/system/forms/navigation-row.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatelessWidget {
  final String version;

  const SettingsView({Key key})
      : version = "v Flutter",
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<SettingsBloc>(context);
    bloc.refresh();

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: StreamBuilder<SettingsData>(
        stream: bloc.dataStream,
        builder: (BuildContext context, AsyncSnapshot<SettingsData> snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');

          if (snapshot.hasData)
            return ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                NavigatorRow(
                    label: "Email",
                    onTap: () {
                      AppContext appContext =
                          Provider.of<AppContext>(context, listen: false);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Provider<SettingsEmailBloc>(
                            create: (context) => SettingsEmailBloc(
                              appContext,
                            ),
                            child: SettingsEmailView(),
                          ),
                        ),
                      );
                    }),
                NavigatorRow(
                    label: "Password",
                    onTap: () {
                      AppContext appContext =
                          Provider.of<AppContext>(context, listen: false);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Provider<SettingsPasswordBloc>(
                            create: (context) => SettingsPasswordBloc(
                              appContext,
                            ),
                            child: SettingsPasswordView(),
                          ),
                        ),
                      );
                    }),
                ButtonRow(
                    label: "Logout",
                    color: Colors.red,
                    onTap: () {
                      bloc.signOut();
                      Navigator.of(context).pop();
                    }),
              ],
            );
          else
            return Container();
        },
      ),
    );
  }
}
