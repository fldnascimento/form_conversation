import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_conversation/form_conversation.dart';

import 'cpf_input_formatter.dart';
import 'cpf_validator.dart';

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
          builder: (context, tag) {
            return FormTextField(
              tag: tag,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter()
              ],
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (!CPFValidator.isValid(value)) {
                  return '';
                }
                return null;
              },
              formController: controller,
              hintText: 'Digite seu nome',
              suffix: FormIconButton(
                backgroundColor: const Color(0xFFFCCD16),
                onPressed: () {
                  controller.addToScreenAnswer(edit: true, tag: tag);
                },
              ),
            );
          },
        ),
        FormAction(
          tag: 'cpf',
          name: 'CPF',
          text: 'Digite seu CPF',
          builder: (context, tag) {
            return FormTextFieldAndButton(
              tag: tag,
              hintText: 'Informe seu CPF',
              autovalidateMode: AutovalidateMode.onUserInteraction,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter()
              ],
              validator: (value) {
                if (!CPFValidator.isValid(value)) {
                  return '';
                }
                return null;
              },
              backgroundColor: const Color(0xFFFCCD16),
              formController: controller,
            );
          },
        ),
        FormAction(
          tag: 'email',
          text: 'Digite seu e-mail',
          name: 'E-mail',
          builder: (context, tag) {
            return FormButton(
              backgroundColor: const Color(0xFFFCCD16),
              onPressed: () {
                FormModal.showModal(
                  context: context,
                  title: 'Selecione',
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ValueListenableBuilder<String>(
                      valueListenable: controller.getValue(tag),
                      builder: (context, value, child) {
                        return Column(
                          children: [
                            RadioListTile(
                              title: Text(
                                "Abrir uma conta pessoal",
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .shade50,
                                ),
                              ),
                              value: "pressoal",
                              groupValue: controller.getValue(tag),
                              onChanged: (value) {
                                controller.setValue(tag, value);
                              },
                            ),
                            RadioListTile(
                              title: Text(
                                "Abrir uma conta para a minha empresa",
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .shade50,
                                ),
                              ),
                              value: "empresa",
                              groupValue: controller.getValue(tag),
                              onChanged: (value) {
                                controller.setValue(tag, value);
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                );
              },
              label: 'SELECIONAR',
            );
          },
        ),
      ],
    );
  }
}
