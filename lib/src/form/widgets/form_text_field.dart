import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../controllers/form/form_controller.dart';
import '../style/form_text_field_style.dart';
import 'form_inherited_widget.dart';

class FormTextField extends StatelessWidget {
  final String tag;
  final FormController formController;
  final String? hintText;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final bool autofocus;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool obscureText;
  final Function()? onTap;
  final String? initialValue;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final bool autocorrect;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool readOnly;
  final bool? showCursor;
  final String obscuringCharacter;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final bool? enabled;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool? enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final ScrollController? scrollController;
  final bool enableIMEPersonalizedLearning;
  final MouseCursor? mouseCursor;
  final void Function(String?)? onSaved;
  final String? restorationId;

  const FormTextField({
    super.key,
    required this.tag,
    required this.formController,
    this.hintText,
    this.onChanged,
    this.inputFormatters,
    this.autofocus = false,
    this.controller,
    this.onTap,
    this.obscureText = false,
    this.initialValue,
    this.keyboardType,
    this.suffix,
    this.validator,
    this.autovalidateMode,
    this.autocorrect = true,
    this.focusNode,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.textDirection,
    this.textAlignVertical,
    this.showCursor,
    this.smartDashesType,
    this.smartQuotesType,
    this.maxLengthEnforcement,
    this.minLines,
    this.maxLength,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.enabled,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.enableInteractiveSelection,
    this.selectionControls,
    this.buildCounter,
    this.scrollPhysics,
    this.autofillHints,
    this.scrollController,
    this.mouseCursor,
    this.decoration = const InputDecoration(),
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.start,
    this.readOnly = false,
    this.obscuringCharacter = '•',
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.expands = false,
    this.cursorWidth = 2.0,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enableIMEPersonalizedLearning = true,
    this.onSaved,
    this.restorationId,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.loadStyle<FormTextFieldStyle>();

    return TextFormField(
      style: theme.style,
      autovalidateMode: autovalidateMode,
      onTap: onTap,
      controller: controller,
      autofocus: autofocus,
      keyboardType: keyboardType,
      obscureText: obscureText,
      initialValue: initialValue,
      cursorColor: theme.cursorColor,
      validator: validator,
      decoration: theme.decoration?.copyWith(
        suffixIcon: _suffix(theme.suffixPadding!),
        hintText: hintText,
      ),
      inputFormatters: inputFormatters,
      onChanged: (value) {
        formController.setValue(tag, value);
        formController.setValueEdit(value);
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      autocorrect: autocorrect,
      autofillHints: autofillHints,
      buildCounter: buildCounter,
      cursorHeight: cursorHeight,
      cursorRadius: cursorRadius,
      cursorWidth: cursorWidth,
      enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
      enableInteractiveSelection: enableInteractiveSelection,
      enableSuggestions: enableSuggestions,
      enabled: enabled,
      expands: expands,
      focusNode: focusNode,
      keyboardAppearance: keyboardAppearance,
      maxLength: maxLength,
      maxLengthEnforcement: maxLengthEnforcement,
      key: key,
      maxLines: maxLines,
      minLines: minLines,
      mouseCursor: mouseCursor,
      obscuringCharacter: obscuringCharacter,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      readOnly: readOnly,
      restorationId: restorationId,
      scrollController: scrollController,
      scrollPadding: scrollPadding,
      scrollPhysics: scrollPhysics,
      selectionControls: selectionControls,
      showCursor: showCursor,
      smartDashesType: smartDashesType,
      smartQuotesType: smartQuotesType,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      textCapitalization: textCapitalization,
      textDirection: textDirection,
      textInputAction: textInputAction,
    );
  }

  Widget _suffix(EdgeInsets padding) {
    return Padding(
      padding: padding,
      child: suffix,
    );
  }
}
