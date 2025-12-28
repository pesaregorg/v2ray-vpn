import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v2ray_vpn/features/home/presentation/providers/config_add_from_clipboard_provider.dart';
import 'package:v2ray_vpn/l10n/app_localizations.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final configAddFromClipboardNotifier = ref.read(configAddFromClipboardPCProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appName),
        actions: [
          IconButton(
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => Dialog(
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
              ),
            ),
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {

            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: Center(
        child: Text(
          'Welcome to the Home Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),

    );
  }
}
