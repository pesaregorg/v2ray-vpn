import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v2ray_vpn/features/home/presentation/providers/config_index_provider.dart';
import 'package:v2ray_vpn/l10n/app_localizations.dart';

class AllPingButton extends ConsumerWidget {
  const AllPingButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final configIndexNotifier = ref.read(configIndexPCProvider.notifier);

    return IconButton(
      onPressed: configIndexNotifier.getAllPing,
      tooltip: AppLocalizations.of(context)!.checkPing,
      icon: const Icon(Icons.refresh),
    );
  }
}
