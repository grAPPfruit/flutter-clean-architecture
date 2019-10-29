import 'package:flutter/material.dart';
import 'package:flutter_architecture/common/view_model.dart';
import 'package:flutter_architecture/di/locator.dart';
import 'package:provider/provider.dart';

class ViewModelProvider<T extends ViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onModelReady;
  final Widget child;

  ViewModelProvider({this.builder, this.onModelReady, this.child});

  @override
  _ViewModelProviderState<T> createState() => _ViewModelProviderState<T>();
}

class _ViewModelProviderState<T extends ViewModel> extends State<ViewModelProvider<T>> {
  T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      builder: (context) => model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
