import 'package:currency_exchange/core/assets/colors.dart';
import 'package:currency_exchange/feature/currency_exchange/presentation/view/widget/currency_exchange_widgets/currency_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowCurrecnyPickerWidget extends StatelessWidget {
  const ShowCurrecnyPickerWidget(
      {super.key, required this.selectedCurrency, required this.showCurrency});
  final String selectedCurrency;
  final Function() showCurrency;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.h,
        width: 120.w,
        decoration: BoxDecoration(
            border: Border.all(width: 1.2.w, color: AppColors.blue),
            borderRadius: BorderRadius.circular(4.r)),
        child: CurrencyPickerWidget(
            selectedCurrency: selectedCurrency, onPressed: showCurrency));
  }
}
