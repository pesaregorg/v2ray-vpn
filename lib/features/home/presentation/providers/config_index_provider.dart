import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:v2ray_vpn/features/home/domain/entities/config_entity.dart';
import 'package:v2ray_vpn/features/home/domain/usecases/config_usecases.dart';

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
    var res = await _configUsecases.delete(config);

    res.fold(
            (left) => state = AsyncValue.error(left.message, StackTrace.fromString(left.message)),
            (right) => state = AsyncValue.data(state.asData!.value.where((element) => element.id != config.id).toList())
    );
  }

  Future<void> addAfterCreate(ConfigEntity config) async {

    state = AsyncValue.data([...state.asData!.value, config]);
  }

}