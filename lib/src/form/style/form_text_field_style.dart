import 'package:flutter/material.dart';

import '../../core/color_shade.dart';
import '../../core/style_base.dart';

class FormTextFieldStyle extends StyleBase<FormTextFieldStyle> {
  final InputDecoration? decoration;
  final Color? cursorColor;
  final TextStyle? style;
  final EdgeInsets? suffixPadding;

  const FormTextFieldStyle({
    this.decoration,
    this.cursorColor,
    this.style,
    this.suffixPadding,
  });

  @override
  FormTextFieldStyle copyWith({
    InputDecoration? decoration,
    Color? cursorColor,
    TextStyle? style,
    EdgeInsets? suffixPadding,
  }) {
    return FormTextFieldStyle(
      decoration: decoration ?? this.decoration,
      cursorColor: cursorColor ?? this.cursorColor,
      style: style ?? this.style,
      suffixPadding: suffixPadding ?? this.suffixPadding,
    );
  }

  @override
  FormTextFieldStyle merge(FormTextFieldStyle? theme) {
    if (theme == null) {
      return this;
    }

    return copyWith(
        decoration: theme.decoration,
        cursorColor: theme.cursorColor,
        style: theme.style,
        suffixPadding: theme.suffixPadding);
  }

  static FormTextFieldStyle defaultTheme(BuildContext context) {
    return FormTextFieldStyle(
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.primary.shade400,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        prefix: const SizedBox(width: 16),
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary.shade200,
            ),
        errorStyle: const TextStyle(height: 0, wordSpacing: 1, fontSize: 10),
      ),
      cursorColor: Theme.of(context).colorScheme.primary.shade200,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      suffixPadding: const EdgeInsets.only(
        right: 5,
      ),
    );
  }
}
