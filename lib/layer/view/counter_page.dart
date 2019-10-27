import 'package:flutter/material.dart';
import 'package:flutter_architecture/layer/view/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Clean Counter"),
      ),
      body: _buildBody(counterBloc),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => counterBloc.add(CounterEvent.increment),
            tooltip: 'Increment',
            child: Icon(Icons.exposure_plus_1),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () => counterBloc.add(CounterEvent.decrement),
            tooltip: 'Decrement',
            child: Icon(Icons.exposure_neg_1),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(CounterBloc counterBloc) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          BlocBuilder(
            bloc: counterBloc,
            builder: (context, count) {
              return Text(
                "$count",
                style: Theme.of(context).textTheme.display1,
              );
            },
          )
        ],
      ),
    );
  }
}
