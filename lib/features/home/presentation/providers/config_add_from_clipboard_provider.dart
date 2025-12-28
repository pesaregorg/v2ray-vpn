import 'package:flutter/services.dart';
import 'package:flutter_vless/flutter_vless.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:v2ray_vpn/core/logging/logger.dart';
import 'package:v2ray_vpn/core/logging/logger_provider.dart';
import 'package:v2ray_vpn/features/home/domain/usecases/config_usecases.dart';
import 'package:v2ray_vpn/features/home/presentation/providers/states/config_add_from_clipboard_state.dart';

part 'config_add_from_clipboard_provider.g.dart';

@riverpod
class ConfigAddFromClipboardPC extends _$ConfigAddFromClipboardPC {

  late ConfigUsecases _configUsecases;
  late Logger _logger;
  @override
  Future<ConfigAddFromClipboardState> build() async{
    _logger = ref.read(loggerProvider);
    _configUsecases = await ref.read(configUsecasesProvider.future);
    return ConfigAddFromClipboardState.initial();
  }


  Future<void> addConfigFromClipboard() async{
    if (!state.hasValue) return;
    state = AsyncData(state.value!.copyWith(
        isLoading: true
    ));
    try{

      final text = (await Clipboard.getData('text/plain'))?.text?.trim() ?? '';
      final FlutterVlessURL parsed = FlutterVless.parseFromURL(text);
      Map<String, dynamic> data = {
        "url": parsed.url,
        "text": text,
        "address": parsed.address,
        "selected": 0,
        "remark": parsed.remark
      };

      var res = await _configUsecases.create(data);

      res.fold(
              (left) => state = AsyncData(state.value!.copyWith(
              isLoading: false,
              config: null,
              isSuccess: false,
              errorMessage: left.message
          )),
              (right) => state = AsyncData(state.value!.copyWith(
              isLoading: false,
              config: right
          ))
      );
    }catch(e){
      _logger.e("ConfigAddFromClipboardPC.addConfigFromClipboard: $e");
      state = AsyncData(state.value!.copyWith(
          isLoading: false,
          config: null,
          isSuccess: false,
          errorMessage: "Unknown Error."
      ));
    }

  }



}