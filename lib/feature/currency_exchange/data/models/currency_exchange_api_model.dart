class CurrencyExchangeApiModel {
  CurrencyExchangeApiModel({
    required this.success,
    required this.terms,
    required this.privacy,
    required this.timeframe,
    required this.startDate,
    required this.endDate,
    required this.source,
    required this.rates, 
  });

  final bool? success;
  final String? terms;
  final String? privacy;
  final bool? timeframe;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? source;
  final Map<DateTime, Map<String, double>> rates; 

  factory CurrencyExchangeApiModel.fromJson(Map<String, dynamic> json) {

    return CurrencyExchangeApiModel(
      success: json["success"],
      terms: json["terms"],
      privacy: json["privacy"],
      timeframe: json["timeframe"],
      startDate: DateTime.tryParse(json["start_date"] ?? ""),
      endDate: DateTime.tryParse(json["end_date"] ?? ""),
      source: json["source"],
      rates: (json["quotes"] as Map<String, dynamic>).map(
        (date, values) => MapEntry(
          DateTime.parse(date), 
          (values as Map<String, dynamic>).map(
            (currency, value) => MapEntry(currency, (value as num).toDouble()),
          ),
        ),
      ),
    );
    
  }
}
