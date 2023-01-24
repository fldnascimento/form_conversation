import 'package:flutter/material.dart';

import '../widgets/form_card.dart';
import 'form_base.dart';

class FormAction extends FormBase {
  final String tag;
  final String name;
  final Widget action;
  final bool edit;
  final String text;

  FormAction({
    required this.text,
    required this.tag,
    required this.action,
    required this.name,
    super.delay,
    this.edit = true,
  }) : super(
          widget: FormCard(
            text: text,
          ),
        );

  @override
  int get delay {
    if (super.delay == -1) {
      return delayCalc(text);
    }
    return super.delay;
  }
}
