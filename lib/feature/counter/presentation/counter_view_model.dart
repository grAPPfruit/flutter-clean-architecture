import 'package:flutter_architecture/common/presentation/base_view_model.dart';
import 'package:rxdart/rxdart.dart';

class CounterViewModel extends BaseViewModel {
  final counter = BehaviorSubject<int>.seeded(0);

  void setCounter(int value) {
    counter.add(value);
  }

  void dispose() {
    super.dispose();
    counter.close();
  }
}
