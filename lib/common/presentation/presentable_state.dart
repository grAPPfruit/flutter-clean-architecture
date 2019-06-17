import 'package:flutter/material.dart';
import 'package:flutter_architecture/common/presentation/base_presenter.dart';
import 'package:flutter_architecture/common/presentation/base_view_model.dart';
import 'package:flutter_architecture/injection/injector.dart';
import 'package:flutter_architecture/util/logger.dart';

abstract class PresentableState<Widget extends StatefulWidget, Presenter extends BasePresenter,
    ViewModel extends BaseViewModel> extends State<Widget> {
  final Presenter presenter;
  final ViewModel viewModel;
  final Logger log;

  @mustCallSuper
  PresentableState({
    @required this.presenter,
    this.viewModel,
  }) : log = injector.get<Logger>();

  @mustCallSuper
  @override
  void initState() {
    super.initState();
    presenter.start();
  }

  @mustCallSuper
  @override
  void dispose() {
    presenter.stop();
    viewModel?.dispose();
    super.dispose();
  }
}
