import 'package:code_union_task/core/component/theme/colors.dart';
import 'package:code_union_task/core/config/shared.dart';
import 'package:flutter/material.dart';

class ThemeGlobal {
  static final ThemeData _themeData = ThemeData(
    scaffoldBackgroundColor: StandartColors.approxSolitude,
    textTheme: TextTheme(
      headlineLarge: manrope.copyWith(
        fontWeight: FontWeight.w600,
        color: StandartColors.black,
        fontSize: 24.0,
        height: 1.6,
      ),
      titleMedium: manrope.copyWith(
        fontWeight: FontWeight.w500,
        color: StandartColors.black,
        fontSize: 15.0,
        height: 1.3,
      ),
      bodyMedium: manrope.copyWith(
        fontWeight: FontWeight.w400,
        color: StandartColors.black,
        fontSize: 16.0,
        height: 1.5,
      ),
      labelMedium: manrope.copyWith(
        fontWeight: FontWeight.w700,
        color: StandartColors.white,
        fontSize: 16.0,
        height: 1.5,
      ),
      labelSmall: manrope.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 10.0,
        height: 1.4,
      ),
      bodySmall: manrope.copyWith(
        fontWeight: FontWeight.w400,
        color: StandartColors.amaranth,
        fontSize: 16.0,
      ),
    ),
  );

  static ThemeData get themeData => _themeData;
}
