import 'package:flutter/material.dart';
import 'package:movies_app/core/constents/app_colors.dart';

class Style {
  static ThemeData themeData(
      {required bool isDartktheme, required BuildContext context}) {
    return ThemeData(
      scaffoldBackgroundColor:
          isDartktheme ? Colors.black : AppColors.lightScaffoldColor,
      primaryColor:
          isDartktheme ? AppColors.darkPrimary : AppColors.lightPrimary,
      cardColor: isDartktheme ? const Color(0xff212121) : Colors.white,
      brightness: isDartktheme ? Brightness.dark : Brightness.light,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: isDartktheme ? Colors.grey[900] : Colors.grey[900],
        ),
        backgroundColor: isDartktheme
            ? AppColors.darkScaffoldColor
            : AppColors.lightScaffoldColor,
        titleTextStyle: TextStyle(
          color: isDartktheme ? Colors.white : Colors.black,
        ),
        elevation: 0,
        centerTitle: false,
      ),
    );
  }
}
