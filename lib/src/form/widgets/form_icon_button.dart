import 'package:flutter/material.dart';

class FormIconButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget? icon;
  const FormIconButton({
    super.key,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: 42,
      child: RawMaterialButton(
        fillColor: Theme.of(context).colorScheme.primary,
        elevation: 0.0,
        shape: const CircleBorder(),
        onPressed: onPressed,
        child: icon ??
            Icon(
              Icons.send,
              color: Theme.of(context).colorScheme.onPrimary,
              size: 18,
            ),
      ),
    );
  }
}
