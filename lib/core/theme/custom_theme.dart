import 'package:flutter/material.dart';
import 'package:v2ray_vpn/core/theme/custom_color.dart';
import 'package:v2ray_vpn/core/theme/input_theme.dart';

class CustomTheme {
  ThemeData light({required String fontFamily}) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: CustomColor.primary,
        secondary: CustomColor.secondary,
        brightness: Brightness.light,
      ),
      brightness: Brightness.light,
      fontFamily: fontFamily,
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFF9FAFB)),
      scaffoldBackgroundColor: const Color(0xFFF9FAFB),
      tabBarTheme: const TabBarThemeData(
        labelColor: CustomColor.secondary,
        unselectedLabelColor: Colors.white70,
        indicatorColor: CustomColor.secondary,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        shape: CircleBorder(),
        backgroundColor: CustomColor.primary,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          elevation: 0.0,
          side: const BorderSide(width: 1.0, color: Color(0xff4B5563)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: CustomColor.primary,
          elevation: 0.0,
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: fontFamily,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      inputDecorationTheme: InputTheme(false).outlineBorderTheme,
    );
  }

  ThemeData dark({required String fontFamily}) {
    return ThemeData(
      primaryColor: CustomColor.primary,
      colorScheme: ColorScheme.fromSeed(
        seedColor: CustomColor.primary,
        secondary: CustomColor.secondary,
        brightness: Brightness.dark,
      ),
      brightness: Brightness.dark,
      fontFamily: fontFamily,
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF1E1E1E)),
      scaffoldBackgroundColor: const Color(0xFF1E1E1E),
      tabBarTheme: const TabBarThemeData(
        labelColor: CustomColor.secondary,
        unselectedLabelColor: Colors.white70,
        indicatorColor: CustomColor.secondary,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        shape: CircleBorder(),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white.withAlpha(200),
          elevation: 0.0,
          backgroundColor: const Color(0xff41414A),
          side: const BorderSide(width: 1.0, color: Color(0xFFE0E0E0)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          elevation: 0.0,
          backgroundColor: CustomColor.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      inputDecorationTheme: InputTheme(true).outlineBorderTheme,
      expansionTileTheme: const ExpansionTileThemeData(
        backgroundColor: Colors.transparent,
        collapsedBackgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      listTileTheme: const ListTileThemeData(
        dense: true,
        tileColor: Colors.transparent,
        minTileHeight: 40.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }
}
