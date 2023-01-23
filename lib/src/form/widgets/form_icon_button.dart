import 'package:flutter/material.dart';

class FormIconButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget icon;
  const FormIconButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: 42,
      child: RawMaterialButton(
        fillColor: const Color(0xFF1A61AF),
        elevation: 1.0,
        shape: const CircleBorder(),
        onPressed: onPressed,
        child: icon,
      ),
    );
  }
}
