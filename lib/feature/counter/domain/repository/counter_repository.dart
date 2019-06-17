import 'package:rxdart/rxdart.dart';

abstract class CounterRepository {
  Observable<int> getCounter();

  Observable<void> incrementCounter();

  Observable<void> decrementCounter();
}
