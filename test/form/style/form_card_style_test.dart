import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_conversation/form_conversation.dart';

import '../test_widget.dart';

void main() {
  late FormController controller;
  late FormMessage formMessage;

  setUp(() {
    controller = FormController();
    formMessage = FormMessage(text: 'FormMessage test');
  });

  testWidgets('should load custom style for form card', (tester) async {
    await tester.pumpWidget(
      TestWidget(
        child: FormConversation(
          formCardStyle: const FormCardStyle(
            color: Colors.white,
            elevation: 1000,
          ),
          controller: controller,
          formItems: [formMessage],
        ),
      ),
    );

    await tester.pumpAndSettle();

    final formCard = find.descendant(
      of: find.byType(FormCard),
      matching: find.byType(Card),
    );

    final card = (tester.firstWidget(formCard) as Card);

    expect(card.color, Colors.white);
    expect(card.elevation, 1000);
  });
}
