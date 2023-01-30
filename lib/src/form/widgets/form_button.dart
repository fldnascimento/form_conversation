import 'package:flutter/material.dart';

import '../style/form_button_style.dart';
import 'form_inherited_widget.dart';

class FormButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  final Color? backgroundColor;

  const FormButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.loadStyle<FormButtonStyle>();

    return SizedBox(
      width: theme.width,
      height: theme.height,
      child: ElevatedButton(
        style: theme.buttonStyle?.copyWith(
          backgroundColor: MaterialStateProperty.all<Color?>(backgroundColor),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: theme.style,
        ),
      ),
    );
  }
}
