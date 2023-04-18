import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_conversation/form_conversation.dart';

void main() {
  late FormController controller;
  late FormAction formItemAction;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    
    controller = FormController();
    formItemAction = FormAction(
      name: 'Test',
      tag: 'test',
      text: 'Message test',
      builder: (BuildContext context, String tag, bool edit) {
        return const SizedBox();
      },
    );
  });

  test('should added form item to screen', () async {
    var formItem = FormMessage(text: 'Message test');
    await controller.addToScreen(formItem);

    expect(controller.state.formScreenItems.first.hash, formItem.hashCode);
  });

  test('should added form action item to screen', () async {
    await controller.addToScreen(formItemAction);
    expect(
        controller.state.formScreenItems.first.hash, formItemAction.hashCode);
  });

  test('should added form widget item to screen', () async {
    var formItem = const FormWidget(child: SizedBox());
    await controller.addToScreen(formItem);

    expect(controller.state.formScreenItems.first.hash, formItem.hashCode);
  });

  test('should added answer to screen', () async {
    controller.addToScreenAnswer(
        tag: 'test', text: 'message test', edit: false);

    final widgetAnswer =
        (controller.state.formScreenItems.first.widget as FormAnswer);
    expect(widgetAnswer.tag, 'test');
  });

  test('should added answer widget to screen', () async {
    controller.addToScreenAnswerWidget(const SizedBox());
    expect(controller.state.formScreenItems.first.widget, isA<SizedBox>());
  });

  test('should return form item by tag', () async {
    controller.init([formItemAction]);
    final item = controller.getFormItemByTag('test');
    expect(formItemAction, item);
  });

  test('should set value in form item', () async {
    await controller.addToScreen(formItemAction);
    controller.setValue<String>('test', 'value test!');
    expect(controller.getValue<String>('test').value, 'value test!');
  });

  test('should return a map with all data form', () async {
    await controller.addToScreen(formItemAction);
    controller.setValue<String>('test', 'value test!');
    final data = controller.getAllFormData();
    expect(data['test'], 'value test!');
  });
}
