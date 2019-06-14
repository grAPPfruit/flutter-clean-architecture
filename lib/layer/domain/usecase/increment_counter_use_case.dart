import 'package:flutter_architecture/layer/domain/repository/counter_repository.dart';
import 'package:flutter_architecture/layer/domain/use_case.dart';
import 'package:rxdart/rxdart.dart';

class IncrementCounterUseCase implements UseCase<void> {
  final CounterRepository counterRepository;

  IncrementCounterUseCase(this.counterRepository);

  @override
  Observable<void> execute() => counterRepository.incrementCounter();
}
