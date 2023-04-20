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

  testWidgets('should load custom style for form answer', (tester) async {
    await tester.pumpWidget(
      TestWidget(
        child: FormConversation(
          formAnswerStyle: const FormAnswerStyle(
            padding: EdgeInsets.all(0),
            color: Colors.white,
          ),
          controller: controller,
          formItems: [formAction],
        ),
      ),
    );

    await tester.pumpAndSettle();
    await tester.enterText(find.byType(FormTextField), "test answer!");
    await tester.pump();

    await tester.tap(find.byType(RawMaterialButton));
    await tester.pumpAndSettle();

    final answerCardFind = find.descendant(
      of: find.byType(AnswerCard),
      matching: find.byType(Card),
    );

    final color = (tester.firstWidget(answerCardFind) as Card).color;

    final answerPaddingFind = find.descendant(
      of: find.byType(FormAnswer),
      matching: find.byType(Padding),
    );

    final padding = (tester.firstWidget(answerPaddingFind) as Padding).padding;

    expect(color, Colors.white);
    expect(padding, const EdgeInsets.all(0));
  });
}
