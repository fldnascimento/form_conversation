import 'package:flutter/material.dart';

import '../style/form_answer_style.dart';
import 'form_inherited_widget.dart';
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
    final theme = context.loadStyle<FormAnswerStyle>();

    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints: theme.constraints,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: theme.padding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (tag != null)
                      ValueListenableBuilder(
                        valueListenable: context.controller.getValue(tag!),
                        builder: (context, value, child) =>
                            AnswerCard(text: value),
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
                          theme.textButton ?? '',
                          style: theme.textButtonStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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
    final theme = context.loadStyle<FormAnswerStyle>();

    return Card(
      shape: theme.shape,
      color: theme.color,
      elevation: theme.elevation,
      child: Container(
        margin: theme.margin,
        child: Text(
          text,
          style: theme.style,
        ),
      ),
    );
  }
}
