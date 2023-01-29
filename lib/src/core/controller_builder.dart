import 'package:flutter/material.dart';
import 'controller.dart';

typedef ControllerWidgetBuilder<S> = Widget Function(
    BuildContext context, S state);

class ControllerBuilder<B extends Controller<S>, S> extends StatelessWidget {
  final ControllerWidgetBuilder<S> builder;
  final B controller;

  const ControllerBuilder({
    super.key,
    required this.builder,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<S>(
      valueListenable: controller,
      builder: (context, value, child) => builder(context, value),
    );
  }
}
