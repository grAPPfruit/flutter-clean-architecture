import 'package:flutter/material.dart';
import 'package:flutter_architecture/feature/view/counter_page.dart';
import 'package:flutter_architecture/injection/injector.dart';

Future main() async {
  await initDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Architecture',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterPage(),
    );
  }
}
