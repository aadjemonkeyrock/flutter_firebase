import 'package:flutter/material.dart';

class CheckRow extends StatelessWidget {
  final String label;
  final bool value;

  const CheckRow({
    Key key,
    this.label,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.only(
            left: 16.0, top: 9.0, right: 12.0, bottom: 9.0),
        child: Row(
          children: <Widget>[
            Text(
              label,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Expanded(
              child: Align(
                child: value
                    ? Icon(
                        Icons.check,
                        color: Colors.blue,
                      )
                    : Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                alignment: Alignment.centerRight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
