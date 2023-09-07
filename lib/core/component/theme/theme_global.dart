import 'package:code_union_task/core/component/utils/hex_color.dart';
import 'package:flutter/material.dart';

class ThemeGlobal {
  static final ThemeData _themeData = ThemeData(
    scaffoldBackgroundColor: HexColor.getHexColor('#F3F4F6'),
  );

  static ThemeData get themeData => _themeData;
}
