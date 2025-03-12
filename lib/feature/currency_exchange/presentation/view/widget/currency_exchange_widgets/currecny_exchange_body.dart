import 'package:currency_exchange/feature/currency_exchange/data/view_models/currency_exchange_state.dart';
import 'package:currency_exchange/feature/currency_exchange/data/models/currency_exchange_model.dart';
import 'package:currency_exchange/feature/currency_exchange/presentation/view/widget/currency_exchange_widgets/currency_exchange_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrecnyExchangeBody extends StatefulWidget {
  const CurrecnyExchangeBody({super.key});

  @override
  State<CurrecnyExchangeBody> createState() => _CurrecnyExchangeBodyState();
}

class _CurrecnyExchangeBodyState extends State<CurrecnyExchangeBody> {
  late CurrencyExchangeState exchangeState;
  late ValueNotifier<int> currentPageNotifier;

  @override
  void initState() {
    super.initState();
    exchangeState = CurrencyExchangeState(
      onUpdate: () {
        setState(() {});
      },
    );
    currentPageNotifier = ValueNotifier<int>(0);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20.h),
          CurrencyExchangeBodyWidget(
            currencyExchangeModel: CurrencyExchangeModel(
              startDateModel: exchangeState.startDateModel,
              endDateModel: exchangeState.endDateModel,
              isFormField: exchangeState.isFormField,
              currentPageNotifier: currentPageNotifier,
              sourceCurr: exchangeState.sourceCurrency,
              targetCurr: exchangeState.targetCurrency,
            ),
          ),
        ],
      ),
    );
  }
}
