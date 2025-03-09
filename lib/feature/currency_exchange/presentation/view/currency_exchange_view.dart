import 'package:currency_exchange/core/assets/colors.dart';
import 'package:currency_exchange/feature/currency_exchange/presentation/view/widget/currency_exchange_widgets/appbar_widget.dart';
import 'package:currency_exchange/feature/currency_exchange/presentation/view/widget/currency_exchange_widgets/currecny_exchange_body.dart';
import 'package:flutter/material.dart';

class CurrencyExchangeView extends StatelessWidget {
  const CurrencyExchangeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:AppColors.white ,
      appBar: AppbarWidget(),
      body: CurrecnyExchangeBody(),
    );
  }
}
