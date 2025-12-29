import 'package:flutter_vless/flutter_vless.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:v2ray_vpn/features/home/domain/entities/config_entity.dart';
import 'package:v2ray_vpn/features/home/domain/usecases/config_usecases.dart';
import 'package:v2ray_vpn/features/home/presentation/providers/v2ray_provider.dart';

part 'config_index_provider.g.dart';

@riverpod
class ConfigIndexPC extends _$ConfigIndexPC {

  late ConfigUsecases _configUsecases;
  @override
  Future<List<ConfigEntity>> build() async{
    state =  AsyncValue.loading();
    _configUsecases = await ref.read(configUsecasesProvider.future);

    await _loadConfigs();
    return state.asData?.value ?? [];
  }


  ConfigEntity? get selectedConfig =>
      state.asData?.value.firstWhere((element) => element.selected) ?? state.asData?.value.firstOrNull;



  Future<void> refresh() async{
    state = AsyncValue.loading();
    await _loadConfigs();
  }


  Future<void> _loadConfigs() async{
    var res = await _configUsecases.index();

    res.fold(
            (left) => state = AsyncValue.error(left.message, StackTrace.fromString(left.message)),
            (right) => state = AsyncValue.data(right)
    );
  }


  Future<void> deleteConfig(ConfigEntity config) async{

    if(!config.selected){
      var res = await _configUsecases.delete(config);

      res.fold(
              (left) => state = AsyncValue.error(left.message, StackTrace.fromString(left.message)),
              (right) => state = AsyncValue.data(state.asData!.value.where((element) => element.id != config.id).toList())
      );
    }

  }


  Future<void> selectConfig(ConfigEntity config) async {
    final res = await _configUsecases.selected(config);

    res.fold(
          (left) {
        state = AsyncValue.error(
          left.message,
          StackTrace.fromString(left.message),
        );
      },
          (right) {
        final current = state.asData?.value;
        if (current == null) return;

        final updatedState = current.map((element) {
          return element.copyWith(
            selected: element.id == config.id,
          );
        }).toList();

        state = AsyncValue.data(updatedState);
      },
    );
  }



  Future<void> addAfterCreate(ConfigEntity config) async {

    state = AsyncValue.data([...state.asData!.value, config]);
  }




  Future<int?> getSinglePing(ConfigEntity config) async {
    final v2ray = ref.read(v2rayPCProvider.notifier);
    final FlutterVlessURL parsed = FlutterVless.parseFromURL(config.text);
    int? delay =  await v2ray.flutterVless?.getServerDelay(config: parsed.getFullConfiguration());
    config = config.copyWith(ping: delay);
    return delay;
  }


  Future<void> getAllPing() async {
    final current = state.asData?.value;
    if (current == null || current.isEmpty) return;

    final v2ray = ref.read(v2rayPCProvider.notifier);

    final futures = current.map((config) async {
      final FlutterVlessURL parsed = FlutterVless.parseFromURL(config.text);
      final delay = await v2ray.flutterVless?.
      getServerDelay(config: parsed.getFullConfiguration());

      return config.copyWith(ping: delay);
    }).toList();

    final updatedConfigs = await Future.wait(futures);

    updatedConfigs.sort((a, b) {
      final ap = a.ping;
      final bp = b.ping;
      if ((ap == null || ap < 0) && (bp == null || bp < 0)) {
        return 0;
      }
      if (ap == null || ap < 0) return 1;
      if (bp == null || bp < 0) return -1;
      return ap.compareTo(bp);
    });

    state = AsyncValue.data(updatedConfigs);
  }

}