import 'package:flutter/material.dart';

import '../../core/colors_util.dart';
import 'form_conversation.dart';
import 'form_modal.dart';

class FormAnswer extends StatelessWidget {
  final String? tag;
  final bool edit;
  final String? text;

  const FormAnswer({
    super.key,
    this.text,
    this.tag,
    this.edit = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(width: 10),
            if (tag != null)
              ValueListenableBuilder(
                valueListenable: context.controller.getValue(tag!),
                builder: (context, value, child) => AnswerCard(text: value),
              )
            else
              AnswerCard(text: text!),
            Visibility(
              visible: edit,
              child: TextButton(
                onPressed: () {
                  FormModal.showModalEdit(context: context, tag: tag!);
                },
                child: Text(
                  'Alterar',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.2,
                      ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AnswerCard extends StatelessWidget {
  final String text;
  const AnswerCard({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15.0),
          topLeft: Radius.circular(15.0),
          bottomLeft: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
      ),
      color: Theme.of(context).colorScheme.primary.shade50,
      elevation: 0,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 250),
        margin: const EdgeInsets.all(10),
        child: Text(
          text,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
