import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:v2ray_vpn/core/logging/logger_provider.dart';
import 'package:v2ray_vpn/core/routes/my_route_observer.dart';
import 'package:v2ray_vpn/core/routes/route_name.dart';
import 'package:v2ray_vpn/core/widgets/error_page.dart';
import 'package:v2ray_vpn/features/home/presentation/pages/home_page.dart';
import 'package:v2ray_vpn/features/settings/presentation/pages/settings_page.dart';
import 'package:v2ray_vpn/features/splash/presentation/pages/splash_page.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

Map<String, String>? authPathParameters;

final goRouterProvider = Provider<GoRouter>((ref) {
  final logger = ref.watch(loggerProvider);

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    observers: [MyRouteObserver(logger)],
    routes: [
      GoRoute(
        path: '/splash',
        name: RouteName.splash,
        pageBuilder: (context, state) =>
        const MaterialPage(child: SplashPage()),
      ),

      GoRoute(
        path: '/',
        name: RouteName.home,
        pageBuilder: (context, state) => const MaterialPage(child: HomePage()),
        routes: [
          GoRoute(
            path: 'settings',
            name: RouteName.settings,
            pageBuilder: (context, state) => const MaterialPage(child: SettingsPage()),
          ),
        ]
      ),
    ],

    errorPageBuilder: (context, state) => const MaterialPage(child: ErrorPage()),
  );
});
