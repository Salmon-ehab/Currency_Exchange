import 'package:currency_exchange/core/network/api_service.dart';
import 'package:currency_exchange/feature/currency_exchange/data/repo/currency_repo_implementation.dart';
import 'package:currency_exchange/feature/currency_exchange/presentation/manager/currency_cubit.dart';
import 'package:currency_exchange/feature/currency_exchange/presentation/view/currency_exchange_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(BlocProvider(
    create: (context)=> CurrencyCubit(CurrencyRepoImplementation(apiService: ApiService(dio: Dio()))),
    child: const CurrencyExchangeApp()));
}

class CurrencyExchangeApp extends StatelessWidget {
  const CurrencyExchangeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: CurrencyExchangeView(),
        );
      },
    );
  }
}
