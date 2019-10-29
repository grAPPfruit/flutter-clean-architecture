import 'package:flutter/widgets.dart';
import 'package:flutter_architecture/common/view_state.dart';

class ViewModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  ViewModel([ViewState initialState]) {
    _state = initialState;
  }

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
