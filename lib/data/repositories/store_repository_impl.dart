import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:storelist/data/datasources/local_data_source.dart';
import 'package:storelist/data/datasources/remote_data_source.dart';
import 'package:storelist/domain/entities/store.dart';
import 'package:storelist/domain/repositories/store_repository.dart';
import 'package:storelist/utils/exception.dart';
import 'package:storelist/utils/failure.dart';

import '../models/store_model.dart';

class StoreRepositoryImpl implements StoreRepository {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  StoreRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Store>> getStore(int id) async {
    try {
      final result = await localDataSource.getStore(id);
      return Right(result!.toEntity());
    } on ServerException catch (e) {
      return Left(Failure(e.message.toString()));
    } on SocketException {
      return const Left(Failure('Gagal'));
    }
  }

  @override
  Future<Either<Failure, List<Store>>> getStoreList() async {
    final results = await localDataSource.getStoreList();
    return Right(results.map((e) => e!.toEntity()).toList());
  }

  @override
  Future<Either<Failure, List<Store>>> getStoreListRemotely(
      String username, String password) async {
    try {
      final result =
          await remoteDataSource.getStoreRemotely(username, password);
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(Failure(e.message.toString()));
    } on SocketException {
      return const Left(Failure('Gagal'));
    }
  }

  @override
  Future<Either<Failure, void>> saveStoreList(Store store) async {
    try {
      await localDataSource.saveStoreList(StoreModel.fromEntity(store));
      void saved = log('Saved to Database');
      return Right(saved);
    } on DatabaseException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
