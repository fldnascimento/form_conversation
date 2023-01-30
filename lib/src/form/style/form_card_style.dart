import 'package:flutter/material.dart';

import '../../core/color_shade.dart';
import '../../core/style_base.dart';

class FormCardStyle extends StyleBase<FormCardStyle> {
  final ShapeBorder? shape;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final TextStyle? style;
  final BoxConstraints? constraints;

  const FormCardStyle({
    this.shape,
    this.margin,
    this.color,
    this.elevation,
    this.padding,
    this.style,
    this.constraints,
  });

  @override
  FormCardStyle copyWith({
    ShapeBorder? shape,
    EdgeInsetsGeometry? margin,
    Color? color,
    double? elevation,
    EdgeInsetsGeometry? padding,
    TextStyle? style,
    BoxConstraints? constraints,
  }) {
    return FormCardStyle(
      color: color ?? this.color,
      elevation: elevation ?? this.elevation,
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      shape: shape ?? this.shape,
      style: style ?? this.style,
      constraints: constraints ?? this.constraints,
    );
  }

  @override
  FormCardStyle merge(FormCardStyle? theme) {
    if (theme == null) {
      return this;
    }

    return copyWith(
      color: theme.color,
      constraints: theme.constraints,
      elevation: theme.elevation,
      margin: theme.margin,
      padding: theme.padding,
      shape: theme.shape,
      style: theme.style,
    );
  }

  static FormCardStyle defaultTheme(BuildContext context) {
    return FormCardStyle(
      color: Theme.of(context).colorScheme.primary,
      elevation: 0,
      margin: const EdgeInsets.only(top: 3, bottom: 3),
      padding: const EdgeInsets.all(12),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15.0),
          topLeft: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
      ),
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary.shade50,
        letterSpacing: 0.2,
      ),
      constraints: const BoxConstraints(maxWidth: 250),
    );
  }
}
