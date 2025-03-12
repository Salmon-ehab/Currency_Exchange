import 'package:currency_exchange/feature/currency_exchange/data/view_models/exchange_rate_provider.dart';
import 'package:currency_exchange/feature/currency_exchange/presentation/manager/currency_cubit.dart';
import 'package:currency_exchange/feature/currency_exchange/presentation/manager/currency_state.dart';
import 'package:currency_exchange/feature/currency_exchange/presentation/view/widget/currency_exchange_widgets/custom_pagination_buttons.dart';
import 'package:currency_exchange/feature/currency_exchange/presentation/view/widget/currency_exchange_widgets/data_table_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpreadSheetWidget extends StatelessWidget {
  const SpreadSheetWidget({super.key, required this.currentPageNotifier});
  final ValueNotifier<int> currentPageNotifier;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyCubit, CurrencyState>(builder: (context, state) {
      if (state is CurrencyLoadingState) {
        return const CircularProgressIndicator();
      } else if (State is CurrencyFailureState) {
        return const Center(
          child: Text("Error :error"),
        );
      } else if (state is CurrencySuccessState) {
        return ValueListenableBuilder<int>(
          valueListenable: currentPageNotifier,
          builder: (context, currentPage, _) {
            List<Map<String, dynamic>> displayedData =
                state.fetchCurrencyData.entries
                    .map((entry) => {
                          "date": entry.key
                              .toLocal()
                              .toString()
                              .split(" ")[0], 
                          "from": state.sourceCurrency, 
                          "to": state.targetCurrency,
                          "price": entry.value, 
                        })
                    .toList();
            final ExchangeRateProvider dataProvider =
                ExchangeRateProvider(exchangeRates: displayedData);

            return Column(
              children: [
                DataTableWidget(displayedData: dataProvider.getDisplayedData(currentPage)),
                SizedBox(height: 10.h),
                CustomPaginationButton(
                  currentPageNotifier: currentPageNotifier,
                  totalPages: dataProvider.totalPages,
                )
              ],
            );
          },
        );
      }
      return const DataTableWidget(displayedData: []);
    });
  }
}
