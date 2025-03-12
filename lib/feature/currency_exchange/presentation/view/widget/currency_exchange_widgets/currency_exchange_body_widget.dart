import 'package:currency_exchange/feature/currency_exchange/data/models/currency_exchange_model.dart';
import 'package:currency_exchange/feature/currency_exchange/presentation/view/widget/currency_exchange_widgets/custom_button.dart';
import 'package:currency_exchange/feature/currency_exchange/presentation/view/widget/currency_exchange_widgets/date_picker_field.dart';
import 'package:currency_exchange/feature/currency_exchange/presentation/view/widget/currency_exchange_widgets/spread_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'currency_exchange_widget.dart';

class CurrencyExchangeBodyWidget extends StatefulWidget {
  const CurrencyExchangeBodyWidget(
      {super.key, required this.currencyExchangeModel});
  final CurrencyExchangeModel currencyExchangeModel;

  @override
  State<CurrencyExchangeBodyWidget> createState() =>
      _CurrencyExchangeBodyWidgetState();
}

class _CurrencyExchangeBodyWidgetState
    extends State<CurrencyExchangeBodyWidget> {
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
              datePickerWidgetModel:
                  widget.currencyExchangeModel.startDateModel,
            ),
            SizedBox(height: 25.h),
            DatePickerField(
              datePickerWidgetModel: widget.currencyExchangeModel.endDateModel,
            ),
            SizedBox(height: 25.h),
            CurrencyExchangeWidget(
              sourceCurrencyNotifier: widget.currencyExchangeModel.sourceCurr,
              targetCurrencyNotifier: widget.currencyExchangeModel.targetCurr,
            ),
            SizedBox(height: 25.h),
            CustomButton(currencyExchangeModel: widget.currencyExchangeModel),
            SizedBox(height: 25.h),
            SpreadSheetWidget(
                currentPageNotifier:
                    widget.currencyExchangeModel.currentPageNotifier),
          ],
        ),
      ),
    );
  }
}
