import 'package:flutter_architecture/layer/domain/repository/counter_repository.dart';
import 'package:flutter_architecture/layer/domain/use_case.dart';
import 'package:rxdart/rxdart.dart';

class DecrementCounterUseCase implements UseCase<void> {
  final CounterRepository counterRepository;

  DecrementCounterUseCase(this.counterRepository);

  @override
  Observable<void> execute() => counterRepository.decrementCounter();
}
