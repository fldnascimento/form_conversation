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
        FormMessage(
          delay: 1000,
          text: 'Olá! 😃',
        ),
        FormMessage(
          text: 'Que bom ver você aqui!',
        ),
        FormMessage(
          text:
              'Para começar, separe seu documento de identidade com foto. A abertura da sua conta é rápida e leva poucos minutos.',
        ),
        FormMessage(
          text: 'Primeiro, qual tipo de conta você quer abrir?',
        ),
        FormAction(
          tag: 'name',
          name: 'Nome',
          text: 'Digite seu nome',
          edit: false,
          action: FormTextField(
            tag: 'name',
            formController: controller,
            hintText: 'Digite seu nome',
            suffix: FormIconButton(
              onPressed: () {
                controller.addToScreenAnswer(const FormAnswer(
                  edit: true,
                  tag: 'name',
                ));
              },
            ),
          ),
        ),
        FormAction(
          tag: 'cpf',
          name: 'CPF',
          text: 'Digite seu CPF',
          action: FormTextFieldAndButton(
            tag: 'cpf',
            hintText: 'Informe seu CPF',
            formController: controller,
          ),
        ),
        FormAction(
          tag: 'email',
          text: 'Digite seu e-mail',
          name: 'E-mail',
          action: FormButton(
            onPressed: () {},
            label: 'SELECIONAR',
          ),
        ),
      ],
    );
  }
}
