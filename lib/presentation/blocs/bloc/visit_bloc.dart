import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'visit_event.dart';
part 'visit_state.dart';

class VisitBloc extends Bloc<VisitEvent, VisitState> {
  VisitBloc() : super(const VisitInitial()) {
    on<VisitPressed>(
      ((event, emit) async {
        emit(VisitIsSuccess(isVisited: event.isVisited));
      }),
    );
  }
}
