import 'package:get_it/get_it.dart';
import 'package:storelist/data/datasources/db/db_helper.dart';
import 'package:storelist/data/datasources/local_data_source.dart';
import 'package:storelist/data/datasources/remote_data_source.dart';

import 'package:http/http.dart' as http show Client;
import 'package:storelist/data/repositories/store_repository_impl.dart';
import 'package:storelist/domain/repositories/store_repository.dart';
import 'package:storelist/domain/usecases/get_store_list_remotely.dart';
import 'package:storelist/domain/usecases/save_store_list.dart';
import 'package:storelist/presentation/blocs/auth_bloc/auth_bloc.dart';

import 'domain/usecases/get_store.dart';
import 'domain/usecases/get_store_list.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(
    () => AuthBloc(locator(), locator()),
  );

  // use cases
  locator.registerLazySingleton(() => GetStore(locator()));
  locator.registerLazySingleton(() => GetStoreList(locator()));
  locator.registerLazySingleton(() => GetStoreListRemotely(locator()));
  locator.registerLazySingleton(() => SaveStoreList(locator()));

  // repository
  locator.registerLazySingleton<StoreRepository>(() => StoreRepositoryImpl(
        localDataSource: locator(),
        remoteDataSource: locator(),
      ));

  // data sources
  locator.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(databaseHelper: locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // external
  locator.registerLazySingleton(() => http.Client());
}
