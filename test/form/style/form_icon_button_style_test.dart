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

  testWidgets('should load custom style for form icon button', (tester) async {
    await tester.pumpWidget(
      TestWidget(
        child: FormConversation(
          formIconButtonStyle: const FormIconButtonStyle(
            backgroundColor: Colors.red,
            elevation: 1000,
          ),
          controller: controller,
          formItems: [formAction],
        ),
      ),
    );

    await tester.pumpAndSettle();
    await tester.enterText(find.byType(FormTextField), "test answer!");
    await tester.pump();

    final buttonFind = find.descendant(
      of: find.byType(FormIconButton),
      matching: find.byType(RawMaterialButton),
    );

    final button = (tester.firstWidget(buttonFind) as RawMaterialButton);

    expect(button.fillColor, Colors.red);
    expect(button.elevation, 1000);
  });
}
