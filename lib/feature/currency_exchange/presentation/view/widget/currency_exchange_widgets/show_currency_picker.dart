import 'package:currency_exchange/feature/currency_exchange/presentation/view/widget/currency_exchange_widgets/show_currecny_picker_widget.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';

class ShowCurrencyPicker extends StatefulWidget {
  const ShowCurrencyPicker({super.key, required this.selectedCurrency});
  final String selectedCurrency;
  @override
  State<ShowCurrencyPicker> createState() => _ShowCurrencyPickerState();
}

class _ShowCurrencyPickerState extends State<ShowCurrencyPicker> {
  late String firstSelectedCurrency;
  @override
  void initState() {
    super.initState();
    firstSelectedCurrency = widget.selectedCurrency;
  }

  void showCurrency() {
    showCurrencyPicker(
        context: context,
        showFlag: true,
        showSearchField: true,
        onSelect: (Currency currency) {
          setState(() {
            firstSelectedCurrency = currency.code;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return ShowCurrecnyPickerWidget(
      selectedCurrency: firstSelectedCurrency,
      showCurrency: showCurrency,
    );
  }
}
