import 'package:flutter/material.dart';
import 'package:flutter_architecture/common/presentation/presentable_state.dart';
import 'package:flutter_architecture/feature/counter/presentation/counter_presenter.dart';
import 'package:flutter_architecture/feature/counter/presentation/counter_view_model.dart';
import 'package:flutter_architecture/value/strings.dart';
import 'package:flutter_architecture/widget/custom_app_bar.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() {
    var viewModel = CounterViewModel();
    var presenter = CounterPresenter(viewModel);
    return _CounterPageState(presenter, viewModel);
  }
}

class _CounterPageState extends PresentableState<CounterPage, CounterPresenter, CounterViewModel> {
  _CounterPageState(CounterPresenter presenter, CounterViewModel viewModel)
      : super(presenter: presenter, viewModel: viewModel);

  static const String _TAG = "CounterPageState";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context: context, title: Strings.counterTitle),
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
                log.d(_TAG, "repaint counter: ${snapshot?.data}");
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
            heroTag: Key("incrementButton"),
            onPressed: presenter.onIncrementCounterClicked,
            tooltip: 'Increment',
            child: Icon(Icons.exposure_plus_1),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            heroTag: Key("decrementButton"),
            onPressed: presenter.onDecrementCounterClicked,
            tooltip: 'Decrement',
            child: Icon(Icons.exposure_neg_1),
          ),
        ],
      ),
    );
  }
}
