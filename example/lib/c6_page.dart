import 'package:flutter/material.dart';
import 'package:form_conversation/form_conversation.dart';

class C6Page extends StatefulWidget {
  const C6Page({super.key});

  @override
  State<C6Page> createState() => _C6PageState();
}

class _C6PageState extends State<C6Page> {
  late FormController controller;

  @override
  void initState() {
    controller = FormController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormConversation(
      controller: controller,
      formItems: [
        const FormItem(
          delay: 2000,
          card: FormCard(
            text: 'Teste',
          ),
        ),
        FormItem(
          delay: 2000,
          card: const FormCard(
            text: 'Teste2',
          ),
          action: ElevatedButton(
            child: const Text('teste'),
            onPressed: () {},
          ),
        ),
        FormItem(
          delay: 3000,
          card: const FormCard(
            text: 'Teste3',
          ),
          action: ElevatedButton(
            child: const Text('teste'),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
