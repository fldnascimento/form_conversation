import 'package:flutter/material.dart';

import '../../core/color_shade.dart';
import '../../core/style_base.dart';

class FormIconButtonStyle extends StyleBase<FormIconButtonStyle> {
  final Color? backgroundColor;
  final Color? backgroundColorDisabled;
  final double? height;
  final double? width;
  final double elevation;
  final ShapeBorder? shape;
  final double? iconSize;
  final Color? iconColor;
  final Color? iconColorDisabled;

  const FormIconButtonStyle({
    this.backgroundColor,
    this.height,
    this.width,
    this.elevation = 2.0,
    this.shape,
    this.iconSize,
    this.iconColor,
    this.backgroundColorDisabled,
    this.iconColorDisabled,
  });

  @override
  FormIconButtonStyle copyWith({
    Color? backgroundColor,
    double? height,
    double? width,
    double? elevation,
    ShapeBorder? shape,
    double? iconSize,
    Color? iconColor,
    Color? backgroundColorDisabled,
    Color? iconColorDisabled,
  }) {
    return FormIconButtonStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      elevation: elevation ?? this.elevation,
      height: height ?? this.height,
      iconColor: iconColor ?? this.iconColor,
      iconSize: iconSize ?? this.iconSize,
      shape: shape ?? this.shape,
      width: width ?? this.width,
      backgroundColorDisabled:
          backgroundColorDisabled ?? this.backgroundColorDisabled,
      iconColorDisabled: iconColorDisabled ?? this.iconColorDisabled,
    );
  }

  @override
  FormIconButtonStyle merge(FormIconButtonStyle? theme) {
    if (theme == null) {
      return this;
    }

    return copyWith(
      backgroundColor: theme.backgroundColor,
      elevation: theme.elevation,
      height: theme.height,
      iconColor: theme.iconColor,
      iconSize: theme.iconSize,
      shape: theme.shape,
      width: theme.width,
      backgroundColorDisabled: theme.backgroundColorDisabled,
      iconColorDisabled: theme.iconColorDisabled,
    );
  }

  static FormIconButtonStyle defaultTheme(BuildContext context) {
    return FormIconButtonStyle(
      height: 42,
      width: 42,
      backgroundColor: Theme.of(context).colorScheme.primary,
      elevation: 0,
      iconColor: Theme.of(context).colorScheme.primary,
      iconSize: 18,
      shape: const CircleBorder(),
      backgroundColorDisabled: Colors.grey.shade600,
      iconColorDisabled: Colors.grey.shade600.shade800,
    );
  }
}
