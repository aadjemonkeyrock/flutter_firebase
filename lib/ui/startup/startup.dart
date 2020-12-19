import 'package:flutter/material.dart';
import 'package:flutter_firebase/routes.dart';
import 'package:flutter_firebase/ui/system/brand-button.dart';

class StartUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: Center(
        child: Container(
          constraints: BoxConstraints(minWidth: 200, maxWidth: 320),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: BrandButton(
                  type: ButtonType.Filled,
                  onPressed: () =>
                      Navigator.pushNamed(context, StartUpSignUpRoute),
                  text: "Register",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 14.0, left: 0.0, right: 0.0),
                child: Center(
                  child: Text(
                    'By signing up you agree with our Terms and Privacy policy',
                    style: Theme.of(context).textTheme.caption,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Divider(
                height: 36.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Center(
                  child: Text('Already have an account?',
                      style: Theme.of(context).textTheme.bodyText1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: BrandButton(
                  key: Key("startup-signin"),
                  type: ButtonType.Flat,
                  onPressed: () =>
                      Navigator.pushNamed(context, StartUpSignInRoute),
                  text: 'Sign in',
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
