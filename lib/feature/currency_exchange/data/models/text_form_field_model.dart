import 'package:flutter/material.dart';

class TextFormFieldModel {
  final TextEditingController textEditingController;
  final Function()? onDateSelected;
  final String label;
  final bool isEnabled;

  TextFormFieldModel(
      {required this.textEditingController,
      required this.onDateSelected,
      required this.label,
       this.isEnabled=true});
}
