import 'package:flutter/material.dart';

import 'form_base.dart';

class FormWidget extends FormBase {
  final Widget child;

  const FormWidget({
    required this.child,
    super.delay = -1,
  }) : super(widget: child);
}
