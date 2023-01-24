import 'package:flutter/widgets.dart';

abstract class FormBase {
  final Widget widget;
  final int delay;

  const FormBase({
    required this.widget,
    this.delay = -1,
  });

  int delayCalc(String text) {
    int delay = 0;
    text.split("").forEach((element) {
      delay += 45;
    });
    return delay;
  }
}
