import 'package:flutter/material.dart';
import 'controller.dart';

typedef ControllerWidgetBuilder<S> = Widget Function(
    BuildContext context, S state);

class ControllerBuilder<B extends Controller<S>, S> extends StatelessWidget {
  final ControllerWidgetBuilder<S> builder;
  final B bloc;

  const ControllerBuilder({
    super.key,
    required this.builder,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<S>(
      valueListenable: bloc,
      builder: (context, value, child) => builder(context, value),
    );
  }
}
