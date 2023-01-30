import 'package:flutter/material.dart';

import '../../core/color_shade.dart';
import '../../core/style_base.dart';

class FormAnswerStyle extends StyleBase<FormAnswerStyle> {
  final BoxConstraints? constraints;
  final String? textButton;
  final TextStyle? style;
  final TextStyle? textButtonStyle;
  final ShapeBorder? shape;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final double? elevation;

  const FormAnswerStyle({
    this.textButton,
    this.constraints,
    this.style,
    this.textButtonStyle,
    this.shape,
    this.margin,
    this.color,
    this.elevation,
  });

  @override
  FormAnswerStyle copyWith({
    BoxConstraints? constraints,
    String? textButton,
    TextStyle? style,
    TextStyle? textButtonStyle,
    ShapeBorder? shape,
    EdgeInsetsGeometry? margin,
    Color? color,
    double? elevation,
  }) {
    return FormAnswerStyle(
      constraints: constraints ?? this.constraints,
      textButton: textButton ?? this.textButton,
      style: style ?? this.style,
      textButtonStyle: textButtonStyle ?? this.textButtonStyle,
      elevation: elevation ?? this.elevation,
      margin: margin ?? this.margin,
      color: color ?? this.color,
      shape: shape ?? this.shape,
    );
  }

  @override
  FormAnswerStyle merge(FormAnswerStyle? theme) {
    if (theme == null) {
      return this;
    }

    return copyWith(
      color: theme.color,
      constraints: theme.constraints,
      elevation: theme.elevation,
      margin: theme.margin,
      shape: theme.shape,
      style: theme.style,
      textButton: theme.textButton,
      textButtonStyle: theme.textButtonStyle,
    );
  }

  static FormAnswerStyle defaultTheme(BuildContext context) {
    return FormAnswerStyle(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15.0),
          topLeft: Radius.circular(15.0),
          bottomLeft: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
      ),
      color: Theme.of(context).colorScheme.primary.shade50,
      elevation: 0,
      margin: const EdgeInsets.all(10),
      constraints: const BoxConstraints(maxWidth: 250),
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
      textButton: 'Alterar',
      textButtonStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.2,
          ),
    );
  }
}
