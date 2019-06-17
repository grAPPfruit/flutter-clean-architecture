import 'package:flutter_architecture/common/presentation/base_presenter.dart';
import 'package:flutter_architecture/feature/counter/domain/usecase/decrement_counter_use_case.dart';
import 'package:flutter_architecture/feature/counter/domain/usecase/get_counter_use_case.dart';
import 'package:flutter_architecture/feature/counter/domain/usecase/increment_counter_use_case.dart';
import 'package:flutter_architecture/feature/counter/presentation/counter_view_model.dart';
import 'package:flutter_architecture/injection/injector.dart';

class CounterPresenter extends BasePresenter<CounterViewModel> {
  final GetCounterUseCase getCounterUseCase;
  final IncrementCounterUseCase incrementCounterUseCase;
  final DecrementCounterUseCase decrementCounterUseCase;

  CounterPresenter(CounterViewModel viewModel)
      : getCounterUseCase = injector.get<GetCounterUseCase>(),
        incrementCounterUseCase = injector.get<IncrementCounterUseCase>(),
        decrementCounterUseCase = injector.get<DecrementCounterUseCase>(),
        super(viewModel);

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
