import 'package:flutter_architecture/common/domain/use_case.dart';
import 'package:flutter_architecture/feature/counter/domain/repository/counter_repository.dart';
import 'package:rxdart/rxdart.dart';

class IncrementCounterUseCase implements UseCase<void> {
  final CounterRepository counterRepository;

  IncrementCounterUseCase(this.counterRepository);

  @override
  Observable<void> execute() => counterRepository.incrementCounter();
}
