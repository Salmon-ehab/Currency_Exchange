import 'package:currency_exchange/feature/currency_exchange/data/view_models/currency_exchange_state.dart';
import 'package:currency_exchange/feature/currency_exchange/data/models/currency_exchange_model.dart';
import 'package:currency_exchange/feature/currency_exchange/presentation/view/widget/currency_exchange_widgets/currency_exchange_body_widget.dart';
import 'package:flutter/material.dart';

class CurrecnyExchangeBody extends StatefulWidget {
  const CurrecnyExchangeBody({super.key});

  @override
  State<CurrecnyExchangeBody> createState() => _CurrecnyExchangeBodyState();
}

class _CurrecnyExchangeBodyState extends State<CurrecnyExchangeBody> {

  late CurrencyExchangeState datePickerController;

  @override
  void initState() {
    super.initState();
    datePickerController = CurrencyExchangeState(
      onUpdate: () {
        setState(() {}); 
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> currentPageNotifier = ValueNotifier<int>(0);
    return CurrencyExchangeBodyWidget(
      currencyExchangeModel: CurrencyExchangeModel(
          startDateModel: datePickerController.startDateModel,
          endDateModel: datePickerController.endDateModel,
          isFormField: datePickerController.isFormField,
          currentPageNotifier: currentPageNotifier),
    );
  }
}
