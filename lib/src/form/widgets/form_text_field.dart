import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/color_shade.dart';
import '../controllers/form/form_controller.dart';

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
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;

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
    this.validator,
    this.autovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      autovalidateMode: autovalidateMode,
      onTap: onTap,
      controller: controller,
      autofocus: autofocus,
      keyboardType: keyboardType,
      obscureText: obscureText,
      initialValue: initialValue,
      cursorColor: Theme.of(context).colorScheme.primary.shade200,
      validator: validator,
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
        suffixIcon: _suffix,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: Theme.of(context).colorScheme.primary.shade200,
            ),
        errorStyle: !showErrorText
            ? const TextStyle(color: Colors.transparent, fontSize: 0, height: 0)
            : const TextStyle(height: 0, wordSpacing: 1, fontSize: 10),
      ),
      inputFormatters: inputFormatters,
      onChanged: (value) {
        formController.setValue(tag, value);
        formController.setValueEdit(value);
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
