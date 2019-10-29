import 'package:flutter_architecture/layer/data/counter_repository.dart';
import 'package:flutter_architecture/layer/domain/usecase/decrement_counter_use_case.dart';
import 'package:flutter_architecture/layer/domain/usecase/get_counter_use_case.dart';
import 'package:flutter_architecture/layer/domain/usecase/increment_counter_use_case.dart';
import 'package:flutter_architecture/layer/view/counter_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

GetIt locator = GetIt.instance;

Future<void> initDependencies() async {
  await _Injector().init();
}

class _Injector {
  Future<void> init() async {
    await _initRepositories();
    _initViewModels();
    _initUseCases();
  }

  Future<void> _initRepositories() async {
    var prefs = await StreamingSharedPreferences.instance;
    locator.registerLazySingleton<StreamingSharedPreferences>(() => prefs);
    locator.registerLazySingleton(() => CounterRepository(prefs));
  }

  void _initViewModels() {
    locator.registerLazySingleton(() => CounterViewModel());
  }

  void _initUseCases() {
    locator.registerLazySingleton(() => GetCounterUseCase(locator.get<CounterRepository>()));
    locator.registerLazySingleton(() => IncrementCounterUseCase(locator.get<CounterRepository>()));
    locator.registerLazySingleton(() => DecrementCounterUseCase(locator.get<CounterRepository>()));
  }
}
