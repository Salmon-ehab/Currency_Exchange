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
            child: Text("⚠️ تاريخ البداية لا يمكن أن يكون بعد تاريخ النهاية",
                style: TextStyle(color: Colors.red, fontSize: 12.sp)),
          ),
      ],
    );
  }
}
