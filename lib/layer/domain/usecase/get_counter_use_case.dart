import 'package:flutter_architecture/layer/data/counter_repository.dart';
import 'package:flutter_architecture/layer/domain/use_case.dart';

class GetCounterUseCase implements UseCase<Stream<int>> {
  final CounterRepository counterRepository;

  GetCounterUseCase(this.counterRepository);

  @override
  Stream<int> execute() => counterRepository.getCounter();
}
