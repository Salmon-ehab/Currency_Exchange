import 'package:currency_exchange/feature/currency_exchange/data/models/date_picker_model.dart';
import 'package:flutter/material.dart';

class CurrencyExchangeModel {
  final DatePickerWidgetModel startDateModel;
  final DatePickerWidgetModel endDateModel;
  final bool isFormField;
  final ValueNotifier<int> currentPageNotifier;
  final ValueNotifier<String> sourceCurr;
  final ValueNotifier<String> targetCurr;

  CurrencyExchangeModel({
    required this.startDateModel,
    required String sourceCurr,
    required String targetCurr,
    required this.endDateModel,
    required this.isFormField,
    required this.currentPageNotifier,
  })  : sourceCurr = ValueNotifier<String>(sourceCurr),
        targetCurr = ValueNotifier<String>(targetCurr);

  
}
