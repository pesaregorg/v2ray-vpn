// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_add_from_clipboard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ConfigAddFromClipboardPC)
const configAddFromClipboardPCProvider = ConfigAddFromClipboardPCProvider._();

final class ConfigAddFromClipboardPCProvider
    extends
        $AsyncNotifierProvider<
          ConfigAddFromClipboardPC,
          ConfigAddFromClipboardState
        > {
  const ConfigAddFromClipboardPCProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'configAddFromClipboardPCProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$configAddFromClipboardPCHash();

  @$internal
  @override
  ConfigAddFromClipboardPC create() => ConfigAddFromClipboardPC();
}

String _$configAddFromClipboardPCHash() =>
    r'0b1d09718b3be1538bb3c977b7aaceaaba14d6ae';

abstract class _$ConfigAddFromClipboardPC
    extends $AsyncNotifier<ConfigAddFromClipboardState> {
  FutureOr<ConfigAddFromClipboardState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<ConfigAddFromClipboardState>,
              ConfigAddFromClipboardState
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<ConfigAddFromClipboardState>,
                ConfigAddFromClipboardState
              >,
              AsyncValue<ConfigAddFromClipboardState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
