part of 'get_routes_bloc.dart';

@immutable
sealed class GetRoutesState {}

class GetRoutesInitialState extends GetRoutesState {}

class GetRoutesProcessingState extends GetRoutesState {}

class GetRoutesSuccessfulState extends GetRoutesState {
  final List<rm.Route> routes;

  GetRoutesSuccessfulState(this.routes);
}

class GetRoutesErrorState extends GetRoutesState {
  final String message;

  GetRoutesErrorState(this.message);
}
