import 'package:flutter/material.dart';
import 'package:flutter_firebase/system/app_context.dart';
import 'package:flutter_firebase/ui/system/brand-button.dart';
import 'package:flutter_firebase/ui/system/input-text-field.dart';
import 'package:flutter_firebase/ui/system/message-dialog.dart';
import 'package:provider/provider.dart';

class ResetPasswordView extends StatefulWidget {
  @override
  _ResetPasswordViewState createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  String _usr = '';

  bool _valid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(minWidth: 200, maxWidth: 320),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'What is your email?',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(color: Colors.blue),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: InputTextField(
                  hintText: "Email",
                  onChanged: (value) => setState(() {
                    _usr = value;
                    _valid = _usr.isNotEmpty;
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: BrandButton(
                  type: ButtonType.Filled,
                  disabled: !_valid,
                  onPressed: () async {
                    var appContext =
                        Provider.of<AppContext>(context, listen: false);
                    try {
                      await appContext.sendPasswordReset(_usr);
                      Navigator.of(context).pop();
                    } catch (e) {
                      showMessagePrompt(context, e.toString());
                    }
                  },
                  text: "Reset Password",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
