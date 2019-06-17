import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_architecture/common/presentation/base_view_model.dart';
import 'package:flutter_architecture/common/presentation/router/router.dart';
import 'package:flutter_architecture/injection/injector.dart';
import 'package:flutter_architecture/util/logger.dart';

abstract class BasePresenter<ViewModel extends BaseViewModel> {
  final ViewModel viewModel;
  final Logger log;

  Router router;

  List<StreamSubscription> subscriptions = List();

  BasePresenter(this.viewModel) : log = injector.get<Logger>();

  void init({@required BuildContext context}) {
    router = Router(context);
  }

  void start();

  @mustCallSuper
  void stop() {
    subscriptions.forEach((sub) => sub.cancel());
    subscriptions.clear();
  }
}
