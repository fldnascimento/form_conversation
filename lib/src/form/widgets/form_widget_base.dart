import 'package:flutter/material.dart';

import '../../../form_conversation.dart';
import '../../core/controller_builder.dart';
import '../controllers/form/form_state.dart' as form;
import '../models/form_base.dart';
import 'form_loading.dart';

class FormWidgetBase extends StatefulWidget {
  final FormController controller;
  final List<FormBase> formItems;
  const FormWidgetBase({
    super.key,
    required this.controller,
    required this.formItems,
  });

  @override
  State<FormWidgetBase> createState() => _FormWidgetBaseState();
}

class _FormWidgetBaseState extends State<FormWidgetBase> {
  @override
  void initState() {
    widget.controller.init(widget.formItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FormBase'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              child: Container(
                alignment: Alignment.bottomLeft,
                margin: const EdgeInsets.only(left: 15, right: 15),
                child: ControllerBuilder<FormController, form.FormState>(
                  bloc: context.controller,
                  builder: (context, state) {
                    if (state.status == FormStateStatus.editing) {
                      if (state.currentItem is! FormAction) {
                        widget.controller.buildNextItem();
                      }
                    }
                    final items =
                        state.formScreenItems.map((e) => e.widget).toList();

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ...items,
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          ControllerBuilder<FormController, form.FormState>(
            bloc: context.controller,
            builder: (context, state) {
              if (state.status == FormStateStatus.editing) {
                final currentItem = state.currentItem;
                if (currentItem is FormAction) {
                  return currentItem.action;
                }
              }
              return Visibility(
                visible: state.status == FormStateStatus.loading,
                child: const Center(
                  child: FormLoading(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
