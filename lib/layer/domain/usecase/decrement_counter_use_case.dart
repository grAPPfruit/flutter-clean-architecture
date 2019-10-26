import 'package:flutter_architecture/layer/data/counter_repository.dart';
import 'package:flutter_architecture/layer/domain/use_case.dart';

class DecrementCounterUseCase implements UseCase<Future> {
  final CounterRepository counterRepository;

  DecrementCounterUseCase(this.counterRepository);

  @override
  Future<void> execute() => counterRepository.decrementCounter();
}
