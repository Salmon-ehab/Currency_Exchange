import 'package:currency_exchange/feature/currency_exchange/data/models/date_picker_model.dart';
import 'package:flutter/material.dart';

class CurrencyExchangeState {
  DateTime? firstSelectedDate;
  DateTime? endDate;
  bool get isFormField => firstSelectedDate != null && endDate != null;

  late DatePickerWidgetModel startDateModel;
  late DatePickerWidgetModel endDateModel;

  final VoidCallback onUpdate;
  String sourceCurrency = "EGP"; 
  String targetCurrency = "USD"; 

  CurrencyExchangeState({required this.onUpdate}) {
    startDateModel = DatePickerWidgetModel(
      label: 'Select start date',
      compareDate: endDate,
      onDateSelected: (date) {
        if (date != null) {
          firstSelectedDate = date;
          endDateModel.minDate = firstSelectedDate;
          updateState();
        }
      },
      isStart: true,
    );

    endDateModel = DatePickerWidgetModel(
      label: 'Select end date',
      compareDate: firstSelectedDate,
      minDate: firstSelectedDate,
      onDateSelected: (date) {
        if (date != null) {
          endDate = date;
          startDateModel.compareDate = date;
          updateState();
        }
      },
      isStart: false,
      isEnabled: false,
    );
  }

  void updateState() {
    endDateModel.isEnabled = firstSelectedDate != null;
    onUpdate();
  }

  
}
