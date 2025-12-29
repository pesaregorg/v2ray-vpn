import 'package:flutter_vless/flutter_vless.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:v2ray_vpn/features/home/domain/entities/config_entity.dart';

part 'v2ray_provider.g.dart';

@riverpod
class V2rayPC extends _$V2rayPC {

  FlutterVless? _flutterVless;

  @override
  VlessStatus build(){
    _flutterVless ??= FlutterVless(
      onStatusChanged: (status) {
        state = status;
      },
    );

    _flutterVless!.initializeVless(
      providerBundleIdentifier: 'dev.tfox.example.flutterVless',
      groupIdentifier: 'group.dev.tfox.example.flutterVless',
    );
    return VlessStatus();
  }


  FlutterVless? get flutterVless => _flutterVless;



  Future<void> connect(ConfigEntity config) async {
    if(_flutterVless == null) return;

    if (!await _flutterVless!.requestPermission()) return;
    final FlutterVlessURL parsed = FlutterVless.parseFromURL(config.text);
    await _flutterVless!.startVless(
      remark: config.remark,
      config: parsed.getFullConfiguration(),
      //proxyOnly: false,
      //bypassSubnets: bypassSubnets,
      //blockedApps: blockedApps,
      //notificationDisconnectButtonName: 'DISCONNECT',
    );
  }






  Future<void> disconnect() async {
    await _flutterVless!.stopVless();
  }




}