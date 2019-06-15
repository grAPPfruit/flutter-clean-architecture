import 'package:flutter_architecture/layer/presentation/counter_view_model.dart';
import 'package:flutter_architecture/injection/injector.dart';
import 'package:flutter_architecture/layer/domain/usecase/decrement_counter_use_case.dart';
import 'package:flutter_architecture/layer/domain/usecase/get_counter_use_case.dart';
import 'package:flutter_architecture/layer/domain/usecase/increment_counter_use_case.dart';
import 'package:rxdart/rxdart.dart';

class CounterPresenter {
  final CounterViewModel viewModel;
  final GetCounterUseCase getCounterUseCase;
  final IncrementCounterUseCase incrementCounterUseCase;
  final DecrementCounterUseCase decrementCounterUseCase;

  final subscriptions = CompositeSubscription();

  CounterPresenter(this.viewModel)
      : getCounterUseCase = injector.get<GetCounterUseCase>(),
        incrementCounterUseCase = injector.get<IncrementCounterUseCase>(),
        decrementCounterUseCase = injector.get<DecrementCounterUseCase>();

  void start() {
    var sub = getCounterUseCase.execute().listen(
      (value) {
        viewModel.setCounter(value);
      },
      onError: (error) {
        print("error: $error");
      },
    );
    subscriptions.add(sub);
  }

  void stop() {
    viewModel.dispose();
  }

  void onIncrementCounterClicked() {
    var sub = incrementCounterUseCase.execute().listen(
      (_) {},
      onError: (error) {
        print("error: $error");
      },
    );
    subscriptions.add(sub);
  }

  void onDecrementCounterClicked() {
    var sub = decrementCounterUseCase.execute().listen(
      (_) {},
      onError: (error) {
        print("error: $error");
      },
    );
    subscriptions.add(sub);
  }
}
