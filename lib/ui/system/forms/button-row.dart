import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  final String label;
  final Color color;
  final void Function() onTap;

  const ButtonRow({
    Key key,
    this.label,
    this.color,
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
                left: 16.0,
                top: 11.0,
                right: 12.0,
                bottom: 11.0,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                    label,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .apply(color: color),
                    textAlign: TextAlign.center,
                  )),
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
