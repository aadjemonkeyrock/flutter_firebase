import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final bool obscureText;
  final String hintText;
  final Function(String) onChanged;

  const InputTextField(
      {Key key, this.obscureText = false, this.hintText, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    InputBorder border = OutlineInputBorder(
        borderSide:
            BorderSide(color: Theme.of(context).dividerColor, width: 1.0),
        borderRadius: BorderRadius.circular(4.0));

    return TextField(
      obscureText: this.obscureText,
      decoration: InputDecoration(
        filled: true,
        // fillColor: Theme.of(context).scaffoldBackgroundColor,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        hintText: this.hintText,
        border: border,
        enabledBorder: border,
        focusedBorder: border,
      ),
      // keyboardType: TextInputType.text,
      style: Theme.of(context).textTheme.bodyText1,
      onChanged: this.onChanged,
    );
  }
}
