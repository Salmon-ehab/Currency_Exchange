import 'package:currency_exchange/feature/currency_exchange/data/models/date_picker_model.dart';
import 'package:flutter/material.dart';

class CurrencyExchangeModel {
  final DatePickerWidgetModel startDateModel;
  final DatePickerWidgetModel endDateModel;
  final bool isFormField;
  final ValueNotifier<int> currentPageNotifier;

  CurrencyExchangeModel(
      {required this.startDateModel,
      required this.endDateModel,
      required this.isFormField,
      required this.currentPageNotifier});
}
