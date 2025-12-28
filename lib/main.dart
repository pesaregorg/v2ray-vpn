import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v2ray_vpn/main_app.dart';

void main() {
  runApp(const ProviderScope(
      child: MainApp()
  ));
}