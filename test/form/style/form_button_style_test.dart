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
        return SizedBox(
          height: 50,
          child: FormButton(
            label: 'teste',
            onPressed: () {},
          ),
        );
      },
    );
  });

  testWidgets('should load custom style for form button', (tester) async {
    await tester.pumpWidget(
      TestWidget(
        child: FormConversation(
          formButtonStyle: FormButtonStyle(
            width: 1000,
            height: 1000,
          ),
          controller: controller,
          formItems: [formAction],
        ),
      ),
    );

    await tester.pumpAndSettle();

    final formButton = find.descendant(
      of: find.byType(FormButton),
      matching: find.byType(SizedBox),
    );

    final sizedBox = (tester.firstWidget(formButton) as SizedBox);

    expect(sizedBox.height, 1000);
    expect(sizedBox.width, 1000);
  });
}
