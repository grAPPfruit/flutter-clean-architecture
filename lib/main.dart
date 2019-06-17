import 'package:flutter/material.dart';
import 'package:flutter_architecture/common/presentation/router/router.dart';
import 'package:flutter_architecture/feature/counter/view/counter_page.dart';
import 'package:flutter_architecture/feature/debuginfo/view/debug_info_page.dart';
import 'package:flutter_architecture/injection/injector.dart';
import 'package:flutter_architecture/value/colors.dart';
import 'package:flutter_architecture/value/strings.dart';

Future main() async {
  await initDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: ThemeData(
        primarySwatch: ThemeColors.primary,
      ),
      home: CounterPage(),
      routes: <String, WidgetBuilder>{
        Routes.debugInfo: (BuildContext context) => DebugInfoPage(),
      },
    );
  }
}
