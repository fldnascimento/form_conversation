import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_conversation/form_conversation.dart';

import '../test_widget.dart';

void main() {
  late FormController controller;
  late FormAction formAction;
  late FormMessage formMessage;

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
    formMessage = FormMessage(text: 'FormMessage test');
  });

  testWidgets('should render form action on screen', (tester) async {
    await tester.pumpWidget(
      TestWidget(
        child:
            FormConversation(controller: controller, formItems: [formAction]),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Message test'), findsOneWidget);
  });

  testWidgets('should render form message on screen', (tester) async {
    await tester.pumpWidget(
      TestWidget(
        child:
            FormConversation(controller: controller, formItems: [formMessage]),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('FormMessage test'), findsOneWidget);
  });

  testWidgets('should render form answer on screen', (tester) async {
    await tester.pumpWidget(
      TestWidget(
        child:
            FormConversation(controller: controller, formItems: [formAction]),
      ),
    );

    await tester.pumpAndSettle();
    await tester.enterText(find.byType(FormTextField), "test answer!");
    await tester.pump();

    await tester.tap(find.byType(RawMaterialButton));
    await tester.pumpAndSettle();

    expect(find.byType(FormAnswer), findsOneWidget);
  });

  testWidgets('should render form message and form action on screen',
      (tester) async {
    await tester.pumpWidget(
      TestWidget(
        child: FormConversation(
            controller: controller, formItems: [formMessage, formAction]),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Message test'), findsOneWidget);
    expect(find.text('FormMessage test'), findsOneWidget);
  });

  testWidgets('should edit form action answer', (tester) async {
    await tester.pumpWidget(
      TestWidget(
        child:
            FormConversation(controller: controller, formItems: [formAction]),
      ),
    );

    await tester.pumpAndSettle();
    await tester.enterText(find.byType(FormTextField), "test answer!");
    await tester.pump();

    await tester.tap(find.byType(RawMaterialButton));
    await tester.pumpAndSettle();

    expect(find.text('Alterar'), findsOneWidget);

    await tester.runAsync(() async {
      await tester.tap(find.text('Alterar'));
    });
    await tester.pumpAndSettle();

    expect(find.text('Corrigir Test'), findsOneWidget);

    final textFieldModal =
        find.byWidget(tester.widgetList(find.byType(FormTextField)).last);

    await tester.enterText(textFieldModal, "test answer2!");
    await tester.pump();

    final buttonModal =
        find.byWidget(tester.widgetList(find.byType(RawMaterialButton)).last);
    await tester.tap(buttonModal);
    await tester.pumpAndSettle();

    final answer = find.byWidgetPredicate(
      (widget) => widget is AnswerCard && widget.text == 'test answer2!',
    );

    expect(answer, findsOneWidget);
  });
}
