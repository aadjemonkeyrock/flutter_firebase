import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showMessagePrompt(BuildContext context, String message) {
    // showCupertinoDialog(
    showDialog(barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        // title: Text("Title"),
        content: Text(message),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text("OK"),
            isDefaultAction: true,
            onPressed: () { Navigator.of(context).pop(); },
          ),
        ],
      ),
    );
  }