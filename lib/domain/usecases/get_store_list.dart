import 'package:dartz/dartz.dart';
import 'package:storelist/domain/repositories/store_repository.dart';

import '../../utils/failure.dart';
import '../entities/store.dart';

class GetStoreList {
  final StoreRepository repository;

  GetStoreList(this.repository);

  Future<Either<Failure, List<Store>>> execute() {
    return repository.getStoreList();
  }
}
