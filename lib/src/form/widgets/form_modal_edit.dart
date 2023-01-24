import 'package:flutter/material.dart';
import 'package:form_conversation/src/form/constants/strings_constants.dart';

import '../../../form_conversation.dart';

showModalEdit(String tag, BuildContext context) {
  final controller = context.controller;
  final formItem = controller.getFormItemByTag(tag);
  showModalBottomSheet(
    enableDrag: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(10.0),
        topLeft: Radius.circular(10.0),
      ),
    ),
    isScrollControlled: true,
    backgroundColor: Colors.white,
    context: context,
    builder: (BuildContext bc) {
      return ValueListenableBuilder(
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
                      style: const TextStyle(fontSize: 20),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: formItem.action,
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
