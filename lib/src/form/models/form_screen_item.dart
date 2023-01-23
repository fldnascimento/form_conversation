import 'package:flutter/material.dart';

class FormScreenItemModel {
  final int? hash;
  final Widget widget;

  const FormScreenItemModel({
    required this.widget,
    this.hash,
  });
}
