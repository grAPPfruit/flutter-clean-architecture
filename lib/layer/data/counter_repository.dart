import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class CounterRepository {
  static const String PREF_COUNTER = "pref counter";

  final StreamingSharedPreferences prefs;

  CounterRepository(this.prefs);

  Stream<int> getCounter() => prefs.getInt(PREF_COUNTER, defaultValue: 0);

  Future<void> incrementCounter() => prefs.setInt(PREF_COUNTER, _currentCounter() + 1);

  Future<void> decrementCounter() => prefs.setInt(PREF_COUNTER, _currentCounter() - 1);

  int _currentCounter() => prefs.getInt(PREF_COUNTER, defaultValue: 0).getValue();
}
