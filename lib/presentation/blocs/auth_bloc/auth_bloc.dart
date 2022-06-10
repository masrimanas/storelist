import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'package:storelist/domain/usecases/get_store_list_remotely.dart';
import 'package:storelist/domain/usecases/save_store_list.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetStoreListRemotely _getStoreList;
  final SaveStoreList _saveStoreList;

  AuthBloc(
    this._getStoreList,
    this._saveStoreList,
  ) : super(AuthUnAuthenticated()) {
    on<AuthLogInPressed>((event, emit) async {
      emit(AuthAuthenticationLoading());
      final results =
          await _getStoreList.execute(event.username, event.password);

      results
          .fold((failure) => emit(AuthAuthenticationFailure(failure.message)),
              (data) async {
        emit(const AuthAuthenticationSuccess());

        Future.microtask(() async {
          for (var store in data) {
            await _saveStoreList.execute(store);
          }
        });
      });
    });
    on<AuthLogOutPressed>((event, emit) {
      emit(AuthUnAuthenticated());
    });
  }
}
