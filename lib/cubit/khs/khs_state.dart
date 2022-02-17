part of 'khs_cubit.dart';

abstract class KhsState extends Equatable {
  const KhsState();

  @override
  List<Object> get props => [];
}

class KhsInitial extends KhsState {}

class KhsLoading extends KhsState {}

class KhsSuccess extends KhsState {
  KHSModel data;

  KhsSuccess(this.data);

  @override
  // TODO: implement props
  List<Object> get props => [data];
}

class KhsError extends KhsState {
  String message;

  KhsError(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
