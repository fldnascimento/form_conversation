import 'package:flutter/material.dart';

import '../widgets/form_card.dart';
import 'form_base.dart';

typedef ActionBuilder = Widget Function(
  BuildContext context,
  String tag,
  bool edit,
);

class FormAction extends FormBase {
  final String tag;
  final String name;
  final ActionBuilder builder;
  final bool edit;
  final String text;

  FormAction({
    required this.text,
    required this.tag,
    required this.builder,
    required this.name,
    super.delay,
    this.edit = true,
  }) : super(
          widget: FormCard(text: text),
        );

  @override
  int get delay {
    if (super.delay == -1) {
      return delayCalc(text);
    }
    return super.delay;
  }
}
