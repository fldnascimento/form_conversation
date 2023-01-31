import 'package:flutter/material.dart';

import '../controllers/form/form_controller.dart';
import '../models/form_base.dart';
import '../style/form_answer_style.dart';
import '../style/form_button_style.dart';
import '../style/form_card_style.dart';
import '../style/form_icon_button_style.dart';
import '../style/form_loading_style.dart';
import 'form_inherited_widget.dart';
import 'form_widget_base.dart';

class FormConversation extends StatelessWidget {
  final FormController controller;

  final List<FormBase> formItems;
  final FormCardStyle? formCardStyle;
  final FormAnswerStyle? formAnswerStyle;
  final FormButtonStyle? formButtonStyle;
  final FormIconButtonStyle? formIconButtonStyle;
  final FormLoadingStyle? formLoadingStyle;

  const FormConversation({
    Key? key,
    required this.controller,
    required this.formItems,
    this.formCardStyle,
    this.formAnswerStyle,
    this.formButtonStyle,
    this.formIconButtonStyle,
    this.formLoadingStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormInheritedWidget(
      controller: controller,
      formItems: formItems,
      styles: [
        FormCardStyle.defaultTheme(context).merge(formCardStyle),
        FormAnswerStyle.defaultTheme(context).merge(formAnswerStyle),
        FormButtonStyle.defaultTheme(context).merge(formButtonStyle),
        FormIconButtonStyle.defaultTheme(context).merge(formIconButtonStyle),
        FormLoadingStyle.defaultTheme(context).merge(formLoadingStyle),
      ],
      child: FormWidgetBase(
        controller: controller,
        formItems: formItems,
      ),
    );
  }
}
