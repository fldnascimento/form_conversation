import 'package:flutter/material.dart';
import 'package:form_conversation/form_conversation.dart';
import 'package:form_conversation/src/form/widgets/form_modal_edit.dart';

class FormAnswer extends StatelessWidget {
  final String? tag;
  final bool edit;
  final String? text;
  final Function()? onTap;

  const FormAnswer({
    super.key,
    this.text,
    this.tag,
    this.onTap,
    this.edit = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Visibility(
          visible: edit,
          child: GestureDetector(
            onTap: () async {
              showModalEdit(tag!, context);
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(40),
                  ),
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,
                    style: BorderStyle.solid,
                  ),
                  color: Colors.grey),
              child: Container(
                margin: const EdgeInsets.all(2),
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        if (tag != null)
          ValueListenableBuilder(
            valueListenable: context.controller.getValue(tag!),
            builder: (context, value, child) => AnswerCard(text: value),
          )
        else
          AnswerCard(text: text!),
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
        ),
      ),
      // color: const Color(0xFF1A61AF),
      color: Theme.of(context).colorScheme.secondary,
      elevation: 0,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 250),
        margin: const EdgeInsets.all(10),
        child: Text(
          text,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
