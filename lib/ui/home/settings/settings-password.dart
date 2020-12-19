import 'package:flutter/material.dart';
import 'package:flutter_firebase/blocs/settings_password_bloc.dart';
import 'package:flutter_firebase/ui/system/forms/text-row.dart';
import 'package:provider/provider.dart';

class SettingsPasswordView extends StatelessWidget {
  const SettingsPasswordView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var bloc = Provider.of<SettingsPasswordBloc>(context);

    return StreamBuilder<SettingsPasswordData>(
      stream: bloc.dataStream,
      builder:
          (BuildContext context, AsyncSnapshot<SettingsPasswordData> snapshot) {
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');

        if (snapshot.hasData)
          return Scaffold(
            appBar: AppBar(
              title: Text("Change email"),
              actions: <Widget>[
                FlatButton(
                  onPressed: snapshot.data.valid
                      ? () async {
                          bloc.changePassword();
                          Navigator.of(context).pop();
                        }
                      : null,
                  child: Text('Save'),
                  textColor: Colors.white,
                )
              ],
            ),
              body: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  TextRow(
                    label: "Current password",
                    text: snapshot.data.currentPassword,
                    obscureText: true,
                    onChanged: bloc.updateCurrentPassword,
                  ),
                  TextRow(
                    label: "New password",
                    text: snapshot.data.newPassword,
                    obscureText: true,
                    onChanged: bloc.updateNewPassword,
                  ),
                  TextRow(
                    label: "Confirm password",
                    text: snapshot.data.confirmPassword,
                    obscureText: true,
                    onChanged: bloc.updateConfirmPassword,
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
