import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_conversation/form_conversation.dart';

import '../test_widget.dart';

void main() {
  late FormController controller;
  late FormAction formAction;

  setUp(() {
    controller = FormController();
    formAction = FormAction(
      delay: 0,
      name: 'Test',
      tag: 'test',
      text: 'Message test',
      builder: (BuildContext context, String tag, bool edit) {
        return FormTextFieldAndButton(
          tag: tag,
          edit: edit,
          hintText: '',
          formController: controller,
        );
      },
    );
  });

  testWidgets('should load custom style for form text field', (tester) async {
    await tester.pumpWidget(
      TestWidget(
        child: FormConversation(
          formTextFieldStyle: const FormTextFieldStyle(
            style: TextStyle(
              color: Colors.red,
              fontSize: 10,
            ),
          ),
          controller: controller,
          formItems: [formAction],
        ),
      ),
    );

    await tester.pumpAndSettle();

    final formTextFieldFind = find.descendant(
      of: find.byType(FormTextField),
      matching: find.byType(TextField),
    );

    final formTextField = (tester.firstWidget(formTextFieldFind) as TextField);

    expect(formTextField.style?.color, Colors.red);
    expect(formTextField.style?.fontSize, 10);
  });
}
