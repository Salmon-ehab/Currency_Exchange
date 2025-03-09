import 'package:currency_exchange/core/assets/font_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppStyles {
  static TextStyle font14Bold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold700,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );
  static TextStyle font14SemiBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semiBold600,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );
  static TextStyle font12SemiBold = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.semiBold600,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );

  static TextStyle font10SemiBold = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeightHelper.semiBold600,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );
}
