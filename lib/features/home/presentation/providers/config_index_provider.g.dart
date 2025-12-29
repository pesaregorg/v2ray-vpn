// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_index_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ConfigIndexPC)
const configIndexPCProvider = ConfigIndexPCProvider._();

final class ConfigIndexPCProvider
    extends $AsyncNotifierProvider<ConfigIndexPC, List<ConfigEntity>> {
  const ConfigIndexPCProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'configIndexPCProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$configIndexPCHash();

  @$internal
  @override
  ConfigIndexPC create() => ConfigIndexPC();
}

String _$configIndexPCHash() => r'94701cc976f17bdcb89f13a6f0063a0c8393cc2d';

abstract class _$ConfigIndexPC extends $AsyncNotifier<List<ConfigEntity>> {
  FutureOr<List<ConfigEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<ConfigEntity>>, List<ConfigEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<ConfigEntity>>, List<ConfigEntity>>,
              AsyncValue<List<ConfigEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
