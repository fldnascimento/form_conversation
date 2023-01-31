import 'package:flutter/material.dart';

import '../../core/color_shade.dart';
import '../../core/style_base.dart';

class FormLoadingStyle extends StyleBase<FormLoadingStyle> {
  final Color brightColor;
  final Color darkColor;

  FormLoadingStyle({
    required this.brightColor,
    required this.darkColor,
  });

  @override
  FormLoadingStyle copyWith({
    Color? brightColor,
    Color? darkColor,
  }) {
    return FormLoadingStyle(
      brightColor: brightColor ?? this.brightColor,
      darkColor: darkColor ?? this.darkColor,
    );
  }

  @override
  FormLoadingStyle merge(FormLoadingStyle? theme) {
    if (theme == null) {
      return this;
    }

    return copyWith(
      brightColor: theme.brightColor,
      darkColor: theme.darkColor,
    );
  }

  static FormLoadingStyle defaultTheme(BuildContext context) {
    return FormLoadingStyle(
      brightColor: Theme.of(context).colorScheme.primary.shade100,
      darkColor: Theme.of(context).colorScheme.primary.shade400,
    );
  }
}
