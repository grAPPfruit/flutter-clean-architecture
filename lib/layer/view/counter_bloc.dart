import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_architecture/injection/injector.dart';
import 'package:flutter_architecture/layer/domain/usecase/decrement_counter_use_case.dart';
import 'package:flutter_architecture/layer/domain/usecase/get_counter_use_case.dart';
import 'package:flutter_architecture/layer/domain/usecase/increment_counter_use_case.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

abstract class CounterEvent {}

class IncrementEvent implements CounterEvent {}

class DecrementEvent implements CounterEvent {}

class UpdateEvent extends CounterEvent {
  final int value;

  UpdateEvent(this.value);
}

class Initial {}

class Success {
  final int value;

  Success(this.value);
}

class CounterState extends Union2Impl<Initial, Success> {
  static final unions = const Doublet<Initial, Success>();

  CounterState._(Union2<Initial, Success> union) : super(union);

  factory CounterState.initial() => CounterState._(unions.first(Initial()));

  factory CounterState.success(int value) => CounterState._(unions.second(Success(value)));
}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final GetCounterUseCase _getCounterUseCase = injector.get();
  final IncrementCounterUseCase _incrementCounterUseCase = injector.get();
  final DecrementCounterUseCase _decrementCounterUseCase = injector.get();

  StreamSubscription _counterSubscription;

  CounterBloc() {
    _counterSubscription = _getCounterUseCase.execute().listen((value) => add(UpdateEvent(value)));
  }

  @override
  CounterState get initialState => CounterState.initial();

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is DecrementEvent) {
      await _decrementCounterUseCase.execute();
    } else if (event is IncrementEvent) {
      await _incrementCounterUseCase.execute();
    } else if (event is UpdateEvent) {
      yield CounterState.success(event.value);
    }
  }

  @override
  void close() {
    _counterSubscription.cancel();
    super.close();
  }
}
