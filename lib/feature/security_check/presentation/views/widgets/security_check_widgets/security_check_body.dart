import 'package:currency_exchange/core/assets/colors.dart';
import 'package:currency_exchange/core/assets/images.dart';
import 'package:currency_exchange/core/assets/styles.dart';
import 'package:currency_exchange/core/routes/app_route.dart';
import 'package:currency_exchange/core/utils/device_security.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SecurityCheckBody extends StatefulWidget {
  const SecurityCheckBody({super.key});

  @override
  State<SecurityCheckBody> createState() => _SecurityCheckBodyState();
}

class _SecurityCheckBodyState extends State<SecurityCheckBody> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    checkSecurity();
  }

  Future<void> checkSecurity() async {
    bool isSecure = await DeviceSecurity.isSafeDevice();
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      isLoading = false;
    });
    if (isSecure) {
      context.push(AppRoute.currecnyExchangeView);
    } else {
      context.push(AppRoute.securityWarningView);
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(Images.checkLottie),
                SizedBox(height: 20.h),
                Text(
                  " ...جارِ التحقق من أمان جهازك",
                  style: AppStyles.font14Bold.copyWith(fontSize: 25.sp),
                ),
                SizedBox(height: 20.h),
                const CircularProgressIndicator(color: AppColors.blue),
              ],
            ),
          )
        : const SizedBox();
  }
}
