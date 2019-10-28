import 'package:flutter/widgets.dart';
import 'package:flutter_architecture/common/base_view_state.dart';

class BaseViewModel extends ChangeNotifier {
  BaseViewState _state = BaseViewState.Idle;

  BaseViewState get state => _state;

  BaseViewModel([BaseViewState initialState]) {
    _state = initialState;
  }

  void setState(BaseViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
