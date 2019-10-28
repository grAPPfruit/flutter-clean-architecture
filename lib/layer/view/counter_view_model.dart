import 'dart:async';

import 'package:flutter_architecture/common/base_view_model.dart';
import 'package:flutter_architecture/common/base_view_state.dart';
import 'package:flutter_architecture/injection/injector.dart';
import 'package:flutter_architecture/layer/domain/usecase/decrement_counter_use_case.dart';
import 'package:flutter_architecture/layer/domain/usecase/get_counter_use_case.dart';
import 'package:flutter_architecture/layer/domain/usecase/increment_counter_use_case.dart';

class CounterViewModel extends BaseViewModel {
  final GetCounterUseCase _getCounterUseCase = locator.get();
  final IncrementCounterUseCase _incrementCounterUseCase = locator.get();
  final DecrementCounterUseCase _decrementCounterUseCase = locator.get();

  StreamSubscription _counterSubscription;

  int counterValue;

  CounterViewModel() : super(BaseViewState.Busy) {
    _counterSubscription = _getCounterUseCase.execute().listen((value) {
      counterValue = value;
      setState(BaseViewState.Idle);
    });
  }

  Future<void> increment() async {
    await _incrementCounterUseCase.execute();
  }

  Future<void> decrement() async {
    await _decrementCounterUseCase.execute();
  }

  @override
  void dispose() {
    _counterSubscription.cancel();
    super.dispose();
  }
}
