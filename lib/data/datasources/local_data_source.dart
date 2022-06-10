import 'package:storelist/data/datasources/db/db_helper.dart';
import 'package:storelist/data/models/store_model.dart';
import 'package:storelist/utils/exception.dart';

abstract class LocalDataSource {
  Future<StoreModel?> getStore(int id);
  Future<List<StoreModel?>> getStoreList();
  Future<void> saveStoreList(StoreModel store);
}

class LocalDataSourceImpl implements LocalDataSource {
  final DatabaseHelper databaseHelper;

  LocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<StoreModel?> getStore(int id) async {
    final results = await databaseHelper.getStore(id);

    if (results != null) {
      return StoreModel.fromMap(results);
    } else {
      return null;
    }
  }

  @override
  Future<List<StoreModel>> getStoreList() async {
    final results = await databaseHelper.getStoreList();
    return results.map((e) => StoreModel.fromMap(e)).toList();
  }

  @override
  Future<void> saveStoreList(StoreModel store) async {
    try {
      await databaseHelper.saveStoreList(store);
    } on DatabaseException catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
