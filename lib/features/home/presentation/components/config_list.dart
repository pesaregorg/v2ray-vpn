import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v2ray_vpn/core/widgets/loading_indicator.dart';
import 'package:v2ray_vpn/features/home/presentation/providers/config_index_provider.dart';
import 'package:v2ray_vpn/features/home/presentation/providers/v2ray_provider.dart';

class ConfigList extends ConsumerWidget {
  const ConfigList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final configIndexValue = ref.watch(configIndexPCProvider);
    final configIndexNotifier = ref.read(configIndexPCProvider.notifier);
    final v2rayValue = ref.watch(v2rayPCProvider);

    bool isConnected = v2rayValue.state == "CONNECTED";
    final configs = configIndexValue.value ?? [];

    if(configIndexValue.isLoading){
      return const Center(child: LoadingIndicator());
    }

    if(configs.isEmpty){
      return const Center(child: Text('No Configs Found'));
    }
    return ListView.separated(
      itemCount: configs.length,
      itemBuilder: (context, index) {
        final config = configs[index];
        return ListTile(
          onTap: () => configIndexNotifier.selectConfig(config),
          shape: Border(
            left: BorderSide(
              color: config.selected ?
              (isConnected ? Theme.of(context).colorScheme.primary : Colors.grey) : Colors.transparent,
              width: 8,
            ),
          ),
          title: Text(config.remark),
          subtitle: Row(
            children: [
              Expanded(child: Text(config.address)),
              const SizedBox(width: 8),
              if(config.ping != null)
                Text(config.ping.toString(), style: TextStyle(
                  color: config.ping! > 0 ? Colors.green : Colors.red
                ),),
            ],
          ),
          trailing: GestureDetector(
            onTap: () => configIndexNotifier.deleteConfig(config),
              child: const Icon(Icons.delete)
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
