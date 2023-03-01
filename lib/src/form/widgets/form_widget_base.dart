import 'package:flutter/material.dart';

import '../../core/color_shade.dart';
import '../../core/controller_builder.dart';
import '../controllers/form/form_controller.dart';
import '../controllers/form/form_state.dart' as form;
import '../models/form_action.dart';
import '../models/form_base.dart';
import '../style/form_style.dart';
import 'form_inherited_widget.dart';
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
    final theme = context.loadStyle<FormStyle>();

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: theme.appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              child: Container(
                alignment: Alignment.bottomLeft,
                margin: theme.margin,
                child: ControllerBuilder<FormController, form.FormState>(
                  controller: context.controller,
                  builder: (context, state) {
                    if (state.status == form.FormStateStatus.editing) {
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
            controller: context.controller,
            builder: (context, state) {
              if (state.status == form.FormStateStatus.editing) {
                final currentItem = state.currentItem;
                if (currentItem is FormAction) {
                  return Container(
                    margin: theme.cardMargin,
                    color: Theme.of(context).colorScheme.primary.shade800,
                    padding: theme.cardPadding,
                    child: currentItem.builder(
                        context, currentItem.tag, currentItem.edit),
                  );
                }
              }
              return Visibility(
                visible: state.status == form.FormStateStatus.loading,
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
