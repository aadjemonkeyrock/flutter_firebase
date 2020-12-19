import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: Center(
        child: Text("Loading...")
      ),
    );
  }
}
