import 'package:flutter/material.dart';
import 'package:flutter_firebase/routes.dart';
import 'package:flutter_firebase/system/app_context.dart';
import 'package:flutter_firebase/ui/system/brand-button.dart';
import 'package:flutter_firebase/ui/system/input-text-field.dart';
import 'package:flutter_firebase/ui/system/message-dialog.dart';
import 'package:provider/provider.dart';

class SignInView extends StatefulWidget {
  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  String _usr = '';
  String _pwd = '';

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
                  'Sign in',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(color: Colors.blue),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: InputTextField(
                  key: Key('signin-usr'),
                  hintText: "Email",
                  onChanged: (value) => setState(() {
                    _usr = value;
                    _valid =
                        _usr.isNotEmpty && _pwd.isNotEmpty && _pwd.length > 6;
                  }),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: InputTextField(
                    key: Key('signin-pwd'),
                    obscureText: true,
                    hintText: "Password",
                    onChanged: (value) => setState(() {
                      _pwd = value;
                      _valid =
                          _usr.isNotEmpty && _pwd.isNotEmpty && _pwd.length > 6;
                    }),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, StartUpResetPasswordRoute),
                  child: Text(
                    "Forgotten password?",
                    style: Theme.of(context)
                        .textTheme
                        .overline
                        .copyWith(color: Colors.blue),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 36.0),
                child: BrandButton(
                  key: Key('signin-button'),
                  type: ButtonType.Filled,
                  onPressed: () async {
                    var appContext =
                        Provider.of<AppContext>(context, listen: false);
                    try {
                      await appContext.signIn(_usr, _pwd);
                      Navigator.of(context).pop();
                    } catch (e) {
                      showMessagePrompt(context, e.toString());
                    }
                  },
                  disabled: !_valid,
                  text: "Sign in",
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
