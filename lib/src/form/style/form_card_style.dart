import 'package:flutter/widgets.dart';
import 'package:form_conversation/src/core/style_base.dart';

class FormCardStyle extends StyleBase<FormCardStyle> {
  final ShapeBorder? shape;
  final EdgeInsetsGeometry? margin;

  FormCardStyle({
    this.shape,
    this.margin,
  });

  @override
  FormCardStyle copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }
}
