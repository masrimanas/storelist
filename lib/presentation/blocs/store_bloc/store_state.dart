part of 'store_bloc.dart';

abstract class StoreState extends Equatable {
  const StoreState();

  @override
  List<Object> get props => [];
}

class StoreIsEmpty extends StoreState {
  const StoreIsEmpty();

  @override
  List<Object> get props => [];
}

class StoreLoadInProgress extends StoreState {
  const StoreLoadInProgress();

  @override
  List<Object> get props => [];
}

class StoreHasData extends StoreState {
  final List<Store> stores;

  const StoreHasData({
    required this.stores,
  });

  @override
  List<Object> get props => [stores];
}
