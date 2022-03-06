part of 'ktm_cubit.dart';

abstract class KtmState extends Equatable {
  const KtmState();

  @override
  List<Object> get props => [];
}

class KtmInitial extends KtmState {}

class KtmLoading extends KtmState {}

class KtmSuccess extends KtmState {
  final Uint8List data;

  const KtmSuccess(this.data);

  @override
  List<Object> get props => [data];
}

class KtmError extends KtmState {
  final String message;

  const KtmError(this.message);

  @override
  List<Object> get props => [message];
}
