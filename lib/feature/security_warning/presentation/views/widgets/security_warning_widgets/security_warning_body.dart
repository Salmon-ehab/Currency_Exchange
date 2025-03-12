import 'package:currency_exchange/core/assets/images.dart';
import 'package:currency_exchange/core/assets/styles.dart';
import 'package:currency_exchange/core/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SecurityWarningBody extends StatelessWidget {
  const SecurityWarningBody({super.key});
// صفحة لعرض تحذير في حالة عدم أمان الجهاز
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(Images.warningLottie),
            SizedBox(height: 20.h),
            Text(
              "⚠️! جهازك غير آمن",
              style: AppStyles.font14Bold.copyWith(fontSize: 25.sp),
            ),
            SizedBox(height: 20.h),
            Text(
              ".تم اكتشاف أن جهازك قد يكون مسروقا أو غير آمن. لأمان معلوماتك، لا يمكنك استخدام التطبيق",
              textAlign: TextAlign.center,
              style: AppStyles.font14Bold.copyWith(fontSize: 23.sp),
            ),
            SizedBox(height: 30.h),
            ElevatedButton(
              onPressed: () => context.push(AppRoute.securityCheckView),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              child: Text(
                "إعادة الفحص",
                style: AppStyles.font14Bold.copyWith(fontSize: 25.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
