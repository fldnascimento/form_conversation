import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

abstract class Controller<T> extends ValueNotifier<T> {
  Controller(super.value);

  emit(T state) {
    if (_runTest && !_finishedWidgetsRender) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        value = state;
      });
    } else if (_finishedWidgetsRender || _runTest) {
      value = state;
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        value = state;
      });
    }
  }

  bool get _finishedWidgetsRender =>
      WidgetsBinding.instance.schedulerPhase == SchedulerPhase.idle;

  bool get _runTest =>
      !kIsWeb && Platform.environment['FLUTTER_TEST'] == 'true';

  T get state => value;
}
