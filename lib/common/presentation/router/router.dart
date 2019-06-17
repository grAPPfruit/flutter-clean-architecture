import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Router {
  NavigatorState _navigator;

  Router(BuildContext context) {
    this._navigator = Navigator.of(context);
  }

  void pop() {
    _navigator.pop();
  }

  void toDebugInfo() {
    _navigator.pushNamed(Routes.debugInfo);
  }
}

class Routes {
  static const String debugInfo = "/debugInfo";
}
