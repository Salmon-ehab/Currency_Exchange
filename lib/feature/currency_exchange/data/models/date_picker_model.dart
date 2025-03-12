import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerWidgetModel {
  String label;
  DateTime? minDate;
  DateTime? compareDate;
  bool isStart;
  DateTime? selectedDate;
  Function(DateTime?)? onDateSelected;
  bool isEnabled;
  TextEditingController textEditingController;

  DatePickerWidgetModel({
    required this.label,
    this.minDate,
    this.compareDate,
    required this.isStart,
    this.selectedDate,
    required this.onDateSelected,
    this.isEnabled = true,
  }) : textEditingController = TextEditingController(
          text: selectedDate != null
              ? DateFormat('dd/MM/yyyy').format(selectedDate)
              : '',
        );

  void updateSelectedDate(BuildContext context) async {
     if (!isEnabled) return;
    DateTime? picked = await showDatePicker(
      context: context,
      firstDate: minDate ?? DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      textEditingController.text = DateFormat('dd/MM/yyyy').format(picked);
      onDateSelected?.call(picked);
    }
  }

  bool get isDateInvalid {
    if (selectedDate != null && compareDate != null) {
      return isStart ? selectedDate!.isAfter(compareDate!) : false;
    }
    return false;
  }

 bool get isDifferenceMoreThanYear {
  if (selectedDate != null && compareDate != null) {
    Duration difference = selectedDate!.difference(compareDate!);
    return difference.inDays.abs() > 365; 
  }
  return false;
}

}
