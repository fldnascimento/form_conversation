import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../form_conversation.dart';
import '../constants/strings_constants.dart';

class FormTextField extends StatelessWidget {
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

  const FormTextField({
    super.key,
    required this.tag,
    required this.formController,
    this.hintText,
    this.onChanged,
    this.inputFormatters,
    this.autofocus = false,
    this.margin,
    this.controller,
    this.onTap,
    this.obscureText = false,
    this.showErrorText = false,
    this.initialValue,
    this.keyboardType,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      autofocus: autofocus,
      keyboardType: keyboardType,
      obscureText: obscureText,
      initialValue: initialValue,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        prefix: const SizedBox(width: 16),
        suffixIcon: _suffix,
        hintText: hintText,
        errorStyle: !showErrorText
            ? const TextStyle(
                color: Colors.transparent, fontSize: 0, height: 0)
            : const TextStyle(height: 0, wordSpacing: 1, fontSize: 10),
      ),
      inputFormatters: inputFormatters,
      onChanged: (value) {
        formController.setValue(tag, value);
        formController.setValue(StringConstants.tagEdit, value);
        if (onChanged != null) {
          onChanged!(value);
        }
      },
    );
  }

  Widget get _suffix {
    return Padding(
      padding: const EdgeInsets.only(
        right: 5,
      ),
      child: suffix,
    );
  }
}
