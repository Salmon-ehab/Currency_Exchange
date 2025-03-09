import 'package:currency_exchange/core/assets/colors.dart';
import 'package:currency_exchange/core/assets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.isFormField});
  final bool isFormField;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: isFormField ? () => print("salma") : null, 
      color:  AppColors.blue ,
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
