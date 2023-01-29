import 'package:flutter/material.dart';

import '../../core/color_shade.dart';

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
    return Card(
      margin: const EdgeInsets.only(top: 3, bottom: 3),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15.0),
          topLeft: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
      ),
      color: Theme.of(context).colorScheme.primary,
      elevation: 0,
      child: widget ??
          Container(
            constraints: const BoxConstraints(maxWidth: 250),
            padding: const EdgeInsets.all(12),
            child: Text(
              text!,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary.shade50,
                letterSpacing: 0.2,
              ),
            ),
          ),
    );
  }
}
