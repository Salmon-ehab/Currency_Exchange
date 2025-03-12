class ExchangeRate {
  ExchangeRate(
      {required this.sourceCurr,
      required this.targetCurr,
      required this.date,
      required this.rates});

  final DateTime date;
  final String sourceCurr;
  final String targetCurr;
  final Map<String, double> rates;

  factory ExchangeRate.fromJson(
      String date, Map<String, dynamic> json, List<String> selectedCurrencies,String sourceCurr,String targetCurr) {
    return ExchangeRate(
      date: DateTime.parse(date),
      sourceCurr:sourceCurr ,
      targetCurr: targetCurr,
      rates: Map.from(json)
          .map((key, value) =>
              MapEntry<String, double>(key, (value as num).toDouble()))
          .entries
          .where((entry) => selectedCurrencies.contains(entry.key))
          .fold<Map<String, double>>({}, (map, entry) {
        map[entry.key] = entry.value;
        return map;
      }),
    );
  }
}
