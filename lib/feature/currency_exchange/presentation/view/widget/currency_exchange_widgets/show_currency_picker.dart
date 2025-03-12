import 'package:currency_exchange/feature/currency_exchange/presentation/view/widget/currency_exchange_widgets/show_currecny_picker_widget.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';

class ShowCurrencyPicker extends StatelessWidget {
  const ShowCurrencyPicker({
    super.key,
    required this.selectedCurrency,
    required this.onCurrencySelected,
  });

  final String selectedCurrency;
  final ValueChanged<String> onCurrencySelected; 

  void showCurrency(BuildContext context) {
    showCurrencyPicker(
      context: context,
      showFlag: true,
      showSearchField: true,
      onSelect: (Currency currency) {
        onCurrencySelected(currency.code); 
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ShowCurrecnyPickerWidget(
      selectedCurrency: selectedCurrency,
      showCurrency: () => showCurrency(context), 
    );
  }
}
