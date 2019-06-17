import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseViewModel {
  final isLoading = BehaviorSubject<bool>.seeded(false);

  void setLoading(bool value) {
    isLoading.add(value);
  }

  @mustCallSuper
  void dispose() {
    isLoading.close();
  }
}
