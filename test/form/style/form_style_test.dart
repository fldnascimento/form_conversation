import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_conversation/form_conversation.dart';
import 'package:form_conversation/src/form/widgets/form_widget_base.dart';

import '../test_widget.dart';

void main() {
  late FormController controller;
  late FormMessage formMessage;

  setUp(() {
    controller = FormController();
    formMessage = FormMessage(text: 'FormMessage test');
  });

  testWidgets('should load custom style for form', (tester) async {
    final appBar = AppBar(
      title: const Text("test"),
    );
    await tester.pumpWidget(
      TestWidget(
        child: FormConversation(
          formStyle: FormStyle(
            backgroundColor: Colors.yellow,
            appBar: appBar,
          ),
          controller: controller,
          formItems: [formMessage],
        ),
      ),
    );

    await tester.pumpAndSettle();

    final formFind = find.descendant(
      of: find.byType(FormWidgetBase),
      matching: find.byType(Scaffold),
    );

    final scaffold = (tester.firstWidget(formFind) as Scaffold);

    expect(scaffold.backgroundColor, Colors.yellow);
    expect(scaffold.appBar, appBar);
  });
}
