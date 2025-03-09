import 'package:currency_exchange/feature/currency_exchange/data/models/currency_exchange_model.dart';
import 'package:currency_exchange/feature/currency_exchange/presentation/view/widget/currency_exchange_widgets/currency_exchange_widget.dart';
import 'package:currency_exchange/feature/currency_exchange/presentation/view/widget/currency_exchange_widgets/custom_button.dart';
import 'package:currency_exchange/feature/currency_exchange/presentation/view/widget/currency_exchange_widgets/custom_pagination_buttons.dart';
import 'package:currency_exchange/feature/currency_exchange/presentation/view/widget/currency_exchange_widgets/date_picker_field.dart';
import 'package:currency_exchange/feature/currency_exchange/presentation/view/widget/currency_exchange_widgets/spread_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyExchangeBodyWidget extends StatelessWidget {
  const CurrencyExchangeBodyWidget(
      {super.key, required this.currencyExchangeModel});
  final CurrencyExchangeModel currencyExchangeModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 25.h),
            DatePickerField(
                datePickerWidgetModel: currencyExchangeModel.startDateModel),
            SizedBox(height: 25.h),
            DatePickerField(
                datePickerWidgetModel: currencyExchangeModel.endDateModel),
            SizedBox(height: 25.h),
            const CurrencyExchangeWidget(),
            SizedBox(height: 25.h),
            CustomButton(isFormField: currencyExchangeModel.isFormField),
            SizedBox(height: 25.h),
            SpreadSheetWidget(
                currentPageNotifier: currencyExchangeModel.currentPageNotifier),
            SizedBox(height: 10.h),
            CustomPaginationButton(
                currentPageNotifier: currencyExchangeModel.currentPageNotifier)
          ],
        ),
      ),
    );
  }
}
