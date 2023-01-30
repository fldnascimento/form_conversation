import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as wg;

import '../../../core/controller.dart';
import '../../constants/strings_constants.dart';
import '../../models/form_action.dart';
import '../../models/form_base.dart';
import '../../models/form_screen_item.dart';
import '../../widgets/form_answer.dart';
import '../../widgets/form_card.dart';
import 'form_state.dart';

class FormController extends Controller<FormState> {
  FormController()
      : super(
          const FormState(
            status: FormStateStatus.initial,
            formScreenItems: [],
            values: {},
          ),
        );

  void init(List<FormBase> formItems) {
    emit(
      state.copyWith(
        values: {StringConstants.tagEdit: ValueNotifier<String>('')},
        formItems: formItems,
        currentItem: formItems.first,
        status: FormStateStatus.editing,
        formScreenItems: [],
      ),
    );
  }

  Future<void> addToScreen(FormBase item) async {
    emit(state.copyWith(status: FormStateStatus.loading));
    await Future.delayed(Duration(milliseconds: item.delay), () async {
      if (item is FormAction) {
        _addScreenItemAction(item);
      } else {
        _addScreenItemBase(item);
      }
    });
  }

  void _addScreenItemBase(FormBase item) {
    final widget = FormScreenItemModel(
      widget: item.widget,
      hash: item.hashCode,
    );
    emit(
      state.copyWith(
        currentItem: item,
        formScreenItems: [...state.formScreenItems, widget],
        status: FormStateStatus.editing,
      ),
    );
  }

  void _addScreenItemAction(FormAction item) {
    final widget = FormScreenItemModel(
      widget: FormCard(text: item.text),
      hash: item.hashCode,
    );
    emit(
      state.copyWith(
        values: {
          ...state.values,
          item.tag: ValueNotifier<String>(StringConstants.empty)
        },
        currentItem: item,
        formScreenItems: [...state.formScreenItems, widget],
        status: FormStateStatus.editing,
      ),
    );
  }

  FormAction getFormItemByTag(String tag) {
    return state.formItems!
        .whereType<FormAction>()
        .where((element) => element.tag == tag)
        .first;
  }

  ValueNotifier<T> getValue<T>(String tag) {
    return state.values[tag]! as ValueNotifier<T>;
  }

  void setValue<T>(String? tag, T value) {
    if (!_isEdit(tag)) {
      state.values[tag]?.value = value;
    }
  }

  void setValueEdit<T>(T value) {
    state.values[StringConstants.tagEdit]?.value = value;
  }

  void buildNextItem() {
    // first item
    if (state.formScreenItems.isEmpty) {
      addToScreen(state.currentItem!);
      return;
    }

    // build next item
    if (buildNext) {
      int indexItem =
          state.formScreenItems.where((element) => element.hash != null).length;
      addToScreen(state.formItems![indexItem]);
      return;
    }
  }

  bool get buildNext {
    bool notItemLast = state.formItems!.length >
        state.formScreenItems.where((element) => element.hash != null).length;
    return notItemLast;
  }

  void addToScreenAnswer(
      {required String tag, String? text, required bool edit}) {
    if (!_isEdit(tag)) {
      emit(
        state.copyWith(
          formScreenItems: [
            ...state.formScreenItems,
            FormScreenItemModel(
              widget: FormAnswer(
                tag: tag,
                text: text,
                edit: edit,
              ),
            ),
          ],
          status: FormStateStatus.editing,
        ),
      );
      buildNextItem();
    } else {
      state.values[tag]?.value = getValue(StringConstants.tagEdit).value;
      _popModalEdit();
    }
  }

  void addToScreenAnswerWidget(wg.Widget widget) {
    emit(
      state.copyWith(
        formScreenItems: [
          ...state.formScreenItems,
          FormScreenItemModel(widget: widget),
        ],
        status: FormStateStatus.editing,
      ),
    );
    buildNextItem();
  }

  void _popModalEdit() {
    state.values[StringConstants.tagEdit]?.value = StringConstants.empty;
  }

  bool _isEdit(String? tag) {
    final listAnswer = state.formScreenItems
        .where((element) => element.widget is FormAnswer)
        .map((e) => e.widget as FormAnswer)
        .toList();

    return listAnswer.any((element) => element.tag == tag);
  }
}
