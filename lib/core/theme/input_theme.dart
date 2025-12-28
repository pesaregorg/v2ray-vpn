import 'package:flutter/material.dart';
import 'package:v2ray_vpn/core/theme/custom_color.dart';

class InputTheme {
  InputTheme(this.isDarkMode);

  bool isDarkMode;

  InputDecorationTheme get outlineBorderTheme {
    return InputDecorationTheme(
      //isDense: true,
      filled: true,
      fillColor: isDarkMode
          ? const Color(0xFF1E1E1E).withAlpha(70)
          : Colors.white,
      hintStyle: TextStyle(
        color: isDarkMode
            ? Colors.white.withAlpha(100)
            : Colors.black.withAlpha(100),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(
          width: 1.0,
          color: isDarkMode ? const Color(0xFFB0B0B0) : const Color(0xFF4B5563),
        ), //<-- SEE HERE
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(
          width: 1.0,
          color: isDarkMode ? const Color(0xFFB0B0B0) : const Color(0xFF4B5563),
        ), //<-- SEE HERE
      ),
      prefixIconColor: isDarkMode
          ? Colors.white.withAlpha(50)
          : Colors.black.withAlpha(50),
      suffixIconColor: isDarkMode
          ? Colors.white.withAlpha(50)
          : Colors.black.withAlpha(50),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(
          width: 1.0,
          color: CustomColor.primary,
        ), //<-- SEE HERE
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(width: 1.0, color: Colors.red), //<-- SEE HERE
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(
          width: 1.0,
          color: Colors.red.shade800,
        ), //<-- SEE HERE
      ),
    );
  }
}
