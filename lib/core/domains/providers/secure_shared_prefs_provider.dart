import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v2ray_vpn/core/data/local/secure_shared_prefs_service.dart';

final secureSharedPrefsPCProvider = Provider((ref) {
  final SecureSharedPrefsService prefsService = SecureSharedPrefsService();
  prefsService.init();
  return prefsService;
});
