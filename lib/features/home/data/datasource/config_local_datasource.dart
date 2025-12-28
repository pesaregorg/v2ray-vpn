import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v2ray_vpn/core/data/local/database_service.dart';
import 'package:v2ray_vpn/core/error/exeptions.dart';
import 'package:v2ray_vpn/features/home/data/models/config_model.dart';

abstract class ConfigLocalDatasource {
  Future<Either<AppException, ConfigModel>> create(Map<String, dynamic> data);
  Future<Either<AppException, List<ConfigModel>>> index();
  Future<Either<AppException, bool>> selected(ConfigModel config);
  Future<Either<AppException, bool>> delete(ConfigModel config);
}



class ConfigLocalDatasourceImpl implements ConfigLocalDatasource {
  ConfigLocalDatasourceImpl(this._databaseService);

  final DatabaseService _databaseService;

  @override
  Future<Either<AppException, ConfigModel>> create(Map<String, dynamic> data) async{
    try {
      final db = await _databaseService.database;

      await db.insert(_databaseService.tableConfigsName, data);

      return Right(ConfigModel.fromJson(data));
    } catch (e) {
      return Left(CacheException(message: e.toString()));
    }
  }

  @override
  Future<Either<AppException, bool>> delete(ConfigModel config) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<AppException, List<ConfigModel>>> index() async{
    try {
      final db = await _databaseService.database;

      var res = await db.query(_databaseService.tableConfigsName);

      List<ConfigModel> data = res.map((e) => ConfigModel.fromJson(e)).toList();

      return Right(data);
    } catch (e) {
      return Left(CacheException(message: e.toString()));
    }
  }

  @override
  Future<Either<AppException, bool>> selected(ConfigModel config) {
    // TODO: implement selected
    throw UnimplementedError();
  }

}





final configLocalDatasourceProvider = Provider<ConfigLocalDatasource>((ref) {
  final databaseService = ref.watch(databaseServiceProvider);
  return ConfigLocalDatasourceImpl(databaseService);
});