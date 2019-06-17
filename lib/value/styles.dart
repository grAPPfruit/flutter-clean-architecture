import 'package:flutter/material.dart';
import 'package:flutter_architecture/value/colors.dart';

class Styles {
  static TextStyle baseStyle = TextStyle(color: ThemeColors.darkestGrey);

  static TextStyle appBarTitle = baseStyle.copyWith(fontSize: 18, color: ThemeColors.white);

  static TextStyle debugInfoTitle = baseStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold);
  static TextStyle debugInfoMessage = baseStyle.copyWith(fontSize: 16);
}
