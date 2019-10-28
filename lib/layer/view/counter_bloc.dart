import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_architecture/injection/injector.dart';
import 'package:flutter_architecture/layer/domain/usecase/decrement_counter_use_case.dart';
import 'package:flutter_architecture/layer/domain/usecase/get_counter_use_case.dart';
import 'package:flutter_architecture/layer/domain/usecase/increment_counter_use_case.dart';

abstract class CounterEvent {}

class IncrementEvent implements CounterEvent {}

class DecrementEvent implements CounterEvent {}

class UpdateEvent extends CounterEvent {
  final int value;

  UpdateEvent(this.value);
}

class CounterBloc extends Bloc<CounterEvent, int> {
  final GetCounterUseCase _getCounterUseCase = injector.get();
  final IncrementCounterUseCase _incrementCounterUseCase = injector.get();
  final DecrementCounterUseCase _decrementCounterUseCase = injector.get();

  StreamSubscription _counterSubscription;

  CounterBloc() {
    _counterSubscription = _getCounterUseCase.execute().listen((value) => add(UpdateEvent(value)));
  }

  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    if (event is DecrementEvent) {
      await _decrementCounterUseCase.execute();
    } else if (event is IncrementEvent) {
      await _incrementCounterUseCase.execute();
    } else if (event is UpdateEvent) {
      yield event.value;
    }
  }

  @override
  void close() {
    _counterSubscription.cancel();
    super.close();
  }
}
