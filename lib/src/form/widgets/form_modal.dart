import 'package:flutter/material.dart';

import '../../core/color_shade.dart';
import '../constants/strings_constants.dart';
import 'form_inherited_widget.dart';

abstract class FormModal {
  static void showModal({
    required BuildContext context,
    required Widget child,
    String? title,
  }) {
    showModalBottomSheet(
      enableDrag: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10.0),
          topLeft: Radius.circular(10.0),
        ),
      ),
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.surface.shade400,
      context: context,
      builder: (BuildContext bc) {
        return FormInheritedWidget(
          controller: context.form.controller,
          styles: context.form.styles,
          formItems: context.form.formItems,
          child: SingleChildScrollView(
            child: Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: title != null && title.isNotEmpty,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        title ?? '',
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.primary.shade100,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  child,
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static void showModalEdit({
    required String tag,
    required BuildContext context,
  }) {
    final controller = context.controller;
    final formItem = controller.getFormItemByTag(tag);
    showModal(
      context: context,
      child: ValueListenableBuilder(
        valueListenable: context.controller.getValue(StringConstants.tagEdit),
        builder: (context, value, child) {
          if (value == StringConstants.empty) {
            Navigator.of(context).pop();
            controller.setValue(StringConstants.tagEdit, " ");
          }

          return SingleChildScrollView(
            child: Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
                    child: Text(
                      "Corrigir ${formItem.name}",
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary.shade100,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child:
                        formItem.builder(context, formItem.tag, formItem.edit),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
