import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v2ray_vpn/features/settings/presentation/providers/locale_provider.dart';

final appFontProvider = Provider((ref) {

  final localeAsync = ref.watch(localePCProvider);

  final localeCode = localeAsync.maybeWhen(
    data: (value) => value,
      orElse: () => "en"
  );

  if(localeCode == "en"){
    return "Poppins";
  }
  return "Yekan";
});