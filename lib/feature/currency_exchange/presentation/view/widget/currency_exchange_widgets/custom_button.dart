import 'package:currency_exchange/core/assets/colors.dart';
import 'package:currency_exchange/core/assets/styles.dart';
import 'package:currency_exchange/feature/currency_exchange/data/models/currency_exchange_model.dart';
import 'package:currency_exchange/feature/currency_exchange/presentation/manager/currency_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.currencyExchangeModel,
  });

  final CurrencyExchangeModel currencyExchangeModel;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: currencyExchangeModel.isFormField
          ? () => context.read<CurrencyCubit>().fetchCurrencyData(
              startDate:
                  currencyExchangeModel.startDateModel.selectedDate != null
                      ? currencyExchangeModel.startDateModel.selectedDate!
                          .toIso8601String()
                          .split('T')[0]
                      : "",
              endDate: currencyExchangeModel.endDateModel.selectedDate != null
                  ? currencyExchangeModel.endDateModel.selectedDate!
                      .toIso8601String()
                      .split('T')[0]
                  : "",
              sourceCurr: currencyExchangeModel.sourceCurr.value,
              targetCurr: currencyExchangeModel.targetCurr.value)
          : null,
      color: AppColors.blue,
      disabledColor: AppColors.grey.withOpacity(.4),
      height: 50.h,
      minWidth: 339.w,
      child: Text(
        "Submit",
        style: AppStyles.font14SemiBold.copyWith(color: AppColors.white),
      ),
    );
  }
}
