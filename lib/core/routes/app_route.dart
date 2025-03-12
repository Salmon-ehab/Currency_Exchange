import 'package:currency_exchange/feature/currency_exchange/presentation/view/currency_exchange_view.dart';
import 'package:currency_exchange/feature/security_check/presentation/views/security_check_view.dart';
import 'package:currency_exchange/feature/security_warning/presentation/views/security_warning_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoute {
  static String securityCheckView = '/';
  static String securityWarningView = '/SecurityWarningView';
  static String currecnyExchangeView = '/CurrencyExchangeView';

  static final GoRouter router = GoRouter(routes: <RouteBase>[
    GoRoute(
        path: securityCheckView,
        builder: (BuildContext context, _) {
          return const SecurityCheckView();
        }),
    GoRoute(
        path: currecnyExchangeView,
        builder: (BuildContext context, _) {
          return const CurrencyExchangeView();
        }),
    GoRoute(
        path: securityWarningView,
        builder: (BuildContext context, _) {
          return const SecurityWarningView();
        }),
  ]);
}
