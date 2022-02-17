part of 'transkrip_cubit.dart';

abstract class TranskripState extends Equatable {
  const TranskripState();

  @override
  List<Object> get props => [];
}

class TranskripInitial extends TranskripState {}

class TranskripLoading extends TranskripState {}

class TranskripSuccess extends TranskripState {
  TranskripModel data;

  TranskripSuccess(this.data);

  @override
  // TODO: implement props
  List<Object> get props => [data];
}

class TranskripError extends TranskripState {
  String message;

  TranskripError(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
