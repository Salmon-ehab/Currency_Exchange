import 'package:currency_exchange/core/assets/colors.dart';
import 'package:currency_exchange/core/assets/images.dart';
import 'package:currency_exchange/feature/currency_exchange/presentation/view/widget/currency_exchange_widgets/show_currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CurrencyExchangeWidget extends StatelessWidget {
  const CurrencyExchangeWidget({
    super.key,
    required this.sourceCurrencyNotifier,
    required this.targetCurrencyNotifier,
  });
  final ValueNotifier<String> sourceCurrencyNotifier ;
  final ValueNotifier<String> targetCurrencyNotifier;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ValueListenableBuilder<String>(
            valueListenable: sourceCurrencyNotifier,
            builder: (context, sourceCurr, _) {
              return ShowCurrencyPicker(
                  selectedCurrency: sourceCurr,
                  onCurrencySelected: (newCurrency) {
                    sourceCurrencyNotifier.value = newCurrency;
                  });
            }),
        CircleAvatar(
          backgroundColor: AppColors.blue,
          radius: 18.r,
          child: SvgPicture.asset(Images.exchangeIcon),
        ),
        ValueListenableBuilder(
            valueListenable: targetCurrencyNotifier,
            builder: (context, targetCurr, _) {
              return ShowCurrencyPicker(
                selectedCurrency: targetCurr,
                onCurrencySelected: (newCurr) {
                  targetCurrencyNotifier.value = newCurr;
                },
              );
            })
      ],
    );
  }
}
