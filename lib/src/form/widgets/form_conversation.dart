import 'package:flutter/material.dart';

import '../controllers/form/form_controller.dart';
import '../models/form_base.dart';
import '../style/form_answer_style.dart';
import '../style/form_button_style.dart';
import '../style/form_card_style.dart';
import '../style/form_icon_button_style.dart';
import '../style/form_loading_style.dart';
import '../style/form_style.dart';
import '../style/form_text_field_style.dart';
import 'form_inherited_widget.dart';
import 'form_widget_base.dart';

class FormConversation extends StatelessWidget {
  final FormController controller;

  final List<FormBase> formItems;
  final FormStyle? formStyle;
  final FormCardStyle? formCardStyle;
  final FormAnswerStyle? formAnswerStyle;
  final FormButtonStyle? formButtonStyle;
  final FormIconButtonStyle? formIconButtonStyle;
  final FormLoadingStyle? formLoadingStyle;
  final FormTextFieldStyle? formTextFieldStyle;

  const FormConversation({
    Key? key,
    required this.controller,
    required this.formItems,
    this.formStyle,
    this.formCardStyle,
    this.formAnswerStyle,
    this.formButtonStyle,
    this.formIconButtonStyle,
    this.formLoadingStyle,
    this.formTextFieldStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormInheritedWidget(
      controller: controller,
      formItems: formItems,
      styles: [
        FormStyle.defaultTheme(context).merge(formStyle),
        FormCardStyle.defaultTheme(context).merge(formCardStyle),
        FormAnswerStyle.defaultTheme(context).merge(formAnswerStyle),
        FormButtonStyle.defaultTheme(context).merge(formButtonStyle),
        FormIconButtonStyle.defaultTheme(context).merge(formIconButtonStyle),
        FormLoadingStyle.defaultTheme(context).merge(formLoadingStyle),
        FormTextFieldStyle.defaultTheme(context).merge(formTextFieldStyle),
      ],
      child: FormWidgetBase(
        controller: controller,
        formItems: formItems,
      ),
    );
  }
}
