import 'package:flutter/material.dart';

class FooterRow extends StatelessWidget {
  final String label;

  const FooterRow({
    Key key,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 12.0, top: 8.0, bottom: 8.0),
            child: label.length > 0
                ? Text(
                    label,
                    style: Theme.of(context)
                        .textTheme
                        .overline
                        .copyWith(color: Colors.grey),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
