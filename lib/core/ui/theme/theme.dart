import 'package:flutter/material.dart';
import 'package:flutter_widget_catalog/core/ui/theme/color_palette.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: ColorPalette.primary,
    scaffoldBackgroundColor: ColorPalette.backgroundLight,
    colorScheme: ColorScheme.light(
      primary: ColorPalette.primary,
      primaryContainer: ColorPalette.primaryVariant,
      secondary: ColorPalette.secondary,
      secondaryContainer: ColorPalette.secondaryVariant,
      surface: ColorPalette.surfaceLight,
      error: ColorPalette.error,
      onPrimary: ColorPalette.onPrimary,
      onSecondary: ColorPalette.onSecondary,
      onSurface: ColorPalette.onSurfaceDark,
      onError: ColorPalette.white,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: ColorPalette.primary,
      foregroundColor: ColorPalette.onPrimary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorPalette.primary,
        foregroundColor: ColorPalette.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: ColorPalette.primary,
    scaffoldBackgroundColor: ColorPalette.backgroundDark,
    colorScheme: ColorScheme.dark(
      primary: ColorPalette.primary,
      primaryContainer: ColorPalette.primaryVariant,
      secondary: ColorPalette.secondary,
      secondaryContainer: ColorPalette.secondaryVariant,
      surface: ColorPalette.surfaceDark,
      error: ColorPalette.error,
      onPrimary: ColorPalette.onPrimary,
      onSecondary: ColorPalette.onSecondary,
      onSurface: ColorPalette.onSurfaceLight,
      onError: ColorPalette.white,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: ColorPalette.surfaceDark,
      foregroundColor: ColorPalette.onSurfaceLight,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorPalette.primary,
        foregroundColor: ColorPalette.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
      ),
    ),
  );
}
