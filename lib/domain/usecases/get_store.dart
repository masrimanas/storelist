import 'package:dartz/dartz.dart';

import 'package:storelist/domain/repositories/store_repository.dart';

import '../../utils/failure.dart';
import '../entities/store.dart';

class GetStore {
  StoreRepository repository;

  GetStore(this.repository);

  Future<Either<Failure, Store>> execute(int id) {
    return repository.getStore(id);
  }
}
