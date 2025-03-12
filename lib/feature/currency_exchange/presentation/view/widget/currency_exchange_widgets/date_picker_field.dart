import 'package:currency_exchange/feature/currency_exchange/data/models/date_picker_model.dart';
import 'package:currency_exchange/feature/currency_exchange/data/models/text_form_field_model.dart';
import 'package:currency_exchange/feature/currency_exchange/presentation/view/widget/currency_exchange_widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DatePickerField extends StatelessWidget {
  final DatePickerWidgetModel datePickerWidgetModel;
  const DatePickerField({super.key, required this.datePickerWidgetModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 50.h,
            width: 339.w,
            child: TextFormFieldWidget(
              textFormFieldModel: TextFormFieldModel(
                  textEditingController:
                      datePickerWidgetModel.textEditingController,
                  onDateSelected: () =>
                      datePickerWidgetModel.updateSelectedDate(context),
                  label: datePickerWidgetModel.label,
                  isEnabled: datePickerWidgetModel.isEnabled),
            )),
        if (datePickerWidgetModel.isDateInvalid)
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text("⚠️ The start date cannot be after the end date.",
                style: TextStyle(color: Colors.red, fontSize: 12.sp)),
          ),
          if (datePickerWidgetModel.isDifferenceMoreThanYear)
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text("⚠️ The Time-Frame you entered is too long,The difference between them must be less than one year. ",
            textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red, fontSize: 12.sp)),
          ),
      ],
    );
  }
}
