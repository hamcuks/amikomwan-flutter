part of 'send_qr_cubit.dart';

abstract class SendQrState extends Equatable {
  const SendQrState();

  @override
  List<Object> get props => [];
}

class SendQrInitial extends SendQrState {}

class SendQrLoading extends SendQrState {}

class SendQrSuccess extends SendQrState {}

class SendQrError extends SendQrState {
  final int statusCode;

  const SendQrError(this.statusCode);

  @override
  List<Object> get props => [statusCode];
}
