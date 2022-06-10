import 'package:dartz/dartz.dart';
import 'package:storelist/utils/failure.dart';

import '../entities/store.dart';
import '../repositories/store_repository.dart';

class SaveStoreList {
  final StoreRepository repository;

  SaveStoreList(this.repository);
  Future<Either<Failure, void>> execute(Store store) async {
    return repository.saveStoreList((store));
  }
}
