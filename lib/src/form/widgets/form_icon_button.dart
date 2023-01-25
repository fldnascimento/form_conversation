import 'package:flutter/material.dart';

import '../../core/colors_util.dart';

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
        fillColor: backgroundColor ?? Theme.of(context).colorScheme.primary,
        elevation: 0.0,
        shape: const CircleBorder(),
        onPressed: onPressed,
        child: icon ??
            Icon(
              Icons.send,
              color: Theme.of(context).colorScheme.primary,
              size: 18,
            ),
      ),
    );
  }
}
