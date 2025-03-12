import 'package:currency_exchange/core/errors/failure.dart';
import 'package:currency_exchange/core/network/api_service.dart';
import 'package:currency_exchange/feature/currency_exchange/data/models/currency_exchange_api_model.dart';
import 'package:currency_exchange/feature/currency_exchange/data/repo/currency_repo.dart';
import 'package:dartz/dartz.dart';

class CurrencyRepoImplementation implements CurrencyRepo {
  final ApiService apiService;
  CurrencyRepoImplementation({required this.apiService});

  @override
  Future<Either<Failure, Map<DateTime, double>>> featchCurrencyData({
    required String startDate,
    required String endDate,
    required String sourceCurr,
    required String targetCurr,
  }) async {
    try {
      final data = await apiService.getData(
        startDate: startDate,
        endDate: endDate,
        sourceCurr: sourceCurr,
      );
      final currencyExchangeApiModel = CurrencyExchangeApiModel.fromJson(data);
      String currencyKey = "$sourceCurr$targetCurr";
      Map<DateTime, double> filterRates = {};

      currencyExchangeApiModel.rates.forEach((data, rates) {
        if (rates.containsKey(currencyKey)) {
          filterRates[data] = rates[currencyKey]!;
        }
      });
      return right(filterRates);
    } catch (e) {
      return left(Failure(error: e.toString()));
    }
  }
}
