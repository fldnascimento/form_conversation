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
        const FormItemMessage(
          delay: 1000,
          card: FormCard(
            text: 'Olá! 😃',
          ),
        ),
        const FormItemMessage(
          delay: 3000,
          card: FormCard(
            text: 'Que bom ver você aqui!',
          ),
        ),
        const FormItemMessage(
          delay: 6000,
          card: FormCard(
            text:
                'Para começar, separe seu documento de identidade com foto. A abertura da sua conta é rápida e leva poucos minutos.',
          ),
        ),
        const FormItemMessage(
          delay: 2000,
          card: FormCard(
            text: 'Primeiro, qual tipo de conta você quer abrir?',
          ),
        ),
        FormItemAction(
          tag: 'teste',
          name: 'Teste',
          delay: 1000,
          card: const FormCard(
            text: 'Teste3',
          ),
          action: FormTextField(
            tag: 'teste',
            formController: controller,
            hintText: 'teste',
            onChanged: (value) {
              controller.setValue('teste', value);
              controller.setValue('__edit__', value);
            },
            suffix: FormIconButton(
              icon: const Icon(
                Icons.send,
                color: Colors.white,
                size: 18,
              ),
              onPressed: () {
                controller.addScreenAnswer(
                  const FormAnswer(
                    tag: 'teste',
                    text: 'teste',
                  ),
                );
              },
            ),
          ),
        ),
        FormItemAction(
          tag: 'teste4',
          name: 'Teste 4',
          delay: 1000,
          card: const FormCard(
            text: 'Teste4',
          ),
          action: FormTextField(
            tag: 'teste4',
            formController: controller,
            hintText: 'teste',
            onChanged: (value) {
              print(value);
            },
            suffix: FormIconButton(
              icon: const Icon(
                Icons.send,
                color: Colors.white,
                size: 18,
              ),
              onPressed: () {
                controller.buildNextItem();
              },
            ),
          ),
        ),
      ],
    );
  }
}
