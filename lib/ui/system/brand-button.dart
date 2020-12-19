import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ButtonType { Flat, Filled }

class BrandButton extends StatelessWidget {
  final ButtonType type;
  final String text;
  final TextStyle style;
  final bool disabled;
  final Function() onPressed;

  const BrandButton(
      {Key key,
      this.type,
      this.text,
      this.style,
      this.disabled = false,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.type == ButtonType.Filled) {
      return CupertinoButton(
        color: Colors.blue,
        onPressed: this.disabled ? null : this.onPressed,
        child: Text(
          this.text,
          style: this.style.copyWith(
              color: this.disabled ? Colors.white60 : Colors.white, height: 1),
        ),
        padding: EdgeInsets.all(10.0),
        pressedOpacity: 0.8,
        disabledColor: Colors.blue,
        minSize: 36,
        borderRadius: BorderRadius.circular(4.0),
      );
    } else {
      return CupertinoButton(
        onPressed: this.onPressed,
        child: Text(
          this.text,
          style: this.style.copyWith(color: Colors.blue),
        ),
        padding: EdgeInsets.all(0.0),
        minSize: 36,
      );
    }
  }
}
