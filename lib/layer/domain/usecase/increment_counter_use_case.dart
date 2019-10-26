import 'package:flutter_architecture/layer/data/counter_repository.dart';
import 'package:flutter_architecture/layer/domain/use_case.dart';

class IncrementCounterUseCase implements UseCase<Future> {
  final CounterRepository counterRepository;

  IncrementCounterUseCase(this.counterRepository);

  @override
  Future<void> execute() => counterRepository.incrementCounter();
}
