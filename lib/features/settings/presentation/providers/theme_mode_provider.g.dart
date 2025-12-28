// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_mode_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ThemeModePC)
const themeModePCProvider = ThemeModePCProvider._();

final class ThemeModePCProvider
    extends $AsyncNotifierProvider<ThemeModePC, int> {
  const ThemeModePCProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeModePCProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeModePCHash();

  @$internal
  @override
  ThemeModePC create() => ThemeModePC();
}

String _$themeModePCHash() => r'eccac55664d4a4364e6388a6135eeed67bb80721';

abstract class _$ThemeModePC extends $AsyncNotifier<int> {
  FutureOr<int> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<int>, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<int>, int>,
              AsyncValue<int>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
