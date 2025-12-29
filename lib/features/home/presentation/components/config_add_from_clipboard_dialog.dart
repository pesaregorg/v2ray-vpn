import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toastification/toastification.dart';
import 'package:v2ray_vpn/features/home/presentation/providers/config_add_from_clipboard_provider.dart';
import 'package:v2ray_vpn/l10n/app_localizations.dart';

class ConfigAddFromClipboardDialog extends ConsumerWidget {
  const ConfigAddFromClipboardDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final configAddFromClipboardNotifier = ref.read(configAddFromClipboardPCProvider.notifier);
/*
    final configAddFromClipboardValue = ref.watch(configAddFromClipboardPCProvider);
*/

    ref.listen(configAddFromClipboardPCProvider, (prev, next) {
      final prevData = prev?.value;
      final nextData = next.value;
      if (nextData == null) return;

      if (nextData.errorMessage != null &&
          nextData.errorMessage != prevData?.errorMessage) {
        toastification.show(
          context: context,
          type: ToastificationType.error,
          description: Text(nextData.errorMessage!),
          autoCloseDuration: const Duration(seconds: 5),
        );
      }

      if (nextData.isSuccess && prevData?.isSuccess != true) {
        toastification.show(
          context: context,
          type: ToastificationType.success,
          description: Text("${nextData.config?.remark} added."),
          autoCloseDuration: const Duration(seconds: 5),
        );
        Navigator.pop(context);
      }
    });

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(AppLocalizations.of(context)!.addConfig),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: configAddFromClipboardNotifier.addConfigFromClipboard,
              child: Text(AppLocalizations.of(context)!.addFromClipboard),
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(AppLocalizations.of(context)!.close),
            ),
          ],
        ),
      ),
    );
  }
}
