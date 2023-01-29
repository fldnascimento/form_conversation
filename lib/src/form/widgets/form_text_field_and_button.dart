import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../controllers/form/form_controller.dart';
import 'form_icon_button.dart';
import 'form_text_field.dart';

class FormTextFieldAndButton extends StatefulWidget {
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
    this.autovalidateMode,
    this.validator,
    this.validateIfIsEmpty = true,
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
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final bool validateIfIsEmpty;

  @override
  State<FormTextFieldAndButton> createState() => _FormTextFieldAndButtonState();
}

class _FormTextFieldAndButtonState extends State<FormTextFieldAndButton> {
  final _formKey = GlobalKey<FormState>();
  bool _enableBtn = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: () => setState(
        () => _enableBtn = _formKey.currentState?.validate() ?? false,
      ),
      child: FormTextField(
        tag: widget.tag,
        autovalidateMode: widget.autovalidateMode,
        validator: widget.validator,
        formController: widget.formController,
        autofocus: widget.autofocus,
        controller: widget.controller,
        initialValue: widget.initialValue,
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.keyboardType,
        margin: widget.margin,
        obscureText: widget.obscureText,
        onChanged: (value) {
          if (widget.validateIfIsEmpty) {
            if (value.isEmpty) {
              _enableBtn = false;
            }
          }

          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        },
        onTap: widget.onTap,
        showErrorText: widget.showErrorText,
        hintText: widget.hintText,
        suffix: FormIconButton(
          backgroundColor: widget.backgroundColor,
          onPressed: !_enableBtn
              ? null
              : () {
                  widget.formController
                      .addToScreenAnswer(tag: widget.tag, edit: widget.edit);
                },
        ),
      ),
    );
  }
}
