part of 'akademik_cubit.dart';

abstract class AkademikState extends Equatable {
  const AkademikState();

  @override
  List<Object> get props => [];
}

class AkademikInitial extends AkademikState {}

class AkademikLoading extends AkademikState {}

class AkademikSuccess extends AkademikState {
  final AkademikModel data;

  const AkademikSuccess(this.data);

  @override
  List<Object> get props => [data];
}

class AkademikError extends AkademikState {
  final String message;

  const AkademikError(this.message);

  @override
  List<Object> get props => [message];
}
