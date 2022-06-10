import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:storelist/domain/usecases/get_store_list_remotely.dart';

import '../../../domain/entities/store.dart';

part 'store_event.dart';
part 'store_state.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  final GetStoreListRemotely _getStoreList;

  StoreBloc(
    this._getStoreList,
  ) : super(const StoreIsEmpty()) {
    on<StoreListLoadInitialize>((event, emit) async {
      emit(const StoreLoadInProgress());
      final results = await _getStoreList.execute('pitjarus', 'admin');
      results.fold((failure) {
        return failure.message;
      }, (data) {
        emit(StoreHasData(stores: data));
      });
    });
  }
}
