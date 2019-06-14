import 'package:flutter_architecture/layer/domain/repository/counter_repository.dart';
import 'package:flutter_architecture/layer/domain/use_case.dart';
import 'package:rxdart/rxdart.dart';

class GetCounterUseCase implements UseCase<Observable<int>> {
  final CounterRepository counterRepository;

  GetCounterUseCase(this.counterRepository);

  @override
  Observable<int> execute() => counterRepository.getCounter();
}
