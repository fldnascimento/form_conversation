import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../controllers/form/form_controller.dart';
import 'form_answer.dart';
import 'form_icon_button.dart';
import 'form_text_field.dart';

class FormTextFieldAndButton extends StatelessWidget {
  const FormTextFieldAndButton({
    super.key,
    required this.tag,
    required this.formController,
    this.showErrorText = false,
    this.obscureText = false,
    this.hintText,
    this.onChanged,
    this.inputFormatters,
    this.autofocus = false,
    this.keyboardType,
    this.margin,
    this.controller,
    this.onTap,
    this.initialValue,
    this.suffix,
    this.onPressed,
    this.edit = true,
    this.backgroundColor,
  });

  final String tag;
  final FormController formController;
  final String? hintText;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final bool autofocus;
  final TextInputType? keyboardType;
  final bool showErrorText;
  final EdgeInsetsGeometry? margin;
  final TextEditingController? controller;
  final bool obscureText;
  final Function()? onTap;
  final String? initialValue;
  final Widget? suffix;
  final Function()? onPressed;
  final bool edit;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return FormTextField(
      tag: tag,
      formController: formController,
      autofocus: autofocus,
      controller: controller,
      initialValue: initialValue,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      margin: margin,
      obscureText: obscureText,
      onChanged: onChanged,
      onTap: onTap,
      showErrorText: showErrorText,
      hintText: hintText,
      suffix: FormIconButton(
        backgroundColor: backgroundColor,
        onPressed: () {
          formController.addToScreenAnswer(tag: tag, edit: edit);
        },
      ),
    );
  }
}
