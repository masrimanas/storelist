import 'package:dartz/dartz.dart';
import 'package:storelist/domain/repositories/store_repository.dart';
import 'package:storelist/utils/failure.dart';

import '../entities/store.dart';

class GetStoreListRemotely {
  final StoreRepository repository;

  GetStoreListRemotely(this.repository);
  Future<Either<Failure, List<Store>>> execute(
      String username, String password) {
    return repository.getStoreListRemotely(username, password);
  }
}
