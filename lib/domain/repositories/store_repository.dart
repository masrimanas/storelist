import 'package:dartz/dartz.dart' show Either;
import 'package:storelist/domain/entities/store.dart';
import 'package:storelist/utils/failure.dart';

abstract class StoreRepository {
  Future<Either<Failure, List<Store>>> getStoreListRemotely(
      String username, String password);
  Future<Either<Failure, List<Store>>> getStoreList();
  Future<Either<Failure, Store>> getStore(int id);
  Future<Either<Failure, void>> saveStoreList(Store store);
}
