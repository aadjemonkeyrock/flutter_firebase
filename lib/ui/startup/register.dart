import 'package:flutter/material.dart';
import 'package:flutter_firebase/system/app_context.dart';
import 'package:flutter_firebase/ui/system/brand-button.dart';
import 'package:flutter_firebase/ui/system/input-text-field.dart';
import 'package:flutter_firebase/ui/system/message-dialog.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String _usr = '';
  String _pwd = '';
  String _name = '';

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
                  'Create an Account',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(color: Colors.blue),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: InputTextField(
                  hintText: "Name",
                  onChanged: (value) => setState(() {
                    _name = value;
                    _valid = _name.isNotEmpty &&
                        _usr.isNotEmpty &&
                        _pwd.isNotEmpty &&
                        _pwd.length > 6;
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: InputTextField(
                  hintText: "Email",
                  onChanged: (value) => setState(() {
                    _usr = value;
                    _valid = _name.isNotEmpty &&
                        _usr.isNotEmpty &&
                        _pwd.isNotEmpty &&
                        _pwd.length > 6;
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: InputTextField(
                  obscureText: true,
                  hintText: "Password",
                  onChanged: (value) => setState(() {
                    _pwd = value;
                    _valid = _name.isNotEmpty &&
                        _usr.isNotEmpty &&
                        _pwd.isNotEmpty &&
                        _pwd.length > 6;
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
                      await appContext.signUp(_usr, _pwd, _name);
                      print("Register - after signUp");
                      Navigator.of(context).pop();
                    } catch (e) {
                      showMessagePrompt(context, e.toString());
                    }
                  },
                  text: "Register",
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
