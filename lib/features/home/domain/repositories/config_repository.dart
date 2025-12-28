import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v2ray_vpn/core/error/exeptions.dart';
import 'package:v2ray_vpn/features/home/data/datasource/config_local_datasource.dart';
import 'package:v2ray_vpn/features/home/data/repositories/config_repository_impl.dart';
import 'package:v2ray_vpn/features/home/domain/entities/config_entity.dart';

abstract class ConfigRepository {
  Future<Either<AppException, ConfigEntity>> create(Map<String, dynamic> data);
  Future<Either<AppException, List<ConfigEntity>>> index();
  Future<Either<AppException, bool>> selected(ConfigEntity config);
  Future<Either<AppException, bool>> delete(ConfigEntity config);
}

final configRepositoryProvider = Provider<ConfigRepository>((ref){
  final configLocalDatasource = ref.watch(configLocalDatasourceProvider);
  return ConfigRepositoryImpl(configLocalDatasource);
});