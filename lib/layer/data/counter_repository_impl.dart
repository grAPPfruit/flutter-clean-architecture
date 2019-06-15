import 'package:flutter_architecture/layer/domain/repository/counter_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class CounterRepositoryImpl implements CounterRepository {
  static const String PREF_COUNTER = "pref counter";

  final StreamingSharedPreferences prefs;

  CounterRepositoryImpl(this.prefs);

  @override
  Observable<int> getCounter() => Observable(prefs.getInt(PREF_COUNTER, defaultValue: 0));

  @override
  Observable<void> incrementCounter() =>
      Observable.fromFuture(prefs.setInt(PREF_COUNTER, prefs.getInt(PREF_COUNTER, defaultValue: 0).getValue() + 1));

  @override
  Observable<void> decrementCounter() =>
      Observable.fromFuture(prefs.setInt(PREF_COUNTER, prefs.getInt(PREF_COUNTER, defaultValue: 0).getValue() - 1));
}
