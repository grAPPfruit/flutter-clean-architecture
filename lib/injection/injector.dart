import 'package:flutter_architecture/layer/data/counter_repository.dart';
import 'package:flutter_architecture/layer/domain/usecase/decrement_counter_use_case.dart';
import 'package:flutter_architecture/layer/domain/usecase/get_counter_use_case.dart';
import 'package:flutter_architecture/layer/domain/usecase/increment_counter_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

GetIt injector = GetIt.instance;

Future<void> initDependencies() async {
  await _Injector().init();
}

class _Injector {
  final GetIt getIt = GetIt.instance;

  Future<void> init() async {
    await _initRepositories();
    _initUseCases();
  }

  Future<void> _initRepositories() async {
    var prefs = await StreamingSharedPreferences.instance;
    getIt.registerLazySingleton<StreamingSharedPreferences>(() => prefs);
    getIt.registerLazySingleton(() => CounterRepository(prefs));
  }

  void _initUseCases() {
    getIt.registerLazySingleton<GetCounterUseCase>(() => GetCounterUseCase(getIt.get<CounterRepository>()));
    getIt.registerLazySingleton<IncrementCounterUseCase>(() => IncrementCounterUseCase(getIt.get<CounterRepository>()));
    getIt.registerLazySingleton<DecrementCounterUseCase>(() => DecrementCounterUseCase(getIt.get<CounterRepository>()));
  }
}
