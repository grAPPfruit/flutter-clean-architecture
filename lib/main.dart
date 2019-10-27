import 'package:flutter/material.dart';
import 'package:flutter_architecture/injection/injector.dart';
import 'package:flutter_architecture/layer/view/counter_bloc.dart';
import 'package:flutter_architecture/layer/view/counter_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    initApp();
  }

  Future<void> initApp() async {
    await initDependencies();
    setState(() {
      _isInitialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return Container();
    }
    return BlocProvider(
      builder: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Architecture',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CounterPage(),
      ),
    );
  }
}
