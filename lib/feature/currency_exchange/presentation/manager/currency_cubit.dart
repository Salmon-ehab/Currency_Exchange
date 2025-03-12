import 'package:bloc/bloc.dart';
import 'package:currency_exchange/core/errors/failure.dart';
import 'package:currency_exchange/feature/currency_exchange/data/repo/currency_repo_implementation.dart';
import 'package:currency_exchange/feature/currency_exchange/presentation/manager/currency_state.dart';
import 'package:dartz/dartz.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  CurrencyCubit(this.currencyRepoImplementation)
      : super(CurrencyInitialState());

  final CurrencyRepoImplementation currencyRepoImplementation;

  Future<void> fetchCurrencyData({
    required String startDate,
    required String endDate,
    required String sourceCurr,
    required String targetCurr,
  }) async {
    emit(CurrencyLoadingState());

    try {
      Either<Failure, Map<DateTime, double>> result =
          await currencyRepoImplementation.featchCurrencyData(
              startDate: startDate,
              endDate: endDate,
              sourceCurr: sourceCurr,
              targetCurr: targetCurr);

      result.fold(
        (failure) => emit(CurrencyFailureState(error: failure.error)),
        (data) {
          if (data.isEmpty) {
            emit(CurrencyFailureState(error: "Select to show Data"));
          } else {
            emit(CurrencySuccessState(
                fetchCurrencyData: data,
                sourceCurrency: sourceCurr,
                targetCurrency: targetCurr));
          }
        },
      );
    } catch (e) {
      emit(CurrencyFailureState(error: "Unexpected error: ${e.toString()}"));
    }
  }
}
