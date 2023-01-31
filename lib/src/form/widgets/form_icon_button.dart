import 'package:flutter/material.dart';

import '../style/form_icon_button_style.dart';
import 'form_inherited_widget.dart';

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
    final theme = context.loadStyle<FormIconButtonStyle>();

    return SizedBox(
      height: theme.height,
      width: theme.width,
      child: RawMaterialButton(
        fillColor: onPressed == null
            ? theme.backgroundColorDisabled
            : (backgroundColor ?? theme.backgroundColor),
        elevation: theme.elevation,
        shape: const CircleBorder(),
        onPressed: onPressed,
        child: icon ??
            Icon(
              Icons.send,
              color:
                  onPressed == null ? theme.iconColorDisabled : theme.iconColor,
              size: theme.iconSize,
            ),
      ),
    );
  }
}
