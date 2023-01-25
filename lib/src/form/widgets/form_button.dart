import 'package:flutter/material.dart';
import 'package:form_conversation/src/core/colors_util.dart';

class FormButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  final Color? backgroundColor;

  const FormButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color?>(backgroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary.shade600,
          ),
        ),
      ),
    );
  }
}
