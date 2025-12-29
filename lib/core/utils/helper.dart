import 'package:flutter/material.dart';

bool isDarkMode(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark;



String formatBytes(int? bytes) {
  if (bytes == null) return '-';
  const units = ['B', 'KB', 'MB', 'GB'];
  double b = bytes.toDouble();
  int i = 0;
  while (b >= 1024 && i < units.length - 1) {
    b /= 1024;
    i++;
  }
  return '${b.toStringAsFixed(b >= 10 ? 0 : 1)} ${units[i]}';
}

String formatDuration(int? seconds) {
  if (seconds == null) return '- s';
  return '$seconds s';
}