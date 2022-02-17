part of 'transkrip_cubit.dart';

abstract class TranskripState extends Equatable {
  const TranskripState();

  @override
  List<Object> get props => [];
}

class TranskripInitial extends TranskripState {}

class TranskripLoading extends TranskripState {}

class TranskripSuccess extends TranskripState {
  final TranskripModel data;

  const TranskripSuccess(this.data);

  @override
  List<Object> get props => [data];
}

class TranskripError extends TranskripState {
  final String message;

  const TranskripError(this.message);

  @override
  List<Object> get props => [message];
}
