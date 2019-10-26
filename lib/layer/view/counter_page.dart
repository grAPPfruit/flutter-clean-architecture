import 'package:flutter/material.dart';
import 'package:flutter_architecture/layer/view/counter_view_model.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Injector(
      inject: [
        Inject(() => CounterViewModel()),
      ],
      builder: (context, _) {
        final counterModel = Injector.getAsModel<CounterViewModel>();
        return _buildScaffold(counterModel);
      },
    );
  }

  Widget _buildScaffold(ModelStatesRebuilder<CounterViewModel> counterModel) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clean Counter"),
      ),
      body: _buildBody(counterModel),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => counterModel.setState((state) => state.increment()),
            tooltip: 'Increment',
            child: Icon(Icons.exposure_plus_1),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () => counterModel.setState((state) => state.decrement()),
            tooltip: 'Decrement',
            child: Icon(Icons.exposure_neg_1),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(ModelStatesRebuilder<CounterViewModel> counterModel) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          StreamBuilder(
            stream: counterModel.snapshot.data.count(),
            builder: (context, snapshot) => Text(
              "${snapshot.data}",
              style: Theme.of(context).textTheme.display1,
            ),
          ),
        ],
      ),
    );
  }
}
