import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v2ray_vpn/core/error/exeptions.dart';
import 'package:v2ray_vpn/features/home/domain/entities/config_entity.dart';
import 'package:v2ray_vpn/features/home/domain/repositories/config_repository.dart';

class ConfigUsecases {
  final ConfigRepository  repository;
  ConfigUsecases(this.repository);

  Future<Either<AppException, ConfigEntity>> create(Map<String, dynamic> data) => repository.create(data);
  Future<Either<AppException, List<ConfigEntity>>> index() => repository.index();
  Future<Either<AppException, bool>> selected(ConfigEntity config) => repository.selected(config);
  Future<Either<AppException, bool>> delete(ConfigEntity config) => repository.delete(config);


}


final configUsecasesProvider = FutureProvider<ConfigUsecases>((ref) async{
  final configRepository = ref.watch(configRepositoryProvider);
  return ConfigUsecases(configRepository);
});