import 'package:flutter/material.dart';
import 'package:flutter_firebase/ui/startup/register.dart';
import 'package:flutter_firebase/ui/startup/reset-password.dart';
import 'package:flutter_firebase/ui/startup/signin.dart';
import 'package:flutter_firebase/ui/startup/startup.dart';

const String StartUpRoute = '/startup';
const String StartUpSignUpRoute = '/startup/sign-up';
const String StartUpSignInRoute = '/startup/sign-in';
const String StartUpResetPasswordRoute = '/startup/reset-password';


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case StartUpRoute:
      return MaterialPageRoute(builder: (context) => StartUp());
    case StartUpSignUpRoute:
      return MaterialPageRoute(builder: (context) => RegisterView());
    case StartUpSignInRoute:
      return MaterialPageRoute(builder: (context) => SignInView());
    case StartUpResetPasswordRoute:
      return MaterialPageRoute(builder: (context) => ResetPasswordView());

    default:
      return MaterialPageRoute(builder: (context) => StartUp());
  }
}
