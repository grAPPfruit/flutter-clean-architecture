import 'package:flutter_architecture/feature/counter/data/counter_repository_impl.dart';
import 'package:flutter_architecture/feature/counter/domain/repository/counter_repository.dart';
import 'package:flutter_architecture/feature/counter/domain/usecase/decrement_counter_use_case.dart';
import 'package:flutter_architecture/feature/counter/domain/usecase/get_counter_use_case.dart';
import 'package:flutter_architecture/feature/counter/domain/usecase/increment_counter_use_case.dart';
import 'package:flutter_architecture/util/logger.dart';
import 'package:get_it/get_it.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

GetIt injector = _Injector().getIt;

Future initDependencies() async {
  await _Injector().init();
}

class _Injector {
  final GetIt getIt = GetIt();
  static final _Injector _injector = _Injector._internal();

  factory _Injector() {
    return _injector;
  }

  _Injector._internal();

  Future init() async {
    _initLogger();
    await _initRepositories();
    _initUseCases();
  }

  void _initLogger() {
    getIt.registerLazySingleton<Logger>(() => LoggerImpl());
  }

  Future _initRepositories() async {
    var prefs = await StreamingSharedPreferences.instance;
    getIt.registerLazySingleton<StreamingSharedPreferences>(() => prefs);
    getIt.registerLazySingleton<CounterRepository>(() => CounterRepositoryImpl(prefs));
  }

  void _initUseCases() {
    getIt.registerLazySingleton<GetCounterUseCase>(() => GetCounterUseCase(getIt.get<CounterRepository>()));
    getIt.registerLazySingleton<IncrementCounterUseCase>(() => IncrementCounterUseCase(getIt.get<CounterRepository>()));
    getIt.registerLazySingleton<DecrementCounterUseCase>(() => DecrementCounterUseCase(getIt.get<CounterRepository>()));
  }
}
