import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;

  const FormButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    // return ElevatedButton(onPressed: onPressed, child: Text("data"));
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
