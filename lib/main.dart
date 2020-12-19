import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/user.dart';
import 'package:flutter_firebase/routes.dart';
import 'package:flutter_firebase/system/app_context.dart';
import 'package:flutter_firebase/ui/home.dart';
import 'package:flutter_firebase/ui/startup/loading.dart';
import 'package:flutter_firebase/ui/startup/startup.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppContext>(create: (_) => AppContext()..init()),
      ],
      child: MaterialApp(
        title: 'Flutter Firebase',
        onGenerateRoute: generateRoute,
        home: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppContext appContext = Provider.of<AppContext>(context);

    return StreamBuilder<User>(
      stream: appContext.onUserChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loading();
        } else {
          if (snapshot.hasData) {
            return HomeScreen();
          }

          return StartUp();
        }
      },
    );
  }
}
