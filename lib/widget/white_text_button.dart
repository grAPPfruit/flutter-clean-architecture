import 'package:flutter/material.dart';

class WhiteTextButton extends RaisedButton {
  const WhiteTextButton({
    Key key,
    onPressed,
    textColor: Colors.white,
    elevation: 0.0,
    highlightElevation: 0.0,
    disabledElevation: 0.0,
    color,
    child,
  }) : super(
          key: key,
          onPressed: onPressed,
          textColor: textColor,
          elevation: elevation,
          highlightElevation: highlightElevation,
          disabledElevation: disabledElevation,
          color: color,
          child: child,
        );
}
