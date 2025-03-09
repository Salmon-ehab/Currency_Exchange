import 'package:country_flags/country_flags.dart';
import 'package:currency_exchange/core/assets/colors.dart';
import 'package:currency_exchange/core/assets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyPickerWidget extends StatelessWidget {
  const CurrencyPickerWidget(
      {super.key, required this.selectedCurrency, required this.onPressed});
  final String selectedCurrency;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 10.w),
        CountryFlag.fromCountryCode(
          selectedCurrency.substring(0, 2).toUpperCase(),
          shape: const Circle(),
          width: 18.w,
          height: 18.h,
        ),
        SizedBox(width: 7.w),
        Text(selectedCurrency,
            style: AppStyles.font12SemiBold.copyWith(color: AppColors.blue)),
        SizedBox(width: 4.w),
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.grey,
            size: 20.sp,
          ),
        )
      ],
    );
  }
}
