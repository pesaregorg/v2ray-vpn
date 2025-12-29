import 'package:flutter/material.dart';
import 'package:v2ray_vpn/features/home/presentation/components/all_ping_button.dart';
import 'package:v2ray_vpn/features/home/presentation/components/config_add_from_clipboard_dialog.dart';
import 'package:v2ray_vpn/features/home/presentation/components/config_list.dart';
import 'package:v2ray_vpn/features/home/presentation/components/home_bottom_navigation_bar.dart';
import 'package:v2ray_vpn/features/home/presentation/components/home_floating_action_button.dart';
import 'package:v2ray_vpn/l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.appName),
          actions: [

            const AllPingButton(),

            IconButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => const ConfigAddFromClipboardDialog(),
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
        floatingActionButton: const HomeFloatingActionButton(),
        bottomNavigationBar: const HomeBottomNavigationBar(),
        body: const ConfigList(),

      ),
    );
  }
}
