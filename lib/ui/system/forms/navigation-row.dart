import 'package:flutter/material.dart';

class NavigatorRow extends StatelessWidget {
  final String label;
  final void Function() onTap;

  const NavigatorRow({
    Key key,
    this.label,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          child: Container(
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
                      child: Icon(
                        Icons.chevron_right,
                        color: Colors.grey[300],
                      ),
                      alignment: Alignment.centerRight,
                    ),
                  ),
                ],
              ),
            ),
          ),
          onTap: this.onTap,
        ),
        Divider(
          height: 1.0,
        )
      ],
    );
  }
}
