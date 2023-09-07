import 'package:code_union_task/core/component/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeGlobal {
  static final ThemeData _themeData = ThemeData(
    scaffoldBackgroundColor: StandartColors.approxSolitude,
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.manrope().copyWith(
        fontWeight: FontWeight.w600,
        color: StandartColors.black,
        fontSize: 24.0,
        wordSpacing: 40.0,
      ),
      titleMedium: GoogleFonts.manrope().copyWith(
        fontWeight: FontWeight.w500,
        color: StandartColors.black,
        fontSize: 15.0,
        wordSpacing: 20.0,
      ),
      bodyMedium: GoogleFonts.manrope().copyWith(
        fontWeight: FontWeight.w400,
        color: StandartColors.black,
        fontSize: 16.0,
        wordSpacing: 24.0,
      ),
      labelMedium: GoogleFonts.manrope().copyWith(
        fontWeight: FontWeight.w700,
        color: StandartColors.white,
        fontSize: 16.0,
        wordSpacing: 24.0,
      ),
      labelSmall: GoogleFonts.manrope().copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 10.0,
      ),
      bodySmall: GoogleFonts.manrope().copyWith(
        fontWeight: FontWeight.w400,
        color: StandartColors.amaranth,
        fontSize: 16.0,
      ),
    ),
  );

  static ThemeData get themeData => _themeData;
}
