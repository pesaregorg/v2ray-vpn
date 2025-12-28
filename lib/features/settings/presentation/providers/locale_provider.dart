import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:v2ray_vpn/core/domains/providers/secure_shared_prefs_provider.dart';

part 'locale_provider.g.dart';

@riverpod
class LocalePC extends _$LocalePC {
  final String localeKey = "locale";

  @override
  Future<String> build() async {
    final securePrefs = ref.watch(secureSharedPrefsPCProvider);
    final value = await securePrefs.get(localeKey);
    return value?.toString() ?? "en";
  }

  Future<void> setLocale(String? locale) async {
    final securePrefs = ref.read(secureSharedPrefsPCProvider);

    if (locale != null && locale.isNotEmpty) {
      await securePrefs.set(localeKey, locale);
      state = AsyncData(locale);
    } else {
      await securePrefs.remove(localeKey);
      state = const AsyncData("en");
    }
  }
}
