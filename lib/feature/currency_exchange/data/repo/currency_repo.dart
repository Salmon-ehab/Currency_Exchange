import 'package:currency_exchange/core/errors/failure.dart';
import 'package:dartz/dartz.dart';


abstract class CurrencyRepo {
  Future<Either<Failure,   Map<DateTime,double>>> featchCurrencyData({
    required  String startDate,
    required String  endDate,
    required String sourceCurr,
    required String targetCurr,
  });
}
