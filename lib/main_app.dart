import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v2ray_vpn/core/routes/go_app_router.dart';
import 'package:v2ray_vpn/core/theme/custom_theme.dart';
import 'package:v2ray_vpn/features/settings/presentation/providers/locale_provider.dart';
import 'package:v2ray_vpn/features/settings/presentation/providers/theme_mode_provider.dart';
import 'package:v2ray_vpn/l10n/app_localizations.dart';

import 'core/domains/providers/app_font_provider.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final fontFamily = ref.watch(appFontProvider);

    // load locale
    final localeCode = ref
        .watch(localePCProvider)
        .maybeWhen(data: (data) => data, orElse: () => "en");

    //load theme mode
    final themeModeIndex = ref
        .watch(themeModePCProvider)
        .maybeWhen(data: (data) => data, orElse: () => 0);

    // load locale
    final locale = AppLocalizations.supportedLocales.firstWhere(
          (l) => l.languageCode == localeCode,
      orElse: () => const Locale('en'),
    );

    final mode =
    ThemeMode.values[themeModeIndex.clamp(0, ThemeMode.values.length - 1)];

    // load router
    final router = ref.watch(goRouterProvider);


    return MaterialApp.router(
      title: "V2Ray VPN",
      debugShowCheckedModeBanner: false,
      themeMode: mode,
      theme: CustomTheme().light(fontFamily: fontFamily),
      darkTheme: CustomTheme().dark(fontFamily: fontFamily),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appName,
      routerConfig: router,
    );
  }
}
