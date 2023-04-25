# Form Conversation

![Pub dev](https://img.shields.io/badge/pub-v1.0.0-blue)
![Coverage Status](https://img.shields.io/badge/coverage-93.9%25-green)

## Overview

A package to create forms in conversation format.

## Screenshots

<p float="left">
<img src="https://felipe.li/form_conversation.png" width="300" alt="search page" />
</p>

## Usage
To use it, just create a widget and implement `FormConversation` passing a `FormController` controller and the form Items.

```dart
import 'package:form_conversation/form_conversation.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final FormController controller = FormController();

  @override
  Widget build(BuildContext context) {
    return FormConversation(
        controller: controller,
        formItems: [
            FormMessage(
                text: 'Olá! 😃',
                delay: 1000,
            ),
            FormMessage(
                text: 'Que bom ver você aqui!',
            ),
            FormAction(
                tag: 'name',
                name: 'Nome',
                text: 'Digite seu nome',
                edit: true,
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
                        formController: controller,
                    );
                },
            ),
        ]
    );
  }
}

```
