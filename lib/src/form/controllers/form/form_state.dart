// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import '../../models/form_item.dart';

enum FormStateStatus {
  initial,
  loading,
  editing,
  finish,
}

class FormState {
  final List<FormItem>? formItems;
  final List<FormItem> formScreenItems;
  final FormItem? currentItem;
  final FormStateStatus? status;

  const FormState({
    required this.formScreenItems,
    this.formItems,
    this.currentItem,
    this.status,
  });

  FormState copyWith({
    List<FormItem>? formItems,
    List<FormItem>? formScreenItems,
    FormItem? currentItem,
    FormStateStatus? status,
  }) {
    return FormState(
      formItems: formItems ?? this.formItems,
      currentItem: currentItem ?? this.currentItem,
      formScreenItems: formScreenItems ?? this.formScreenItems,
      status: status ?? this.status,
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

// class FormInitState extends FormState {}

// class FormLoadingState extends FormState {}

// class FormEditingState extends FormState {
//   final List<FormItem> formScreenItems;
//   final FormItem currentItem;

//   FormEditingState({
//     required this.formScreenItems,
//     required this.currentItem,
//   });
// }

// class FormFinishState extends FormState {}
