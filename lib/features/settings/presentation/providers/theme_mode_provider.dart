import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:v2ray_vpn/core/domains/providers/secure_shared_prefs_provider.dart';

part 'theme_mode_provider.g.dart';

@riverpod
class ThemeModePC extends _$ThemeModePC {
  final String themeModeKey = "themeMode";

  @override
  Future<int> build() async {
    final securePrefs = ref.watch(secureSharedPrefsPCProvider);
    final value = await securePrefs.get(themeModeKey);
    return _parseThemeMode(value.toString());
  }

  Future<void> setThemeMode(int? index) async {
    final securePrefs = ref.read(secureSharedPrefsPCProvider);

    if (index != null) {
      await securePrefs.set(themeModeKey, index.toString());
      state = AsyncData(index);
    } else {
      await securePrefs.remove(themeModeKey);
      state = const AsyncData(0);
    }
  }



  int _parseThemeMode(String? value) {
    if (value == null) return 0;
    try{
      return int.parse(value);
    }catch(e){
      return 0;
    }
  }
}
