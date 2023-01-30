import 'package:flutter/material.dart';

import '../style/form_card_style.dart';
import 'form_inherited_widget.dart';

class FormCard extends StatelessWidget {
  final String? text;
  final Widget? widget;

  const FormCard({
    super.key,
    this.text,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.loadStyle<FormCardStyle>();

    return Card(
      margin: theme.margin,
      shape: theme.shape,
      color: theme.color,
      elevation: theme.elevation,
      child: widget ??
          Container(
            constraints: theme.constraints,
            padding: theme.padding,
            child: Text(
              text!,
              style: theme.style,
            ),
          ),
    );
  }
}
