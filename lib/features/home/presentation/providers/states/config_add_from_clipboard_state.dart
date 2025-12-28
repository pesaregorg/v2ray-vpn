import 'package:v2ray_vpn/features/home/domain/entities/config_entity.dart';

class ConfigAddFromClipboardState{
  final ConfigEntity? config;
  final String? errorMessage;
  final bool isLoading;
  final bool isSuccess;
  const ConfigAddFromClipboardState({
    this.config,
    this.errorMessage,
    this.isLoading = false,
    this.isSuccess = false,
  });

  factory ConfigAddFromClipboardState.initial() =>
      const ConfigAddFromClipboardState(
        isLoading: false,
        errorMessage: null,
        isSuccess: false,
        config: null,
      );

  ConfigAddFromClipboardState copyWith({
    ConfigEntity? config,
    String? errorMessage,
    bool? isLoading,
    bool? isSuccess,
  }) => ConfigAddFromClipboardState(
    config: config ?? this.config,
    errorMessage: errorMessage ?? this.errorMessage,
    isLoading: isLoading ?? this.isLoading,
    isSuccess: isSuccess ?? this.isSuccess,
  );


}


