import 'package:currency_exchange/core/assets/colors.dart';
import 'package:currency_exchange/feature/security_warning/presentation/views/widgets/security_warning_widgets/security_warning_body.dart';
import 'package:flutter/material.dart';

class SecurityWarningView extends StatelessWidget {
  const SecurityWarningView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: SecurityWarningBody(),
    );
  }
}
