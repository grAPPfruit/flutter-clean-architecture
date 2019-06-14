import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/feature/presentation/counter_presenter.dart';
import 'package:flutter_architecture/feature/view/counter_view_model.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() {
    var viewModel = CounterViewModel();
    var presenter = CounterPresenter(viewModel);
    return _CounterPageState(viewModel, presenter);
  }
}

class _CounterPageState extends State<CounterPage> {
  final CounterViewModel viewModel;
  final CounterPresenter presenter;

  _CounterPageState(this.viewModel, this.presenter);

  @override
  void initState() {
    super.initState();
    presenter.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clean Counter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
              stream: viewModel.counter,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                print("repaint counter: ${snapshot?.data}");
                return Text(
                  "${snapshot.data}",
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: presenter.onIncrementCounterClicked,
            tooltip: 'Increment',
            child: Icon(Icons.exposure_plus_1),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: presenter.onDecrementCounterClicked,
            tooltip: 'Decrement',
            child: Icon(Icons.exposure_neg_1),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    presenter.stop();
  }
}
