import 'package:flutter/material.dart';
import 'package:flutter_firebase/blocs/settings_email_bloc.dart';
import 'package:flutter_firebase/ui/system/forms/check-row.dart';
import 'package:flutter_firebase/ui/system/forms/text-row.dart';
import 'package:provider/provider.dart';

class SettingsEmailView extends StatelessWidget {
  const SettingsEmailView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var bloc = Provider.of<SettingsEmailBloc>(context);

    return StreamBuilder<SettingsEmailData>(
      stream: bloc.dataStream,
      builder:
          (BuildContext context, AsyncSnapshot<SettingsEmailData> snapshot) {
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');

        if (snapshot.hasData)
          return Scaffold(
            appBar: AppBar(
              title: Text("Change email"),
              actions: <Widget>[
                FlatButton(
                  onPressed: snapshot.data.valid
                      ? () async {
                          bloc.changeEmail();
                          Navigator.of(context).pop();
                        }
                      : null,
                  child: Text('Save'),
                  textColor: Colors.blue,
                )
              ],
            ),
            body: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                TextRow(
                  label: "Password",
                  text: snapshot.data.password,
                  obscureText: true,
                  onChanged: bloc.updatePassword,
                ),
                TextRow(
                  label: "Email",
                  text: snapshot.data.email,
                  onChanged: bloc.updateEmail,
                ),
                CheckRow(
                  label: "Verified",
                  value: snapshot.data.verified,
                )
              ],
            ),
          );
        else
          return Container();
      },
    );
  }
}
