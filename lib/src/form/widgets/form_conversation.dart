import 'package:flutter/material.dart';
import 'package:form_conversation/src/form/controllers/form/form_controller.dart';
import 'package:form_conversation/src/form/models/form_item.dart';
import 'package:form_conversation/src/form/widgets/form_base.dart';

class FormConversation extends InheritedWidget {
  final FormController controller;

  final List<FormItem> formItems;

  FormConversation({
    super.key,
    required this.controller,
    required this.formItems,
  }) : super(
          child: FormBase(controller: controller, formItems: formItems),
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
