class ExchangeRateProvider {
  final List<Map<String, dynamic>> exchangeRates;
  final int rowsPerPage;

  ExchangeRateProvider({required this.exchangeRates, this.rowsPerPage = 5});

  int get totalRows => exchangeRates.length;
  int get totalPages => (totalRows / rowsPerPage).ceil();

  List<Map<String, dynamic>> getDisplayedData(int currentPage) {
    int startIndex = currentPage * rowsPerPage;
    int endIndex = startIndex + rowsPerPage;
    if (endIndex > totalRows) endIndex = totalRows;
    return exchangeRates.sublist(startIndex, endIndex);
  }
}
