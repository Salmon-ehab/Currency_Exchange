abstract class CurrencyState {}

class CurrencyInitialState extends CurrencyState {}

class CurrencyLoadingState extends CurrencyState {}

class CurrencySuccessState extends CurrencyState {
  final Map<DateTime, double> fetchCurrencyData;
  final String sourceCurrency;
  final String targetCurrency;

  CurrencySuccessState(
      {required this.sourceCurrency,
      required this.targetCurrency,
      required this.fetchCurrencyData});
}

class CurrencyFailureState extends CurrencyState {
  final String error;
  CurrencyFailureState({required this.error});
}
