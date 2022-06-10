part of 'visit_bloc.dart';

@immutable
abstract class VisitState extends Equatable {
  const VisitState();

  @override
  List<Object> get props => [];
}

class VisitInitial extends VisitState {
  const VisitInitial();
  @override
  List<Object> get props => [];
}

class VisitIsSuccess extends VisitState {
  final bool isVisited;

  const VisitIsSuccess({
    required this.isVisited,
  });

  @override
  List<Object> get props => [isVisited];
}
