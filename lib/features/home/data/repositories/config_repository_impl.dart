import 'package:dartz/dartz.dart';
import 'package:v2ray_vpn/core/error/exeptions.dart';
import 'package:v2ray_vpn/features/home/data/datasource/config_local_datasource.dart';
import 'package:v2ray_vpn/features/home/domain/entities/config_entity.dart';
import 'package:v2ray_vpn/features/home/domain/repositories/config_repository.dart';


class ConfigRepositoryImpl extends ConfigRepository{

  final ConfigLocalDatasource _configLocalDatasource;

  ConfigRepositoryImpl(this._configLocalDatasource);

  @override
  Future<Either<AppException, ConfigEntity>> create(Map<String, dynamic> data) async{

    var result =  await _configLocalDatasource.create(data);

    return result.fold((l) => Left(l), (r) => Right(r.toEntity()));
  }

  @override
  Future<Either<AppException, bool>> delete(ConfigEntity config) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<AppException, List<ConfigEntity>>> index() async{
    var result =  await _configLocalDatasource.index();

    return result.fold((l) => Left(l), (r) => Right(r.map((e) => e.toEntity()).toList()));
  }

  @override
  Future<Either<AppException, bool>> selected(ConfigEntity config) {
    // TODO: implement selected
    throw UnimplementedError();
  }




}