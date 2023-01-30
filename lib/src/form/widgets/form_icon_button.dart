import 'package:flutter/material.dart';

import '../../core/color_shade.dart';

class FormIconButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget? icon;
  final Color? backgroundColor;

  const FormIconButton({
    super.key,
    this.icon,
    this.onPressed,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: 42,
      child: RawMaterialButton(
        fillColor: onPressed == null
            ? Colors.grey.shade600
            : (backgroundColor ?? Theme.of(context).colorScheme.primary),
        elevation: 0.0,
        shape: const CircleBorder(),
        onPressed: onPressed,
        child: icon ??
            Icon(
              Icons.send,
              color: onPressed == null
                  ? Colors.grey.shade600.shade800
                  : Theme.of(context).colorScheme.primary,
              size: 18,
            ),
      ),
    );
  }
}
