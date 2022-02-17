part of 'khs_cubit.dart';

abstract class KhsState extends Equatable {
  const KhsState();

  @override
  List<Object> get props => [];
}

class KhsInitial extends KhsState {}

class KhsLoading extends KhsState {}

class KhsSuccess extends KhsState {
  final KHSModel data;

  const KhsSuccess(this.data);

  @override
  List<Object> get props => [data];
}

class KhsError extends KhsState {
  final String message;

  const KhsError(this.message);

  @override
  List<Object> get props => [message];
}
