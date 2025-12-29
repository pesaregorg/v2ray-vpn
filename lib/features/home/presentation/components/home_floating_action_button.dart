import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v2ray_vpn/features/home/presentation/providers/config_index_provider.dart';
import 'package:v2ray_vpn/features/home/presentation/providers/v2ray_provider.dart';
import 'package:v2ray_vpn/l10n/app_localizations.dart';

class HomeFloatingActionButton extends ConsumerWidget {
  const HomeFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final v2rayValue = ref.watch(v2rayPCProvider);
    final configIndexValue = ref.watch(configIndexPCProvider);
    final v2rayNotifier = ref.read(v2rayPCProvider.notifier);

    bool isConnected = v2rayValue.state == "CONNECTED";

    final selectedConfig = configIndexValue.asData?.value.
    firstWhere((element) => element.selected) ??
        configIndexValue.asData?.value.firstOrNull;

    return FloatingActionButton(
      onPressed: () {
        if(isConnected) {
          v2rayNotifier.disconnect();
        } else {
          if(selectedConfig == null) return;
          v2rayNotifier.connect(selectedConfig);
        }
      },
      tooltip: isConnected ? AppLocalizations.of(context)!.connected : AppLocalizations.of(context)!.connect,
      child:  Icon(isConnected ? Icons.stop : Icons.play_arrow),
    );
  }
}
