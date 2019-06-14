import 'package:rxdart/rxdart.dart';

class CounterViewModel {
  final counter = BehaviorSubject<int>.seeded(0);

  void setCounter(int value) {
    counter.add(value);
  }

  void dispose() {
    counter.close();
  }
}
