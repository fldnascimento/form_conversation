import 'package:flutter/material.dart';
import '../../core/color_shade.dart';

import '../../core/style_base.dart';

class FormButtonStyle extends StyleBase<FormButtonStyle> {
  final double? width;
  final double? height;
  final ButtonStyle? buttonStyle;
  final TextStyle? style;

  FormButtonStyle({
    this.width,
    this.height,
    this.buttonStyle,
    this.style,
  });

  @override
  FormButtonStyle copyWith({
    double? width,
    double? height,
    ButtonStyle? buttonStyle,
    TextStyle? style,
  }) {
    return FormButtonStyle(
      width: width ?? this.width,
      height: height ?? this.height,
      buttonStyle: buttonStyle ?? this.buttonStyle,
      style: style ?? this.style,
    );
  }

  @override
  FormButtonStyle merge(FormButtonStyle? theme) {
    if (theme == null) {
      return this;
    }

    return copyWith(
      buttonStyle: theme.buttonStyle,
      height: theme.height,
      width: theme.width,
      style: theme.style,
    );
  }

  static FormButtonStyle defaultTheme(BuildContext context) {
    return FormButtonStyle(
      width: double.infinity,
      height: 40,
      buttonStyle: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color?>(
          Theme.of(context).colorScheme.primary.shade50,
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary.shade600,
      ),
    );
  }
}
