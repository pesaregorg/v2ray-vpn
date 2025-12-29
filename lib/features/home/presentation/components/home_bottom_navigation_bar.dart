import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v2ray_vpn/core/utils/helper.dart';
import 'package:v2ray_vpn/features/home/presentation/providers/v2ray_provider.dart';

class HomeBottomNavigationBar extends ConsumerWidget {
  const HomeBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final v2rayValue = ref.watch(v2rayPCProvider);

    return Container(
        height: 50,
        color: Theme.of(context).primaryColor.withAlpha(50),
      padding: .symmetric(horizontal: 8.0),
      child: Row(children: [
        Expanded(
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .start,
            children: [
            Text("Download Speed: ${formatBytes(v2rayValue.downloadSpeed)}", style: const TextStyle(
              fontSize: 10
            ),),
            Text("Download Volume: ${formatBytes(v2rayValue.download)}", style: const TextStyle(
                fontSize: 10
            ),),
          ],),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .end,
            children: [
            Text("Upload Speed: ${formatBytes(v2rayValue.uploadSpeed)}", style: const TextStyle(
                fontSize: 10
            ),),
            Text("Upload Volume: ${formatBytes(v2rayValue.upload)}", style: const TextStyle(
                fontSize: 10
            ),),
          ],),
        )
      ]),
    );
  }
}
