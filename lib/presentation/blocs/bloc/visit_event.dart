part of 'visit_bloc.dart';

abstract class VisitEvent extends Equatable {
  const VisitEvent();

  @override
  List<Object> get props => [];
}

class VisitPressed extends VisitEvent {
  final bool isVisited;

  const VisitPressed(
    this.isVisited,
  );

  @override
  List<Object> get props => [isVisited];
}
