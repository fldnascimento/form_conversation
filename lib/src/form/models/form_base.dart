import 'package:flutter/material.dart';

abstract class FormBase {
  final int delay;
  final Widget widget;

  const FormBase({
    this.delay = -1,
    required this.widget,
  });

  int delayCalc(String text) {
    int delay = 0;
    text.split("").forEach((element) {
      delay += 45;
    });
    return delay;
  }
}
