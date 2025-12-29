import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v2ray_vpn/core/data/local/database_service.dart';
import 'package:v2ray_vpn/core/error/exeptions.dart';
import 'package:v2ray_vpn/features/home/data/models/config_model.dart';

abstract class ConfigLocalDatasource {
  Future<Either<AppException, ConfigModel>> create(Map<String, dynamic> data);
  Future<Either<AppException, List<ConfigModel>>> index();
  Future<Either<AppException, bool>> selected(int configId);
  Future<Either<AppException, bool>> delete(int configId);
}



class ConfigLocalDatasourceImpl implements ConfigLocalDatasource {
  ConfigLocalDatasourceImpl(this._databaseService);

  final DatabaseService _databaseService;

  @override
  Future<Either<AppException, ConfigModel>> create(Map<String, dynamic> data) async{
    try {
      final db = await _databaseService.database;

      await db.query(
        _databaseService.tableConfigsName,
        where: 'text = ?',
        whereArgs: [data['text']],
      ).then((value) async {
        if (value.isNotEmpty) {
          await db.delete(
            _databaseService.tableConfigsName,
            where: 'text = ?',
            whereArgs: [data['text']],
          );
        }
      });

      final int id = await db.insert(
        _databaseService.tableConfigsName,
        data,
      );

      final model = ConfigModel.fromJson({
        ...data,
        'id': id,
      });

      return Right(model);
    } catch (e) {
      return Left(CacheException(message: e.toString()));
    }
  }

  @override
  Future<Either<AppException, bool>> delete(int configId) async{
    try {
      final db = await _databaseService.database;

      await db.delete(
        _databaseService.tableConfigsName,
        where: 'id = ?',
        whereArgs: [configId],
      );

      return Right(true);
    } catch (e) {
      return Left(CacheException(message: e.toString()));
    }
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
  Future<Either<AppException, bool>> selected(int configId) async{
    try {
      final db = await _databaseService.database;

      await db.query(
        _databaseService.tableConfigsName,
        where: 'selected = ?',
        whereArgs: [1],
      ).then((value) async {
        if (value.isNotEmpty) {
          await db.update(
            _databaseService.tableConfigsName,
            {
              'selected': 0,
            },
            where: 'id = ?',
            whereArgs: [value.first['id']],
          );
        }
      });

      await db.update(
        _databaseService.tableConfigsName,
        {
          'selected': 1,
        },
        where: 'id = ?',
        whereArgs: [configId],
      );

      return Right(true);
    } catch (e) {
      return Left(CacheException(message: e.toString()));
    }
  }

}





final configLocalDatasourceProvider = Provider<ConfigLocalDatasource>((ref) {
  final databaseService = ref.watch(databaseServiceProvider);
  return ConfigLocalDatasourceImpl(databaseService);
});