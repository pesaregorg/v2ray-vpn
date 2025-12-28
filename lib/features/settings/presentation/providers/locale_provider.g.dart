// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locale_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LocalePC)
const localePCProvider = LocalePCProvider._();

final class LocalePCProvider extends $AsyncNotifierProvider<LocalePC, String> {
  const LocalePCProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localePCProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localePCHash();

  @$internal
  @override
  LocalePC create() => LocalePC();
}

String _$localePCHash() => r'16f95937310ec42e822a42d04b5423c9b87f9433';

abstract class _$LocalePC extends $AsyncNotifier<String> {
  FutureOr<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<String>, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String>, String>,
              AsyncValue<String>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
