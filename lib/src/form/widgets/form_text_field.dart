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
  final ToolbarOptions? toolbarOptions;
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
    this.autocorrect = true,
    this.focusNode,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.textDirection,
    this.textAlignVertical,
    this.toolbarOptions,
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
      toolbarOptions: toolbarOptions,
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
