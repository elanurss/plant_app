import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_dimensions.dart';
import 'app_text_styles.dart';

abstract final class AppTheme {
  static ThemeData get light => _build(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      surface: AppColors.surface,
      onSurface: AppColors.textPrimary,
    ),
    scaffoldBackground: AppColors.background,
    textColor: AppColors.textPrimary,
  );

  static ThemeData get dark => _build(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      surface: AppColors.darkSurface,
      onSurface: AppColors.darkTextPrimary,
    ),
    scaffoldBackground: AppColors.darkBackground,
    textColor: AppColors.darkTextPrimary,
  );

  static ThemeData _build({
    required Brightness brightness,
    required ColorScheme colorScheme,
    required Color scaffoldBackground,
    required Color textColor,
  }) {
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffoldBackground,
      fontFamily: AppTextStyles.fontFamily,
      textTheme: AppTextStyles.textTheme.apply(
        bodyColor: textColor,
        displayColor: textColor,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          minimumSize: const Size.fromHeight(AppSizes.buttonHeight),
          textStyle: AppTextStyles.buttonLabel,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppRadius.md)),
          ),
        ),
      ),
    );
  }
}
