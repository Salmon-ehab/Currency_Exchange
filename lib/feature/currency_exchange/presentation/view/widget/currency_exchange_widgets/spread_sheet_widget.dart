import 'package:currency_exchange/core/assets/colors.dart';
import 'package:currency_exchange/feature/currency_exchange/data/view_models/exchange_rate_provider.dart';
import 'package:currency_exchange/feature/currency_exchange/presentation/view/widget/currency_exchange_widgets/data_table_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpreadSheetWidget extends StatelessWidget {
  const SpreadSheetWidget({super.key, required this.currentPageNotifier});
  final ValueNotifier<int> currentPageNotifier;
  @override
  Widget build(BuildContext context) {
    final ExchangeRateProvider dataProvider = ExchangeRateProvider();
    return ValueListenableBuilder(
        valueListenable: currentPageNotifier,
        builder: (context, currentPage, _) {
          List<Map<String, dynamic>> displayedData =
              dataProvider.getDisplayedData(currentPage);
          return Container(
            width: 339.w,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.blue, width: 1),
              borderRadius: BorderRadius.circular(4.r),
            ),
            child:DataTableWidget(displayedData: displayedData)
          );
        });
  }
}
