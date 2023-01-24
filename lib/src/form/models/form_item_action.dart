import 'package:flutter/material.dart';
import 'package:form_conversation/src/form/models/form_item_base.dart';

class FormItemAction extends FormItemBase {
  final String tag;
  final String name;
  final Widget action;
  final bool edit;

  const FormItemAction({
    required super.card,
    required super.delay,
    required this.tag,
    required this.action,
    required this.name,
    this.edit = false,
  });
}
