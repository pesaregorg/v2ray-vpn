// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v2ray_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(V2rayPC)
const v2rayPCProvider = V2rayPCProvider._();

final class V2rayPCProvider extends $NotifierProvider<V2rayPC, VlessStatus> {
  const V2rayPCProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'v2rayPCProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$v2rayPCHash();

  @$internal
  @override
  V2rayPC create() => V2rayPC();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VlessStatus value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VlessStatus>(value),
    );
  }
}

String _$v2rayPCHash() => r'4a3f415cd492501c69b6b73ee9f029d549f102ce';

abstract class _$V2rayPC extends $Notifier<VlessStatus> {
  VlessStatus build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<VlessStatus, VlessStatus>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<VlessStatus, VlessStatus>,
              VlessStatus,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
