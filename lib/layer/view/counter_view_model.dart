import 'package:flutter_architecture/injection/injector.dart';
import 'package:flutter_architecture/layer/domain/usecase/decrement_counter_use_case.dart';
import 'package:flutter_architecture/layer/domain/usecase/get_counter_use_case.dart';
import 'package:flutter_architecture/layer/domain/usecase/increment_counter_use_case.dart';

class CounterViewModel {
  GetCounterUseCase _getCounterUseCase = injector.get();
  IncrementCounterUseCase _incrementCounterUseCase = injector.get();
  DecrementCounterUseCase _decrementCounterUseCase = injector.get();

  CounterViewModel() {
    print(">>> CounterModel()");
  }

  Stream<int> count() {
    print(">>> count()");
    return _getCounterUseCase.execute();
  }

  Future<void> increment() {
    print(">>> increment()");
    return _incrementCounterUseCase.execute();
  }

  Future<void> decrement() {
    print(">>> decrement()");
    return _decrementCounterUseCase.execute();
  }
}
