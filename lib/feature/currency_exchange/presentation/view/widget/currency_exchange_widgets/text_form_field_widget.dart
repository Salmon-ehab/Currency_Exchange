import 'package:currency_exchange/core/assets/colors.dart';
import 'package:currency_exchange/core/assets/images.dart';
import 'package:currency_exchange/core/assets/styles.dart';
import 'package:currency_exchange/core/utils/disabled_focus_node_widget.dart';
import 'package:currency_exchange/feature/currency_exchange/data/models/text_form_field_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({super.key, required this.textFormFieldModel});
  final TextFormFieldModel textFormFieldModel;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textFormFieldModel.textEditingController,
      enabled: textFormFieldModel.isEnabled,
      focusNode: AlwaysDisabledFocusNode(),
      style: AppStyles.font10SemiBold.copyWith(color: AppColors.blue),
      decoration: InputDecoration(
        labelText: textFormFieldModel.label,
        labelStyle: AppStyles.font10SemiBold.copyWith(color: AppColors.blue),
        prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: SvgPicture.asset(Images.calenderIcon,
                color: AppColors.grey.withOpacity(.5))),
        prefixIconConstraints: BoxConstraints(minWidth: 20.w, minHeight: 20.h),
        suffixIcon: IconButton(
            onPressed: textFormFieldModel.isEnabled
                ? textFormFieldModel.onDateSelected
                : null,
            icon: Icon(Icons.keyboard_arrow_down_outlined,
                color: textFormFieldModel.isEnabled
                    ? AppColors.blue
                    : AppColors.grey)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: const BorderSide(color: AppColors.blue)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: const BorderSide(color: AppColors.blue),
        ),
      ),
    );
  }
}