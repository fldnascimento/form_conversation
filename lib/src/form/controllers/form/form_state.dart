import 'package:flutter/foundation.dart';

import '../../models/form_base.dart';
import '../../models/form_screen_item.dart';

enum FormStateStatus {
  initial,
  loading,
  editing,
  finish,
}

class FormState {
  final List<FormBase>? formItems;
  final List<FormScreenItemModel> formScreenItems;
  final FormBase? currentItem;
  final FormStateStatus? status;
  final Map<String, ValueNotifier> values;

  const FormState({
    required this.formScreenItems,
    required this.values,
    this.formItems,
    this.currentItem,
    this.status,
  });

  FormState copyWith({
    List<FormBase>? formItems,
    List<FormScreenItemModel>? formScreenItems,
    FormBase? currentItem,
    FormStateStatus? status,
    Map<String, ValueNotifier>? values,
  }) {
    return FormState(
      formItems: formItems ?? this.formItems,
      currentItem: currentItem ?? this.currentItem,
      formScreenItems: formScreenItems ?? this.formScreenItems,
      status: status ?? this.status,
      values: values ?? this.values,
    );
  }

  @override
  bool operator ==(covariant FormState other) {
    if (identical(this, other)) return true;

    return listEquals(other.formItems, formItems) &&
        listEquals(other.formScreenItems, formScreenItems) &&
        other.currentItem == currentItem &&
        other.status == status;
  }

  @override
  int get hashCode {
    return formItems.hashCode ^
        formScreenItems.hashCode ^
        currentItem.hashCode ^
        status.hashCode;
  }
}
