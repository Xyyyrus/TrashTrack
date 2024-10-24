import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trashtrack_user/data/repositories/route_repository.dart';
import 'package:trashtrack_user/models/route/route.dart' as rm;

part 'get_routes_event.dart';
part 'get_routes_state.dart';

typedef GRBT = Bloc<GetRoutesEvent, GetRoutesState>;

class GetRoutesBloc extends GRBT {
  final RouteRepository repository;

  GetRoutesBloc(this.repository) : super(GetRoutesInitialState()) {
    on<GetRoutesEvent>((event, emit) async {
      emit(GetRoutesProcessingState());

      final result = await repository.getRoutes();

      result.fold((String l) {
        emit(GetRoutesErrorState(l));
      }, (List<rm.Route> r) {
        emit(GetRoutesSuccessfulState(r));
      });
    });
  }
}
