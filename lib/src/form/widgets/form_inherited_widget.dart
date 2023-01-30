import 'package:flutter/material.dart';

import '../../core/style_base.dart';
import '../controllers/form/form_controller.dart';
import '../models/form_base.dart';

class FormInheritedWidget extends InheritedWidget {
  final FormController controller;

  final List<FormBase> formItems;
  final List<StyleBase> styles;

  const FormInheritedWidget({
    super.key,
    required this.styles,
    required this.controller,
    required this.formItems,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant FormInheritedWidget oldWidget) {
    return oldWidget.controller != controller ||
        oldWidget.formItems != formItems ||
        oldWidget.styles != styles ||
        oldWidget.child != child;
  }

  static FormInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FormInheritedWidget>();
  }
}

extension ReadContext on BuildContext {
  FormController get controller {
    return FormInheritedWidget.of(this)!.controller;
  }

  FormInheritedWidget get form {
    return FormInheritedWidget.of(this)!;
  }

  T loadStyle<T extends Object>() {
    return FormInheritedWidget.of(this)!.styles.whereType<T>().first;
  }
}
