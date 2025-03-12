import 'package:currency_exchange/core/assets/colors.dart';
import 'package:currency_exchange/core/assets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPaginationButton extends StatefulWidget {
  const CustomPaginationButton(
      {super.key, required this.currentPageNotifier, required this.totalPages});
  final ValueNotifier<int> currentPageNotifier;
  final int totalPages;

  @override
  State<CustomPaginationButton> createState() => _CustomPaginationButtonState();
}

class _CustomPaginationButtonState extends State<CustomPaginationButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              widget.currentPageNotifier.value > 0
                  ? setState(() {
                      widget.currentPageNotifier.value--;
                    })
                  : null;
            },
            icon: Icon(Icons.arrow_back_ios_outlined,
                color: widget.currentPageNotifier.value > 0
                    ? AppColors.blue
                    : AppColors.grey,
                size: 18.sp)),
        Text("${widget.currentPageNotifier.value + 1} / ${widget.totalPages}",
            style: AppStyles.font14Bold.copyWith(color: AppColors.blue)),
        IconButton(
            onPressed: () {
              widget.currentPageNotifier.value < widget.totalPages - 1
                  ? setState(() {
                      widget.currentPageNotifier.value++;
                    })
                  : null;
            },
            icon: Icon(Icons.arrow_forward_ios,
                color: widget.currentPageNotifier.value > widget.totalPages - 2
                    ? AppColors.grey
                    : AppColors.blue,
                size: 18.sp))
      ],
    );
  }
}
