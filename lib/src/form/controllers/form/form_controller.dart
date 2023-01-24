import 'package:flutter/foundation.dart';

import '../../../core/controller.dart';
import '../../constants/strings_constants.dart';
import '../../models/form_item_action.dart';
import '../../models/form_item_base.dart';
import '../../models/form_screen_item.dart';
import '../../widgets/form_answer.dart';
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

  void init(List<FormItemBase> formItems) {
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

  Future<void> addScreen(FormItemBase item) async {
    emit(state.copyWith(status: FormStateStatus.loading));
    await Future.delayed(Duration(milliseconds: item.delay), () async {
      if (item is FormItemAction) {
        _addScreenItemAction(item);
      } else {
        _addScreenItemBase(item);
      }
    });
  }

  void _addScreenItemBase(FormItemBase item) {
    final widget = FormScreenItemModel(
      widget: item.card,
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

  void _addScreenItemAction(FormItemAction item) {
    final widget = FormScreenItemModel(
      widget: item.card,
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

  FormItemAction getFormItemByTag(String tag) {
    return state.formItems!
        .whereType<FormItemAction>()
        .where((element) => element.tag == tag)
        .first;
  }

  ValueNotifier getValue(String tag) {
    return state.values[tag]!;
  }

  void setValue<T>(String? tag, T value) {
    if (!_isEdit(tag)) {
      state.values[tag]?.value = value;
    }
  }

  void buildNextItem() {
    // first item
    if (state.formScreenItems.isEmpty) {
      addScreen(state.currentItem!);
      return;
    }

    // build next item
    if (buildNext) {
      int indexItem =
          state.formScreenItems.where((element) => element.hash != null).length;
      addScreen(state.formItems![indexItem]);
      return;
    }
  }

  bool get buildNext {
    bool notItemLast = state.formItems!.length >
        state.formScreenItems.where((element) => element.hash != null).length;
    return notItemLast;
  }

  void addScreenAnswer(FormAnswer answer) {
    if (!_isEdit(answer.tag)) {
      emit(
        state.copyWith(
          formScreenItems: [
            ...state.formScreenItems,
            FormScreenItemModel(widget: answer),
          ],
          status: FormStateStatus.editing,
        ),
      );
      buildNextItem();
    } else {
      state.values[answer.tag]?.value = getValue(StringConstants.tagEdit).value;
      _popModalEdit();
    }
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
