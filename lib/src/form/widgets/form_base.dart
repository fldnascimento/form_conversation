import 'package:flutter/material.dart';

import '../../../form_conversation.dart';
import '../../core/controller_builder.dart';
import '../controllers/form/form_state.dart' as form;

class FormBase extends StatefulWidget {
  final FormController controller;
  final List<FormItem> formItems;
  const FormBase({
    super.key,
    required this.controller,
    required this.formItems,
  });

  @override
  State<FormBase> createState() => _FormBaseState();
}

class _FormBaseState extends State<FormBase> {
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
                      if (state.currentItem?.action == null) {
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
                return state.currentItem?.action ?? const SizedBox();
              }
              if (state.status == FormStateStatus.loading) {
                return Visibility(
                  visible: state.status == FormStateStatus.loading,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
