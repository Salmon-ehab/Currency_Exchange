import 'package:currency_exchange/feature/currency_exchange/data/data_list/exchange_data.dart';

class ExchangeRateProvider {
  final int rowsPerPage;

  ExchangeRateProvider({this.rowsPerPage = 5});
  int get totalRows => exchangeRates.length;
  int get totalPages => (totalRows / rowsPerPage).ceil();

  List<Map<String, dynamic>> getDisplayedData(int currentPage) {
    int startIndex = currentPage * rowsPerPage;
    int endIndex = startIndex + rowsPerPage;
    if (endIndex > totalRows) endIndex = totalRows;
    return exchangeRates.sublist(startIndex, endIndex);
  }
}
