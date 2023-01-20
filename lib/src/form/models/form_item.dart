import 'package:flutter/material.dart';

import '../widgets/form_card.dart';

class FormItem {
  final FormCard card;
  final Widget? action;
  final bool edit;
  final int delay;

  const FormItem({
    required this.card,
    this.action,
    this.edit = true,
    this.delay = 0,
  });
}
