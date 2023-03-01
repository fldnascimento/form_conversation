import 'package:flutter/material.dart';

import '../../core/style_base.dart';

class FormStyle extends StyleBase<FormStyle> {
  final Color? backgroundColor;
  final PreferredSizeWidget? appBar;
  final EdgeInsets? margin;
  final EdgeInsets? cardMargin;
  final EdgeInsets? cardPadding;

  const FormStyle({
    this.appBar,
    this.backgroundColor,
    this.cardMargin,
    this.cardPadding,
    this.margin,
  });

  @override
  FormStyle copyWith({
    Color? backgroundColor,
    PreferredSizeWidget? appBar,
    EdgeInsets? margin,
    EdgeInsets? cardMargin,
    EdgeInsets? cardPadding,
  }) {
    return FormStyle(
      appBar: appBar ?? this.appBar,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      cardMargin: cardMargin ?? this.cardMargin,
      cardPadding: cardPadding ?? this.cardPadding,
      margin: margin ?? this.margin,
    );
  }

  @override
  FormStyle merge(FormStyle? theme) {
    if (theme == null) {
      return this;
    }

    return copyWith(
      appBar: theme.appBar,
      backgroundColor: theme.backgroundColor,
      cardMargin: theme.cardMargin,
      cardPadding: theme.cardPadding,
      margin: theme.margin,
    );
  }

  static FormStyle defaultTheme(BuildContext context) {
    return FormStyle(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: false,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.close),
        ),
      ),
      margin: const EdgeInsets.only(left: 15, right: 15),
      cardMargin: const EdgeInsets.only(top: 16),
      cardPadding: const EdgeInsets.all(8),
    );
  }
}
