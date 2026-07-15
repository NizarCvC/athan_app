import 'package:athan_app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightModeTheme =>
      ThemeData(primaryColor: AppColors.primaryColor, brightness: .light,);
  static ThemeData get darkModeTheme =>
      ThemeData(primaryColor: AppColors.primaryColor, brightness: .dark);
}
