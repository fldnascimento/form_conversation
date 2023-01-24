import 'package:flutter/material.dart';

import '../models/form_base.dart';
import '../controllers/form/form_controller.dart';
import 'form_widget_base.dart';

class FormConversation extends InheritedWidget {
  final FormController controller;

  final List<FormBase> formItems;

  FormConversation({
    super.key,
    required this.controller,
    required this.formItems,
  }) : super(
          child: FormWidgetBase(
            controller: controller,
            formItems: formItems,
          ),
        );

  @override
  bool updateShouldNotify(covariant FormConversation oldWidget) {
    return oldWidget.controller != controller;
  }

  static FormConversation? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FormConversation>();
  }
}

extension ReadContext on BuildContext {
  FormController get controller {
    return FormConversation.of(this)!.controller;
  }
}
