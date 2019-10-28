import 'package:flutter/material.dart';
import 'package:flutter_architecture/common/base_view.dart';
import 'package:flutter_architecture/common/base_view_state.dart';
import 'package:flutter_architecture/layer/view/counter_view_model.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<CounterViewModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text("Clean Counter"),
        ),
        body: _buildBody(context, model, child),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () => model.increment(),
              tooltip: 'Increment',
              child: Icon(Icons.exposure_plus_1),
            ),
            SizedBox(height: 16),
            FloatingActionButton(
              onPressed: () => model.decrement(),
              tooltip: 'Decrement',
              child: Icon(Icons.exposure_neg_1),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, CounterViewModel model, Widget child) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          model.state == BaseViewState.Busy
              ? CircularProgressIndicator()
              : Text(
                  "${model.counterValue}",
                  style: Theme.of(context).textTheme.display1,
                ),
          Container(
            color: Colors.red,
            child: child,
          ),
        ],
      ),
    );
  }
}
