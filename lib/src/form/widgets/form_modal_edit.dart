import 'package:flutter/material.dart';
import 'package:form_conversation/src/form/contants/strings_constants.dart';

import '../../../form_conversation.dart';

showModalEdit(String tag, BuildContext context) {
  final formItem = context.controller.getFormItemByTag(tag);
  return showModalBottomSheet<bool>(
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
            Navigator.pop(context, true);
          }

          return SingleChildScrollView(
            child: Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: formItem.action,
            ),
          );
        },
      );
    },
  );
}
