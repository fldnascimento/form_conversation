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
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormConversation(
      controller: controller,
      // formCardStyle: FormCardStyle(
      //   color: Colors.green.shade900.shade900.shade900,
      // ),
      // formAnswerStyle: const FormAnswerStyle(
      //   color: Colors.amber
      // ),
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
        FormAction(
          tag: 'account_type',
          name: 'Tipo de conta',
          text: 'Primeiro, qual tipo de conta você quer abrir?',
          edit: false,
          builder: (context, tag, edit) {
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
                      builder: (_, value, child) {
                        return Column(
                          children: [
                            RadioListTile(
                              activeColor: const Color(0xFFFCCD16),
                              controlAffinity: ListTileControlAffinity.trailing,
                              title: Text(
                                "Abrir uma conta pessoal",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .shade50,
                                    ),
                              ),
                              value: "Abrir uma conta pessoal",
                              groupValue: value,
                              onChanged: (value) {
                                controller.setValue(tag, value);
                              },
                            ),
                            RadioListTile(
                              activeColor: const Color(0xFFFCCD16),
                              controlAffinity: ListTileControlAffinity.trailing,
                              title: Text(
                                "Abrir uma conta para a minha empresa",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .shade50,
                                    ),
                              ),
                              value: "Abrir uma conta para a minha empresa",
                              groupValue: value,
                              onChanged: (value) {
                                controller.setValue(tag, value);
                              },
                            ),
                            const SizedBox(height: 16),
                            FormButton(
                              backgroundColor: const Color(0xFFFCCD16),
                              label: 'CONFIRMAR',
                              onPressed: () {
                                Navigator.pop(context);
                                controller.addToScreenAnswer(
                                  tag: tag,
                                  edit: edit,
                                );
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
        FormAction(
          tag: 'name',
          name: 'Nome',
          text: 'Digite seu nome',
          edit: false,
          builder: (context, tag, edit) {
            return FormTextFieldAndButton(
              tag: tag,
              edit: edit,
              hintText: 'Digite seu nome',
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value != null && value.length <= 3) {
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
          tag: 'cpf',
          name: 'CPF',
          text: 'Digite seu CPF',
          builder: (context, tag, edit) {
            return FormTextFieldAndButton(
              tag: tag,
              edit: edit,
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
          text: 'Informe seu e-mail',
          name: 'E-mail',
          builder: (context, tag, edit) {
            return FormTextFieldAndButton(
              tag: tag,
              edit: edit,
              hintText: 'Digite aqui seu e-mail',
              backgroundColor: const Color(0xFFFCCD16),
              formController: controller,
            );
          },
        ),
        FormAction(
          tag: 'apelido',
          name: 'Apelido',
          text: 'Me fala seu apelido',
          builder: (context, tag, edit) {
            return FormTextFieldAndButton(
              tag: tag,
              edit: edit,
              hintText: 'Digite seu apelido',
              backgroundColor: const Color(0xFFFCCD16),
              formController: controller,
            );
          },
        ),
        FormMessage(
          text:
              'Cadastro finalizado!\nRevise seus dados e envie suas informações.',
        ),
        FormWidget(
          delay: 2000,
          child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: FormButton(
              label: 'ENVIAR INFORMAÇÕES',
              backgroundColor: const Color(0xFFFCCD16),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
