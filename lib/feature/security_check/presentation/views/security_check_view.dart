import 'package:currency_exchange/core/assets/colors.dart';
import 'package:currency_exchange/feature/security_check/presentation/views/widgets/security_check_widgets/security_check_body.dart';
import 'package:flutter/material.dart';

class SecurityCheckView extends StatelessWidget {
  const SecurityCheckView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: SecurityCheckBody(),
    );
  }
}
