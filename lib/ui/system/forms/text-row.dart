import 'package:flutter/material.dart';

class TextRow extends StatelessWidget {
  final String label;
  final String text;
  final bool showLabel;
  final bool obscureText;
  final Function(String) onChanged;

  const TextRow({
    Key key,
    this.label,
    this.text,
    this.showLabel = true,
    this.obscureText = false,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Theme.of(context).cardColor,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 16.0, top: 4.0, right: 12.0, bottom: 4.0),
            child: this.showLabel
                ? Row(
                    children: <Widget>[
                      Text(
                        label,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Expanded(
                        child: TextFormField(
                          textAlign: TextAlign.end,
                          obscureText: obscureText,
                          decoration: InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                          ),
                          style: Theme.of(context).textTheme.bodyText1,
                          initialValue: text,
                          onChanged: onChanged,
                        ),
                      ),
                    ],
                  )
                : TextFormField(
                    onChanged: this.onChanged,
                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      hintText: label,
                    ),
                    style: Theme.of(context).textTheme.bodyText1,
                    initialValue: text,
                  ),
          ),
        ),
        Divider(
          height: 1,
        ),
      ],
    );
  }
}
